import os
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import scipy.io as sio
#import statsmodels.api as sm
from itertools import cycle as cycler
from fredapi import Fred
import pickle
fred = Fred(api_key = 'd35aabd7dc07cd94481af3d1e2f0ecf3	')
#from statsmodels.tsa.arima_model import ARMA
pd.set_option('display.precision', 3)
pd.options.display.float_format = '{:5,.3g}'.format

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
		- Fed Funds rate: Fed Board H.15 (TB3MS for early sample)
    """
    
    sectoral = pd.read_csv("sectoral_labor_data.csv", sep= ",", header=0)
    date = pd.date_range(start='1/1947', periods=sectoral.shape[0], freq='MS')
    sectoral.index = date
    sectoral = sectoral[['Durable TH', 'Construction TH', 'Nondurable TH', 'Services TH']]
    " Consumption: nondurable plus services "
    sectoral["L_C"] = sectoral["Nondurable TH"] + sectoral["Services TH"]
    " Investment: construction plus durables "
    sectoral["L_I"] = sectoral["Construction TH"] + sectoral["Durable TH"]
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
    C1 = fred.get_series('PCEND').resample(freq).mean()# monthly, nominal
    # Personal consumption expenditure services: BEA DSERRC
    C2 = fred.get_series('PCESV').resample(freq).mean()
    C = C1 + C2
    #C = fred.get_series('PCEC').resample(freq).mean()# monthly, nominal
    
    " Gross Private Domestic Investment (BEA code A006RC) "
    #Equivalent to FPI (BEA A007RC) and change in business inentories (BEA CBI)
    I = fred.get_series("GPDI").resample(freq).mean().dropna()
    
    " Non-institutional population "
    pop = fred.get_series('CNP16OV').resample(freq).mean()
    
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
    p_I = fred.get_series("A006RD3Q086SBEA").resample(freq).mean().dropna()
    p_C = fred.get_series("DPCERD3Q086SBEA").resample(freq).mean().dropna()
    p_I = p_I/p_C
    
    " Real GDP "
    # Labor productivity
    lab_prod = (C+I)/(L*deflator)
    #lab_prod = fred.get_series("OPHNFB").resample(freq).mean().dropna()
   

    " Scale by population and GDP deflator "
    c = C/(pop*deflator)
    i = I/(pop*deflator)
    #y = Y/(pop*deflator)
    " Construct output from consumption and investment "
    y = c + i
    lc = LC/pop
    li = LI/pop
    l = L/pop
   
    " Note: these series imply labor productivity in each sector "
    " List of data series "
    var_load_list = [y, c, i, lc, li, l, lab_prod, p_I, SR, SR_util, util] 
    return var_load_list



if __name__ == "__main__":
    # Baseline
    #init= '1964-01-01'
    #final = '2023-12-30'
    # Comparison to earlier BRS
    init = '1967-01-01'
    final = '2019-12-30'
    load = False
    #filter_type = 'hamilton'
    filter_type = 'growth'
    freq = 'Q'
    save_observables = True
    
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
                                        filter_type="growth") for x in lab], axis=1)
    cycle_growth.columns = lab
    
    cycle =  pd.concat([filter_transform(dat[x], init=init, final=final, transform_type='log',
                                         filter_type="hamilton") for x in lab], axis=1)
    cycle.columns = lab
    
    " Choose specific variable set "
    #cycle_red = cycle[["Y", "I", "lab_prod", "SR", "p_I", "SR_util", "cu"]]

    mom_data = moments(100*cycle, lab=['Y', 'L'])
    print(mom_data.to_latex())
    " Save moments "
    # Moments from data in growth rates and Hamilton-filtered data
    save_object(mom_data, 'mom_data')
    
    if save_observables:
        " Save relevant objects "
        #save_object(cycle, 'cycle')
        " Save output for estimation using growth filter"
        lab = ['Y_obs', 'C_obs', 'I_obs', 'LC_obs', 'LI_obs', 'L_obs',
               'lab_prod_obs', 'p_I_obs', 'SR_obs', 'SR_util_obs', 'util_obs']
        dic_data = dict(zip(lab, [np.asarray(cycle_growth[x]) for x in cycle_growth.columns]))
        sio.savemat('observables_fd.mat', dic_data)
        

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
            ax.xaxis.set_major_formatter(years_fmt)
            ax.grid(True)
        plt.savefig('output_comovement_simp.pdf')
        plt.tight_layout()
        plt.show()
    
    " Restricted set of variables: includes variables in estimation "
    cycle_red = cycle[["Y", "C", "I", "LC", "LI", "p_I", "SR"]]
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
    ax.plot(100*cycle.SR_util, linestyle[2], label="Utilization-adjusted Solow residual", lw=2, alpha=0.7, color="green")
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


