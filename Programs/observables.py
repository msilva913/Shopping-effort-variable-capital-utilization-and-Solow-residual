import os
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import scipy.io as sio
import statsmodels.api as sm
#import statsmodels.api as sm
from fredapi import Fred
import pickle
fred = Fred(api_key = 'd35aabd7dc07cd94481af3d1e2f0ecf3	')
#from statsmodels.tsa.arima_model import ARMA
pd.set_option('display.precision', 2)
#pd.options.display.float_format = '{:5,.4g}'.format

from time_series_functions import (moments, filter_transform)
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
		- GDP Deflator: A191RD
    
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
    p_C = fred.get_series("PCEPI").resample(freq).mean().dropna()
    
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
    date = pd.date_range(start='1947Q1', periods=dtfp.shape[0], freq='QE')
    dtfp.index = date
    dtfp = dtfp[['dtfp', 'dtfp_util', 'dtfp_I', 'dtfp_C', 'dtfp_I_util', 'dtfp_C_util']]
    # Find cumulative sum of each series
    tfp = np.exp(np.cumsum(dtfp/400))
    # Extract components
    SR = tfp.dtfp
    SR_util = tfp.dtfp_util
    

    " Scale by population and price index "
    c = C/(pop*p_C)
    i = I/(pop*p_I)
    
    Y = C + I
    lab_prod = Y/(deflator*L)
    y = Y/(pop*deflator)
    " Construct output from consumption and investment "
    
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
    
  
    " Note: these series imply labor productivity in each sector "
    " List of data series "
    var_load_list = [y, c, i, lc, li, l, lab_prod, p_I, SR, SR_util, util, util_D, util_ND] 
    return var_load_list


if __name__ == "__main__":
    # Baseline
    init= '1964-01-01'
    final = '2019-12-30'
    load = False
    #filter_type = 'hamilton'
    freq = 'QE'
    save_observables = False
    
    if load:
        var_load_list = pickle.load(open("var_load_list", "rb"))
    else:
        var_load_list = construct_data(init, final, freq)
        save_object(var_load_list, 'var_load_list')
    
    dat = pd.concat(var_load_list, axis=1)
    lab = ['Y', 'C', 'I', 'NC', 'NI', 'N', "lab_prod", 'p_I', 'SR', 'SR_util', 'util', 'util_D', 'util_ND']
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
               'Y_N_obs', 'p_I_obs', 'SR_obs', 'SR_util_obs', 'util_obs', 'util_D_obs', 'util_ND_obs']
        dic_data = dict(zip(lab_obs, [np.asarray(cycle_growth[x]) for x in cycle_growth.columns]))
        sio.savemat('observables_sectoral.mat', dic_data)
    
    
    
    # Stacked moments
    stds = cycle_growth.std(axis=0)
    stds = 100*stds[["Y", "C", "I", "NC", "NI", "p_I", "util_ND", "util_D"]]
    stds = pd.DataFrame(stds)
    stds.index = ["std(Y)", "std(C)", "std(I)", "std(NC)", "std(NI)", "std(p_I)", "std(util_ND)", "std(util_D)"]
    corrs = np.zeros((7, 1))
    corr_mat = cycle_growth.corr()
    corrs[0] = corr_mat['C']['I']
    corrs[1] = corr_mat['C']['NI']
    corrs[2] = corr_mat['C']['lab_prod']
    corrs[3] = corr_mat['C']['util']
    corrs[4] = corr_mat['NC']['NI']
    corrs[5] = corr_mat['util_D']['util_ND']
    corrs[6] = corr_mat['p_I']['I']
    cor_dat = pd.DataFrame(corrs)
    cor_dat.index = ["Cor(C, I)", "Cor(C, N_I)",  "Cor(C, lab_prod)", "Cor(C, util)",
                     "Cor(N_C, N_I)" , "Corr(util_D, util_ND)", "Cor(p_I, I)"]
    autocorr_dat = np.zeros((2, 1))
    autocorr_dat[0] = cycle_growth.NC.autocorr()
    autocorr_dat[1] = cycle_growth.NI.autocorr()
    autocorr_dat = pd.DataFrame(autocorr_dat)
    autocorr_dat.index = ["Cor(N_C, N_{C,-1})", "Cor(N_I, N_{I,-1})"]
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
    
    " Generate Table 1 "
    mom_data = moments(100*cycle, lab=['I', 'NI']) 
    print(mom_data.style.format(precision=2).to_latex())
    
    " Save moments "
    # Moments from data in growth rates and Hamilton-filtered data
    save_object(mom_data, 'mom_data')
    
    " Figure 1 "
    linestyle = ['-', ':', '-.']
    import matplotlib.dates as mdates
    years = mdates.YearLocator(5, month=1)
    years_fmt = mdates.DateFormatter('%Y')
    fig, ax = plt.subplots(figsize=(11, 4))
    ax.plot(100*cycle.util_D, linestyle[1], label= "Total capacity utilization: durables", lw=2, alpha=0.7, color="blue")
    ax.plot(100*cycle.util_ND, linestyle[2], label= "Total capacity utilization: nondurables", lw=2, alpha=0.7, color="green")
    ax.plot(100*cycle.util_Fern, linestyle[0], label="Fernald utilization measure", lw=2, alpha=0.7, color="red")
    ax.plot(100*cycle.Y, label="Real output (consumption plus investment)", lw=2, alpha=0.6, color="black")
    ax.legend(loc="upper right")
    ax.xaxis.set_major_locator(years)
    ax.xaxis.set_major_formatter(years_fmt)
    ax.set_ylabel("%")
    ax.grid(True)
    plt.tight_layout()
    plt.savefig("utilization_output.pdf")
    plt.show()
    
    util_series = cycle[["util_Fern", "util", "Y"]]
    mom_util = moments(100*util_series)
    print(mom_util.to_latex())
    
    # Do plots
    
    
        
    " Generate Figure B.10"

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
    #ax.plot(100*cycle.util, linestyle[2], label= "Utilization: total industry", lw=2, alpha=0.7)
    ax.legend(loc="upper right")
    ax.xaxis.set_major_locator(years)
    ax.xaxis.set_major_formatter(years_fmt)
    ax.set_ylabel("%")
    ax.grid(True)
    plt.tight_layout()
    plt.savefig("utilization_comovement.pdf")
    plt.show()
    
    
    cycle.mean()
    

    
    " Figure A.9"
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
    
    
    

    
    
   
    
    
    


