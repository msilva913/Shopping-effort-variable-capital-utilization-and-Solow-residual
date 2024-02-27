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
pd.set_option('display.precision', 4)
pd.options.display.float_format = '{:5,.4g}'.format

from time_series_functions import (moments, filter_transform, crosscorr)
#import statsmodels
#arima =  statsmodels.tsa.x13.x13_arima_analysis
#path = r'C:\Users\TJSEM\Dropbox\Documents - Copy\Research\Consumption diversity, entry, and goods market frictions\Programs\Estimation'

# Price deflators



def save_object(obj, filename):
    with open(filename, 'wb') as output:
        pickle.dump(obj, output, pickle.HIGHEST_PROTOCOL)  

def La_index(p, q):
    

    T = p.shape[0]
    nitems = p.shape[1]
    num = np.zeros(T)
    res = np.zeros_like(num)
    den = 0.0
    
    for i in range(nitems):
        den += p.iloc[0,i]*q.iloc[0,i]
    
    for t in range(T):
        num[t] = sum([p.iloc[t, i]*q.iloc[0, i] for i in range(nitems)])
    
    res = pd.Series(num/den)
    res.index = p.index
    return res

def Pa_index(p, q):
    T = p.shape[0]
    nitems = p.shape[1]
    num = np.zeros(T)
    res = np.zeros_like(num)
    den = np.zeros_like(num)
    
    for t in range(T):
        num[t] = sum(p.iloc[t,i]*q.iloc[t,i] for i in range(nitems))
        den[t] = sum(p.iloc[0, i]*q.iloc[t, i] for i in range(nitems))
    
    res = pd.Series(num/den)
    res.index = p.index
    return res

def Fisher_index(p,q):
    res = np.sqrt(La_index(p,q)*Pa_index(p,q))
    return res

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
		- Fed Funds rate: Fed Board H.15 (TB3MS for early sample)
    
    Sectoral data Tables B6 and B7
    B6: number of nonsupervisory employees
    B7: average weekly hours
    """
    
    sectoral = pd.read_csv("sectoral_labor_data.csv", sep= ",", header=0)
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
    #deflator =  fred.get_series('GDPDEF').resample(freq).mean()
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
    
    " Nominal investment: durables (PCDG), non-residential investment (PNFI), residential investment (PRFI) "
    PCDF = fred.get_series("PCDG").resample(freq).mean().dropna()
    PNFI = fred.get_series("PNFI").resample(freq).mean().dropna()
    PRFI = fred.get_series("PRFI").resample(freq).mean().dropna()
    I = PCDF + PNFI + PRFI
    
    " Price index of consumption goods "
    # non-durables
    p_ND = fred.get_series('DNDGRG3Q086SBEA').resample(freq).mean().dropna()
    # Services 
    p_S = fred.get_series("DSERRG3Q086SBEA").resample(freq).mean().dropna()
    # Combine using Tornquist index
    p_C = p_S*C_S/C + p_ND*C_ND/C
    
    p_C_alt = fred.get_series("PCEPI").resample(freq).mean().dropna()
    plt.plot(p_C.pct_change(), label="weighted measure")
    plt.plot(p_C_alt.pct_change(), label="import")
    plt.legend()
    #p = pd.concat([p_S, p_ND], axis=1)
    #q = pd.concat([C_S, C_ND], axis=1)
  
    #p_C = Fisher_index(p, q)
    #C = fred.get_series('PCEC').resample(freq).mean()# monthly, nominal
    
    " Price index for investment goods "
    p_I = fred.get_series("A006RD3Q086SBEA").resample(freq).mean().dropna()
    
   
    #Equivalent to FPI (BEA A007RC) and change in business inventories (BEA CBI)
    #https://apps.bea.gov/iTable/?reqid=19&step=2&isuri=1&categories=underlying#eyJhcHBpZCI6MTksInN0ZXBzIjpbMSwyLDNdLCJkYXRhIjpbWyJjYXRlZ29yaWVzIiwiU3VydmV5Il0sWyJOSVBBX1RhYmxlX0xpc3QiLCIyMDcxIl1dfQ==
    #I = fred.get_series("GPDI").resample(freq).mean().dropna()
    
    " Non-institutional population "
    pop = fred.get_series('CNP16OV').resample(freq).mean()
    # Use HP-filtered trend for population
    pop = sm.tsa.filters.hpfilter(pop, lamb=10_000)[1]
    " Capacity utilization "
    util = fred.get_series('TCU').resample(freq).mean().dropna()
    
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
    SR_util = tfp.dtfp_util
    
    " Relative price of investment goods "
    #p_I = fred.get_series('PIRIC').resample('Q').mean()
  
    #p_C = fred.get_series("DPCERD3Q086SBEA").resample(freq).mean().dropna()
    #Personal consumption expenditures: services
    
    " Labor productivity for consumption and investment"
    lab_prod = (C/p_C+I/p_I)/(L)
    #lab_prod = fred.get_series("OPHNFB").resample(freq).mean().dropna()
  
    
    " Labor share "
    # Real GDP: 
    # Y_agg = fred.get_series("GDP").resample(freq).mean().dropna()
    # #Y_agg = Y_agg/deflator
    # #non-farm weekly hours: BLS PRS85006023
    # H = fred.get_series("PRS85006023").resample(freq).mean().dropna()
    # w = fred.get_series('CES0500000003').resample(freq).mean().dropna()
    # w/(Y_agg/H)

    " Scale by population and price index "
    c = C/(pop*p_C)
    i = I/(pop*p_I)
    
    #y = Y/(pop*deflator)
    " Construct output from consumption and investment "
    y = c + i
    lc = LC/pop
    li = LI/pop
    l = L/pop
    " Relative price of investment: divide price indices"
    p_I = p_I/p_C
   
    " Note: these series imply labor productivity in each sector "
    " List of data series "
    var_load_list = [y, c, i, lc, li, l, lab_prod, p_I, SR, SR_util, util] 
    return var_load_list

        
        

if __name__ == "__main__":
    # Baseline
    init= '1964-01-01'
    final = '2023-12-30'
    # Comparison to earlier BRS
    #init = '1967-01-01'
    #final = '2019-12-30'
    load = False
    #filter_type = 'hamilton'
    freq = 'Q'
    save_observables = False
    
    if load:
        var_load_list = pickle.load(open("var_load_list", "rb"))
    else:
        var_load_list = construct_data(init, final, freq)
        save_object(var_load_list, 'var_load_list')
    
    dat = pd.concat(var_load_list, axis=1)
    lab = ['Y', 'C', 'I', 'LC', 'LI', 'L', "lab_prod", 'p_I', 'SR', 'SR_util', 'util']
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
    mom_growth_data = moments(100*cycle_growth, lab=['Y', 'L'])
    
    # " Compare growth rates "
    # fig, ax = plt.subplots(figsize=(14, 8))
    # ax.plot(cycle_growth.lab_prod, label="Labor productivity growth:agg")
    # ax.plot(cycle_growth.lab_prod_C, label="Labor productivity growth:C")
    # ax.plot(cycle_growth.lab_prod_I, label="Labor productivity growth:I")
    # ax.legend()
    # plt.show()
    
    # lab_prod_diff = cycle_growth.lab_prod_C - cycle_growth.lab_prod_I
    
    # fig, ax = plt.subplots(figsize=(14, 8)) 
    # ax.plot(cycle_growth.p_I, label="Relative price of investment")
    # ax.plot(lab_prod_diff, label="Difference in growth rates")
    # ax.legend()
    # plt.show()
    
    cycle_growth = cycle_growth - cycle_growth.mean()

    
    if save_observables:
        " Save relevant objects "
        #save_object(cycle, 'cycle')
        " Save output for estimation using growth filter"
        lab = ['Y_obs', 'C_obs', 'I_obs', 'NC_obs', 'NI_obs', 'N_obs',
               'Y_N_obs', 'p_I_obs', 'SR_obs', 'SR_util_obs', 'util_obs']
        dic_data = dict(zip(lab, [np.asarray(cycle_growth[x]) for x in cycle_growth.columns]))
        sio.savemat('observables_fd.mat', dic_data)
    
    cycle =  pd.concat([filter_transform(dat[x], init=init, final=final, transform_type='log',
                                         filter_type="hamilton", demean=True) for x in lab], axis=1)
    #cycle =  pd.concat([filter_transform(dat[x], init=init, final=final, transform_type='log',
                                     #    filter_type="hp_filter", demean=True) for x in lab], axis=1)
    cycle.columns = lab
    
    " Choose specific variable set "
    #cycle_red = cycle[["Y", "I", "lab_prod", "SR", "p_I", "SR_util", "cu"]]

    mom_data = moments(100*cycle, lab=['Y', 'L']) 
    print(mom_data.style.format(precision=2).to_latex())
    
    # Moments in growth rates 
    mom_growth_data = moments(100*cycle_growth, lab=['Y', 'L'])
    print(mom_growth_data.style.format(precision=2).to_latex())
    " Save moments "
    # Moments from data in growth rates and Hamilton-filtered data
    save_object(mom_data, 'mom_data')
    
    # Do plots
    
    import matplotlib.dates as mdates
    years = mdates.YearLocator(5, month=1)
    years_fmt = mdates.DateFormatter('%Y')
    
 
    
    " Plot "
    def plot_cycle(cycle):
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
            ax.plot(cycle.Y, label='Y', lw=2, alpha=0.6, linestyle=next(lsty_cycler))
            ax.plot(cycle[z], label=f"{z}", lw=2, alpha=0.6, linestyle=next(lsty_cycler))
            ax.legend(loc='upper right')
            ax.xaxis.set_major_locator(years)
            #ax.set_ylim(-0.15, 0.15)
            ax.xaxis.set_major_formatter(years_fmt)
            ax.grid(True)
        plt.savefig('output_comovement_simp.pdf')
        plt.tight_layout()
        plt.show()
    
    " Restricted set of variables: includes variables in estimation "
    cycle_red = cycle[["Y", "C", "I", "LC", "LI", "p_I", "SR"]]
    #cycle_red = cycle_growth[["Y", "C", "I", "LC", "LI", "p_I", "SR"]]
    plot_cycle(cycle_red)
    
    linestyle = ['-', ':', '-.']
    
    fig, ax = plt.subplots(figsize=(11, 4))
    ax.plot(100*cycle.LC, linestyle[0], label= "Hours: consumption", lw=2, alpha=0.7)
    ax.plot(100*cycle.LI, linestyle[1], label= "Hours: investment", lw=2, alpha=0.7)
    ax.plot(100*cycle.L, linestyle[2], label= "Hours: aggregate", lw=2, alpha=0.7)
    ax.legend(loc="upper right")
    ax.xaxis.set_major_locator(years)
    ax.xaxis.set_major_formatter(years_fmt)
    ax.set_ylabel("%")
    ax.grid(True)
    plt.tight_layout()
    plt.savefig("hours_comovement.pdf")
    plt.show()
    
    # fig, ax = plt.subplots()
    # ax.plot(cycle.NE, label='NE', lw=2, alpha=0.6)
    # plt.show()
    
    cycle.mean()
    
    " Dynamic correlations "
   
    colors = ["red", "green", "blue"]
    nlags = 8
    nleads = 8
    var_labels = (["SR", "Y"], ["SR_util", "Y"], ["SR", "SR_util"])
    ylabels = (r'$Corr(SR_t, Y_{t+\Delta})$', r'$Corr(SR_t^{util}, Y_{t+\Delta})$', r'$Corr(SR_t, SR_{t+\Delta}^{util}$')
    fig, ax = plt.subplots(nrows=1, ncols=1, figsize=(18, 6))
    # Loop over variables
    for (i, var_label) in enumerate(var_labels):
        rs = pd.Series([crosscorr(cycle[var_label[0]], cycle[var_label[1]], -lag) for lag in range(-nlags, nleads)])
        offset = np.floor(len(rs)/2)-np.argmax(rs)
        ax.axhline(y=0.0, color="black", linestyle="--")
        ax.plot(rs, linestyle[i], label=ylabels[i], alpha=0.7, linewidth=2.5, color=colors[i])
        ax.axvline(np.argmax(abs(rs)),linestyle='--', color=colors[i])
        ax.set_xlabel(r'$\Delta$ (quarters)', fontsize=14)
        #ax[i].set_ylabel(ylabels[i], fontsize=14)
    ax.set_xticks(range(0, len(rs)))
    ax.set_xticklabels(range(-nlags, nleads))
    ax.set_title("Dynamic correlations", fontsize=12)
    ax.legend(loc = "upper right", fontsize=14)
    ax.axvline(nlags, color="black")
    plt.tight_layout()
    plt.savefig("dynamic_correlations_SR_Y.pdf")
    
    
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
    #mom_util.style.to_latex()
    # extract_array = np.zeros((10, 3))
    # filters = ['hamilton', 'quadratic', 'hp_filter', 'bkfilter', 'growth']
    # for (i, filter_type) in enumerate(filters):
    #       cycle = construct_cycle(init, final, freq, filter_type, load)
    #       mom_data = moments(100*cycle, lab=['Y'])
    #       extract_array[2*i:(2*i+2), :] = mom_data.values[5:7, 0:3]
    # index = ('SR', 'SR_{util}')*5
    # columns=('SD(x)', 'RSD', 'Cor(x, Y)')   
    # mom_comp = pd.DataFrame(extract_array, columns=columns, index=index)
    # mom_comp.T
    
    " Analyze productivity data "
    # cycle_prod = cycle[["Y", "SR", "SR_util", "SR_I", "SR_C", 
    #                     "SR_util_I", "SR_util_C"]]
    # fig, ax = plt.subplots(ncols=2, figsize=(16, 6))
    # ax[0].plot(cycle_prod.SR, label="SR")
    # ax[0].plot(cycle_prod.SR_C, label=r"SR$_{C}$")
    # ax[0].plot(cycle_prod.SR_I, label=r"SR$_{I}$")
    # ax[0].legend(loc="best")
    # ax[0].set_title('Solow residuals')
    
    # ax[1].plot(cycle_prod.SR_util, label=r"SR$_{util}$")
    # ax[1].plot(cycle_prod.SR_util_C, label=r"SR$_{util,C}$")
    # ax[1].plot(cycle_prod.SR_util_I, label=r"SR$_{util,I}$")
    # ax[1].legend(loc="best")
    # ax[1].set_title('Utilization-adjusted Solow residuals')
    # plt.tight_layout()
    
    # Moments of productivity data
    #moments(100*cycle_prod, lab=['SR'])
    # Correlation matrix
    #cycle_prod.corr()
    
    """
    Stylized facts
    1) corr(SR_I, SR_C) = 0.74
    2) Both sectoral SR fairly procyclical
    3) corr(SR_util_I, SR_util_C) = 0.28 (only mild)
    4) SR_util_C slightly procyclical, SR_util_I slightly countercyclical
    """


