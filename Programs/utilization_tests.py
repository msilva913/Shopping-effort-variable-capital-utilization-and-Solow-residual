import os
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import scipy.io as sio
import statsmodels.api as sm
#import statsmodels.api as sm
from itertools import cycle as cycler
from fredapi import Fred
import pickle
fred = Fred(api_key = 'd35aabd7dc07cd94481af3d1e2f0ecf3	')
#from statsmodels.tsa.arima_model import ARMA
pd.set_option('display.precision', 2)
#pd.options.display.float_format = '{:5,.4g}'.format

from time_series_functions import (moments, filter_transform, crosscorr)
#import statsmodels
#arima =  statsmodels.tsa.x13.x13_arima_analysis
#path = r'C:\Users\TJSEM\Dropbox\Documents - Copy\Research\Consumption diversity, entry, and goods market frictions\Programs\Estimation'

# Price deflators



def save_object(obj, filename):
    with open(filename, 'wb') as output:
        pickle.dump(obj, output, pickle.HIGHEST_PROTOCOL)  



def construct_data(init, final, freq):
    """
    Nominal GDP: BEA 191RC
		- Nominal C: BEA DNDGRC + DDURRC + DSERRC
		- Nominal I: BEA A006RC
		- Nominal H: BLS PRS85006023
		- Capacity utilization: Fed Board G.17, CAPUTL.B00004.S
		- Relative price of investment: BEA B006RG
		- Nonfarm Nominal Hourly Wage: BLS PRS85006103
		- GDP Deflator: A191RD
		- 
    
    Sectoral data Tables B6 and B7
    B6: number of nonsupervisory employees
    B7: average weekly hours
    https://www.bls.gov/ces/data/employment-situation-table-download.htm

    Table B6
    https://data.bls.gov/pdq/SurveyOutputServlet
    Employment
    CES2000000006
    CES3100000006
    CES3200000006
    CES0800000006
    
    Average weekly hours
    CES2000000007
    CES3100000007
    CES3200000007
    CES0800000007
    """
    
    sectoral = pd.read_csv("sectoral_labor.csv", sep= ",", header=0)
    date = pd.date_range(start='1/1947', periods=sectoral.shape[0], freq='MS')
    sectoral.index = date
    
    # Construct total hours
    sectoral["Durable_TH"] = sectoral["Durable Emp"]*sectoral["Durable Hours"]
    sectoral["Construction_TH"] = sectoral["Construction Emp"]*sectoral["Construction Hours"]
    sectoral["Nondurable_TH"] = sectoral["Nondurable goods Emp"]*sectoral["Nondurable Hours"]
    sectoral["Services_TH"] = sectoral["Services Emp"]*sectoral["Services Hours"]
    
    sectoral = sectoral[['Durable_TH', 'Construction_TH', 'Nondurable_TH', 'Services_TH']]
    
    " Consumption: nondurable plus services "
    sectoral["L_C"] = sectoral["Nondurable_TH"] + sectoral["Services_TH"]
    
    " Investment: construction plus durables "
    sectoral["L_I"] = sectoral["Construction_TH"] + sectoral["Durable_TH"]
    
    # Total hours
    " Aggregate to quarterly "
    sectoral = sectoral.resample(freq).mean()
    " Limit data to after 1964 (services only available since then) "
    sectoral = sectoral["1964":]
    LC = sectoral.L_C
    LI = sectoral.L_I
    L = LC + LI
    
    " GDP Deflator BEA code A191RD"
    deflator =  fred.get_series('GDPDEF').resample(freq).mean()
    #Y = fred.get_series('GDPC1').resample(freq).mean().dropna() #real, quarterly
    
    " Investment goods deflator "
    #inv_deflator = fred.get_series("INVDEF").resample(freq).mean()
    #cons_deflator = fred.get_series("CONSDEF").resample(freq).mean()           
    
    
    " Nominal consumption (BEA codes DNDGRC + DDURRC + DSERRC) "
    # Personal consumption non-durables: BEA DNDGRC
    C_ND = fred.get_series('PCND').resample(freq).mean().dropna()# monthly, nominal
    # Personal consumption expenditure services: BEA DSERRC
    C_S = fred.get_series('PCESV').resample(freq).mean().dropna()
    C = C_ND + C_S
    omega_SC = np.mean(C_S/(C))
    print(rf'$\omega_{{SC}} =$ {omega_SC:.2f}')
    
    " Nominal investment: durables (PCDG), non-residential investment (PNFI), residential investment (PRFI) "
    PCDG = fred.get_series("PCDG").resample(freq).mean().dropna()
    PNFI = fred.get_series("PNFI").resample(freq).mean().dropna()
    PRFI = fred.get_series("PRFI").resample(freq).mean().dropna()
    I = PCDG + PNFI + PRFI
    np.mean(PCDG/I)
    " Price index of consumption goods "
    # non-durables
    #p_ND = fred.get_series('DNDGRG3Q086SBEA').resample(freq).mean().dropna()
    # Services 
    #p_S = fred.get_series("DSERRG3Q086SBEA").resample(freq).mean().dropna()
    # Combine using Tornquist index
    #p_C = p_S*C_S/C + p_ND*C_ND/C
    p_C = fred.get_series("PCEPI").resample(freq).mean().dropna()
    # p_C_alt = fred.get_series("PCEPI").resample(freq).mean().dropna()
    # plt.plot(p_C.pct_change(), label="weighted measure")
    # plt.plot(p_C_alt.pct_change(), label="import")
    # plt.legend()
    #p = pd.concat([p_S, p_ND], axis=1)
    #q = pd.concat([C_S, C_ND], axis=1)
  
    #p_C = Fisher_index(p, q)
    #C = fred.get_series('PCEC').resample(freq).mean()# monthly, nominal
    
    " Price index for investment goods "
    #p_I = fred.get_series("A006RD3Q086SBEA").resample(freq).mean().dropna()
    p_I = fred.get_series("INVDEF").resample(freq).mean().dropna()
   
    #Equivalent to FPI (BEA A007RC) and change in business inventories (BEA CBI)
    #https://apps.bea.gov/iTable/?reqid=19&step=2&isuri=1&categories=underlying#eyJhcHBpZCI6MTksInN0ZXBzIjpbMSwyLDNdLCJkYXRhIjpbWyJjYXRlZ29yaWVzIiwiU3VydmV5Il0sWyJOSVBBX1RhYmxlX0xpc3QiLCIyMDcxIl1dfQ==
    #I = fred.get_series("GPDI").resample(freq).mean().dropna()
    
    " Non-institutional population "
    pop = fred.get_series('CNP16OV').resample(freq).mean()
    # Use HP-filtered trend for population to avoid discrete jumps around census dates
    pop = sm.tsa.filters.hpfilter(pop, lamb=10_000)[1]
    
    " Total factor productivity "
    dtfp = pd.read_csv('quarterly_tfp.csv', header=0, nrows=304, sep=';' )
    #dtfp = dtfp[dtfp['date'] < '2023:Q4']
    date = pd.date_range(start='1947Q1', periods=dtfp.shape[0], freq='Q')
    dtfp.index = date
    dtfp = dtfp[['dtfp', 'dtfp_util', 'dtfp_I', 'dtfp_C', 'dtfp_I_util', 'dtfp_C_util']]
    # Find cumulative sum of each series
    tfp = np.exp(np.cumsum(dtfp/400))
    # Extract components
    SR = tfp.dtfp
    #SR_util = tfp.dtfp_util
    
    " Relative price of investment goods "
    #p_I = fred.get_series('PIRIC').resample('Q').mean()
  
    #p_C = fred.get_series("DPCERD3Q086SBEA").resample(freq).mean().dropna()
    #Personal consumption expenditures: services
    
    " Labor productivity for consumption and investment"
    #lab_prod = (C/p_C+I/p_I)/(L)
    #lab_prod = fred.get_series("OPHNFB").resample(freq).mean().dropna()
  
    
    " Labor share "
    # Real GDP: 
    # Y_agg = fred.get_series("GDP").resample(freq).mean().dropna()
    # #Y_agg = Y_agg/deflator
    # #non-farm weekly hours: BLS PRS85006023
    # H = fred.get_series("PRS85006023").resample(freq).mean().dropna()
    # w = fred.get_series('CES0500000003').resample(freq).mean().dropna()
    # w/(Y_agg/H)

    
    c = C/(pop*p_C)
    i = I/(pop*p_I)
    
    Y = C + I
    lab_prod = Y/(deflator*L)
    y = Y/(pop*deflator)
    " Construct output from consumption and investment "
    
    " Wages "
    w = fred.get_series("COMPNFB").resample(freq).mean().dropna()
    w = w/p_C
    #y = c + i
    lc = LC/pop
    li = LI/pop
    l = L/pop
    " Relative price of investment: divide price indices"
    p_I = p_I/p_C
    
    " Capacity utilization "
    util = fred.get_series('TCU').resample(freq).mean().dropna()
    # Durable manufacturing
    util_D = fred.get_series('CAPUTLGMFDS').resample(freq).mean().dropna()
    # nondurable manufacturing
    util_ND = fred.get_series('CAPUTLGMFNS').resample(freq).mean().dropna()
    
    u = fred.get_series('UNRATE').resample(freq).mean().dropna()
    
  
    " Note: these series imply labor productivity in each sector "
    " List of data series "
    var_load_list = [y, c, i, lc, li, l, lab_prod, p_I, SR, util, util_D, util_ND, u, w] 
    return var_load_list

def construct_data_monthly(init, final, freq='MS'):
  
    " Capacity utilization "
    #util = fred.get_series('TCU').resample(freq).mean().dropna()
    # Durable manufacturing
    util_D = fred.get_series('CAPUTLGMFDS').resample(freq).mean().dropna()
    # nondurable manufacturing
    util_ND = fred.get_series('CAPUTLGMFNS').resample(freq).mean().dropna()
    
    u = fred.get_series('UNRATE').resample(freq).mean().dropna()
    
    " Note: these series imply labor productivity in each sector "
    " List of data series "
    var_load_list = [util_D, util_ND, u] 
    return var_load_list

        
        

if __name__ == "__main__":
    # Baseline
    init= '1964-01-01'
    final = '2019-12-30'
    # Comparison to earlier BRS
    #init = '1967-01-01'
    load = False
    #filter_type = 'hamilton'
    freq = 'Q'
    save_observables = True
    
    if load:
        var_load_list = pickle.load(open("var_load_list", "rb"))
    else:
        var_load_list = construct_data(init, final, freq)
        save_object(var_load_list, 'var_load_list')
    
    dat = pd.concat(var_load_list, axis=1)
    lab = ['Y', 'C', 'I', 'NC', 'NI', 'N', "lab_prod", 'p_I', 'SR', 'util', 'util_D', 'util_ND', 'u', 'w']
    dat.columns = lab
    """
    Create cycles
    (1) Use growth rates for estimation (Smets and Wouters 2007)
    (2) Use Hamilton filter for description
    """
    
    cycle_growth = pd.concat([filter_transform(dat[x], init=init, final=final, transform_type='log',
                                        filter_type="growth", demean=False) for x in lab], axis=1)
    cycle_growth.columns = lab
    print(cycle_growth.mean())
    cycle_growth = cycle_growth - cycle_growth.mean()
    mom_growth_data = moments(100*cycle_growth, lab=['I', 'NI'], lags=[1])
    print(mom_growth_data.style.format(precision=2).to_latex())
    
     
    if save_observables:
        " Save relevant objects "
        #save_object(cycle, 'cycle')
        " Save output for estimation using growth filter"
        lab_obs = ['Y_obs', 'C_obs', 'I_obs', 'NC_obs', 'NI_obs', 'N_obs',
               'Y_N_obs', 'p_I_obs', 'SR_obs', 'SR_util_obs', 'util_obs', 'util_D_obs', 'util_ND_obs', 'w_obs']
        dic_data = dict(zip(lab_obs, [np.asarray(cycle_growth[x]) for x in cycle_growth.columns]))
        sio.savemat('observables_sectoral.mat', dic_data)
    
    
    
    # Stacked moments
    stds = cycle_growth.std(axis=0)
    stds = 100*stds[["Y", "C", "I", "NC", "NI", "p_I", "util_ND", "util_D", "u"]]
    stds = pd.DataFrame(stds)
    stds.index = ["std(Y)", "std(C)", "std(I)", "std(NC)", "std(NI)", "std(p_I)", 
                  "std(util_ND)", "std(util_D)", "std(u)"]
    corrs = np.zeros((9, 1))
    corr_mat = cycle_growth.corr()
    corrs[0] = corr_mat['C']['I']
    corrs[1] = corr_mat['C']['NI'python
    corrs[2] = corr_mat['C']['lab_prod']
    corrs[3] = corr_mat['C']['util']
    corrs[4] = corr_mat['NC']['NI']
    corrs[5] = corr_mat['util_D']['util_ND']
    corrs[6] = corr_mat['p_I']['I']
    corrs[7] = corr_mat["u"]['util_D']
    corrs[8] = corr_mat['u']['util_ND']
    cor_dat = pd.DataFrame(corrs)
    cor_dat.index = ["Cor(C, I)", "Cor(C, N_I)",  "Cor(C, lab_prod)", "Cor(C, util)",
                     "Cor(N_C, N_I)" , "Corr(util_D, util_ND)", "Cor(p_I, I)", "Cor(u, util_D)", "Cor(u, util_ND)"]
    autocorr_dat = np.zeros((3, 1))
    autocorr_dat[0] = cycle_growth.NC.autocorr()
    autocorr_dat[1] = cycle_growth.NI.autocorr()
    autocorr_dat[2] = cycle_growth.u.autocorr()
    autocorr_dat = pd.DataFrame(autocorr_dat)
    autocorr_dat.index = ["Cor(N_C, N_{C,-1})", "Cor(N_I, N_{I,-1})", "Corr(u, u_{u,-1})"]
    summ = pd.concat([stds, cor_dat, autocorr_dat])
    print(summ.style.format(precision=2).to_latex())
    
    " Plots using Hamilton regression filtered data "
    cycle =  pd.concat([filter_transform(dat[x], init=init, final=final, transform_type='log',
                                         filter_type="hamilton", demean=True) for x in lab], axis=1)
    #cycle =  pd.concat([filter_transform(dat[x], init=init, final=final, transform_type='log',
                                     #    filter_type="hp_filter", demean=True) for x in lab], axis=1)
    cycle.columns = lab
   
    
    " Choose specific variable set "
    #cycle_red = cycle[["Y", "I", "lab_prod", "SR", "p_I", "SR_util", "cu"]]

    mom_data = moments(100*cycle, lab=['I', 'NI']) 
    print(mom_data.style.format(precision=2).to_latex())
    
    " Save moments "
    # Moments from data in growth rates and Hamilton-filtered data
    save_object(mom_data, 'mom_data')
    
    # Do plots
    
    import matplotlib.dates as mdates
    years = mdates.YearLocator(5, month=1)
    years_fmt = mdates.DateFormatter('%Y')
    
 
    
    " Plot "
    def plot_cycle(cycle, comp_variable="LI"):
        " Plots cycle for a given decomposition "
        nvars = cycle.shape[1]
        linestyles = ['-', '--']
        col_cycle = cycler(cycle.columns)
        lsty_cycler = cycler(linestyles)
        fig = plt.figure(figsize=(14, 8))
        next(col_cycle)
        for n in range(nvars-1):
            ax = fig.add_subplot(3, 2, n+1)
            z = next(col_cycle)
            ax.plot(cycle[comp_variable], label=comp_variable, lw=2, alpha=0.6, linestyle=next(lsty_cycler))
            ax.plot(cycle[z], label=f"{z}", lw=2, alpha=0.6, linestyle=next(lsty_cycler))
            ax.legend(loc='upper right')
            ax.xaxis.set_major_locator(years)
            #ax.set_ylim(-0.15, 0.15)
            ax.xaxis.set_major_formatter(years_fmt)
            ax.grid(True)
        plt.savefig('output_comovement_simp.pdf')
        plt.tight_layout()
        plt.show()
    
 
    
    linestyle = ['-', ':', '-.']
    # Hours
    fig, ax = plt.subplots(figsize=(11, 4))
    ax.plot(100*cycle.NC, linestyle[0], label= "Hours: consumption", lw=2, alpha=0.7)
    ax.plot(100*cycle.NI, linestyle[1], label= "Hours: investment", lw=2, alpha=0.7)
    ax.plot(100*cycle.N, linestyle[2], label= "Hours: aggregate", lw=2, alpha=0.7)
    ax.legend(loc="upper right")
    ax.xaxis.set_major_locator(years)
    ax.xaxis.set_major_formatter(years_fmt)
    ax.set_ylabel("%")
    ax.grid(True)
    plt.tight_layout()
    plt.savefig("hours_comovement.pdf")
    plt.show()
    
    # Utilization
    fig, ax = plt.subplots(figsize=(11, 4))
    ax.plot(100*cycle.util_D, linestyle[0], label= "Utilization: durables", lw=2, alpha=0.7)
    ax.plot(100*cycle.util_ND, linestyle[1], label= "Utilization: nondurables", lw=2, alpha=0.7)
    ax.plot(100*cycle.u, linestyle[2], label="Unemployment rate", lw=2, alpha=0.7)
    #ax.plot(100*cycle.util, linestyle[2], label= "Utilization: total industry", lw=2, alpha=0.7)
    ax.legend(loc="upper right")
    ax.xaxis.set_major_locator(years)
    ax.xaxis.set_major_formatter(years_fmt)
    ax.set_ylabel("%")
    ax.grid(True)
    plt.tight_layout()
    plt.savefig("util_u_comovement.pdf")
    plt.show()
    
    # In levels 
    # 1) Plot
    var_load_list = construct_data_monthly(init, final)
    
    util_D, util_ND, u = var_load_list
    e = 100 - u
    dat_levels = pd.concat([util_D, util_ND, e], axis=1)
    lab = ['util_D', 'util_ND', 'e']
    dat_levels.columns = lab
    
    fig, ax = plt.subplots(figsize=(11, 4))
    ax.plot(dat_levels.util_D, linestyle[0], label= "Utilization: durables", lw=2, alpha=0.7)
    ax.plot(dat_levels.util_ND, linestyle[1], label= "Utilization: nondurables", lw=2, alpha=0.7)
    ax.plot(dat_levels.e, linestyle[2], label="Employment rate", lw=2, alpha=0.7)
    ax.legend(loc="upper right")
    ax.xaxis.set_major_locator(years)
    ax.xaxis.set_major_formatter(years_fmt)
    ax.set_ylabel("%")
    ax.grid(True)
    plt.tight_layout()
    plt.savefig("util_e_levels.pdf")
    plt.show()
    
    
    # 2) Dynamic correlations
    def dynamic_correlations(cycle, var, ylabel, nleads=12, nlags=12, title=None,
                             savefig=None):
        fig, ax = plt.subplots(figsize=(14, 5))
        # Loop over variables
        x = cycle[var[0]]
        y = cycle[var[1]]
        rs = pd.Series([x.corr(y.shift(-lag))] for lag in range(-nlags, nleads))
        rs = pd.Series([crosscorr(cycle[var[0]], cycle[var[1]], -lag) for lag in range(-nlags, nleads)])
        ax.axhline(y=0.0, color="black", linestyle="--")
        ax.plot(rs, '-', alpha=0.7, linewidth=2.0)
        ax.axvline(np.argmax(abs(rs)),linestyle='--', color='red')
        ax.set_xlabel(r'$\Delta$ (monthly)', fontsize=14)
        ax.set_ylabel(ylabel, fontsize=14)
        ax.set_xticks(range(0, len(rs)))
        ax.set_xticklabels(range(-nlags, nleads))
        if title is not None:
            ax.set_title(title, fontsize=14)
        #ax.legend(loc = "upper left", fontsize=14)
        ax.axvline(nlags, color="black")
        plt.tight_layout()
        if savefig is not None:
            plt.savefig(savefig)
    
    ylabel=r'$Corr(util_{D,t}, e_{t+\Delta})$'
    labels = ["Utilization", "Employment"]
    var = ["util_D", "e"]
    
    dynamic_correlations(dat_levels, var, ylabel, title="Dynamic correlations between utilization and employment")
    var = ["util_ND", "e"]
    dynamic_correlations(dat_levels, var, ylabel, title="Dynamic correlations between utilization and employment")

    
    # Granger causality tests
    from statsmodels.tsa.stattools import grangercausalitytests
    dat_levels_red = dat_levels[["util_D", "e"]].dropna()
    
    def granger_causality_test(series1, series2, maxlag=12):
        # Tests wehther time series in second column Granger causes time series in the first column
        # Null hypothesis: x2 does not Granger cause x1
        data = pd.DataFrame({'Series1': series1, 'Series2': series2})
        data = data.dropna()
        res = grangercausalitytests(data, maxlag=maxlag)
        return res[3][0]['ssr_ftest'][1]  # Get p-value for lag 4

    p_value_utilD_e = granger_causality_test(util_D, e)
    p_value_e_utilD = granger_causality_test(e, util_D)
    
    print("Granger causality from e to util_D:")
    print("p-value:", p_value_utilD_e)

    print("Granger causality from util_D to e:")
    print("p-value:", p_value_e_utilD)
    
    # VAR
    from statsmodels.tsa.api import VAR
    # Variable occurring first does not affect variables coming after
    data = pd.concat([util_D, e], axis=1)
    data_VAR = data_VAR.dropna()
    model = VAR(data_VAR)
    res = model.fit(12)
    irf = res.irf(36)
    irf.plot(orth=True)
    
    def var_estimate(data, p):
        # Design matrix (nxk), k=(nlags*nvars)
        X = pd.concat([data.shift(periods=i) for i in range(1,p+1)], axis=1)
        # Lose p observations from missing values
        X = X.dropna()
        Y = data.iloc[p:] 
        # OLS regression: Y = Xbeta + eps
        A = np.linalg.solve(X.T@X, X.T@Y)
        # Want to rewrite as  A = [A_1, .... A_p], where A_i is nxn (2x2 in simple case)
        return A.T
    
    A = var_estimate(data, 12)
    
    def impulse_response(A, n_periods):
        # jth column of irf[i] represents the effect of one-unit shock to jth variable on all variables after i periods
        n = A.shape[0] # number of variables
        p = int(coeffs.shape[1]/k) # number of lags
        irf = np.zeros((n_periods + 1, n, n))
        irf[0] = np.eye(k)
        # Array A_i
        A_i = A.reshape((n, n, p))
        for i in range(1, n_periods + 1):
            
            irf[i] = irf[i - 1].dot(A_i[:, :, 0])
            # contribution of current lag to to irf for period i
            for j in range(1, p):
                irf[i] += irf[i - j - 1].dot(A_i[:, :, j])
        return irf
    
    def structural_irf(B, n_periods):
        B = B.T
        k = B.shape[0]
        p = int(B.shape[1] / k)
        sirf = np.zeros((n_periods + 1, k, k))
        sirf[0] = np.eye(k)
        B = B.reshape((k, k, p))
        for i in range(1, n_periods + 1):
            sirf[i] = sirf[i - 1].dot(B[:, :, 0])
            for j in range(1, p):
                sirf[i] += sirf[i - j - 1].dot(B[:, :, j])
        return sirf

    
    def cholesky(X):
        n, k = X.shape
        S = np.linalg.cholesky(X.T.dot(X) / (n - 1))
        return S

residuals = Y - X@coeffs
sigma = residuals.T.dot(residuals) / (residuals.shape[0] - 1)
A = np.linalg.inv(cholesky(sigma))
B = coeffs.dot(A)

sirf = structural_irf(B, n_periods)

irf = impulse_response(coeffs, 24)  # Compute IRFs for 24 periods
irf[1]

fig, ax = plt.subplots()
periods = range(24)
imp = [irf[t][1][0] for t in range(24)]
ax.plot(periods, imp, label="Utilization shock on employment")
plt.show()
    

   
    
    
    " Two types of Solow residual "
    fig, ax = plt.subplots(figsize=(11, 4))
    ax.plot(100*cycle.SR, linestyle[1], label="Solow residual", lw=2, alpha=0.7, color="blue")
    ax.plot(100*cycle.SR_util, linestyle[2], label="Fernald utilization-adjusted Solow residual", lw=2, alpha=0.7, color="green")
    ax.xaxis.set_major_locator(years)
    ax.xaxis.set_major_formatter(years_fmt)
    ax.set_ylabel("%")
    ax.set_ylabel("Percent")
    ax.grid(True)
    plt.tight_layout()
    ax.legend(fontsize=11)
    plt.savefig("TFP_comparison.pdf")
    
    
    " Compare Fernald utilization vs capacity utilization "
    cycle["util_Fern"] = cycle.SR - cycle.SR_util
    
    
    fig, ax = plt.subplots(figsize=(11, 4))
    ax.plot(100*cycle.util_Fern, linestyle[1], label="Utilization (Fernald)", lw=2, alpha=0.6, color="blue")
    ax.plot(100*cycle.util, linestyle[2], label="Total capacity utilization", lw=2, alpha=0.6, color="green")
    ax.plot(100*cycle.Y, label="Real output (consumption plus investment)", lw=2, alpha=0.6, color="black")
    ax.xaxis.set_major_locator(years)
    ax.xaxis.set_major_formatter(years_fmt)
    ax.set_ylabel("Percent")
    ax.grid(True)
    plt.tight_layout()
    ax.legend(fontsize=11)
    plt.savefig("utilization_series_comparison.pdf")
    
    util_series = cycle[["util_Fern", "util", "Y"]]
    mom_util = moments(100*util_series)
    print(mom_util.to_latex())
    
    
    " Compare with technology series "
    smoothed_vars = sio.loadmat("smoothed_var.mat")
    smoothed_vars = smoothed_vars['smoothed_var']
    var_names = ['util_obs', 'SR_obs', 'tech_obs', 'D_obs', 'h_obs']
    # Express as list of series
    var_list = [pd.Series(smoothed_vars[key][0][0].flatten()) for key in var_names]
    smoothed_data = pd.concat(var_list, axis=1)
    smoothed_data.columns = var_names
    smoothed_data.index = cycle_growth.index
    
    smoothed_data_mom = moments(100*smoothed_data, lab=['SR_obs'], lags=[1])
    
    tech_sum = np.exp(smoothed_data.tech_obs.cumsum())
    SR_util = np.exp(cycle_growth.SR_util.cumsum())
    tech_sum = tech_sum.pct_change(periods=4)*100
    SR_util = SR_util.pct_change(periods=4)*100
    

    fig, ax = plt.subplots()
    ax.plot(smoothed_data.tech_obs, label="Smoothed model-based technology series")
    ax.plot(smoothed_data.SR_obs, label="Fernald utilization-adjusted Solow residual")
    ax.xaxis.set_major_locator(years)
    ax.xaxis.set_major_formatter(years_fmt)
    ax.set_ylabel("4 Quarter Percentage Change")
    ax.grid(True)
    plt.tight_layout()
    ax.legend(fontsize=11)
    
    # Shopping effort
    D_sum = np.exp(smoothed_data.D_obs.cumsum())
    D_sum = D_sum.pct_change(periods=1)*100
    fig, ax = plt.subplots()
    ax.plot(D_sum.loc['2004':'2019'])
    
    
    
    " Dynamic correlations "
    # colors = ["red", "green", "blue"]
    # nlags = 8
    # nleads = 8
    # var_labels = (["SR", "Y"], ["SR_util", "Y"], ["SR", "SR_util"])
    # ylabels = (r'$Corr(SR_t, Y_{t+\Delta})$', r'$Corr(SR_t^{util}, Y_{t+\Delta})$', r'$Corr(SR_t, SR_{t+\Delta}^{util}$')
    # fig, ax = plt.subplots(nrows=1, ncols=1, figsize=(18, 6))
    # # Loop over variables
    # for (i, var_label) in enumerate(var_labels):
    #     rs = pd.Series([crosscorr(cycle[var_label[0]], cycle[var_label[1]], -lag) for lag in range(-nlags, nleads)])
    #     offset = np.floor(len(rs)/2)-np.argmax(rs)
    #     ax.axhline(y=0.0, color="black", linestyle="--")
    #     ax.plot(rs, linestyle[i], label=ylabels[i], alpha=0.7, linewidth=2.5, color=colors[i])
    #     ax.axvline(np.argmax(abs(rs)),linestyle='--', color=colors[i])
    #     ax.set_xlabel(r'$\Delta$ (quarters)', fontsize=14)
    #     #ax[i].set_ylabel(ylabels[i], fontsize=14)
    # ax.set_xticks(range(0, len(rs)))
    # ax.set_xticklabels(range(-nlags, nleads))
    # ax.set_title("Dynamic correlations", fontsize=12)
    # ax.legend(loc = "upper right", fontsize=14)
    # ax.axvline(nlags, color="black")
    # plt.tight_layout()
    # plt.savefig("dynamic_correlations_SR_Y.pdf")
    


