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
pd.options.display.float_format = '{:5,.3f}'.format

from time_series_functions import (moments, filter_transform, crosscorr)
#import statsmodels
#arima =  statsmodels.tsa.x13.x13_arima_analysis
#path = r'C:\Users\TJSEM\Dropbox\Documents - Copy\Research\Consumption diversity, entry, and goods market frictions\Programs\Estimation'




def save_object(obj, filename):
    with open(filename, 'wb') as output:
        pickle.dump(obj, output, pickle.HIGHEST_PROTOCOL)  


def construct_data(init, final, freq):
    " GDP Deflator"
    deflator =  fred.get_series('GDPDEF').resample(freq).mean()
    #Y = fred.get_series('GDPC1').resample(freq).mean().dropna() #real, quarterly
    
    " Investment goods deflator "
    inv_deflator = fred.get_series("INVDEF").resample(freq).mean()
    #cons_deflator = fred.get_series("CONSDEF").resample(freq).mean()
    
    
    
    " Nominal consumption "
    # Personal consumption non-durables
    C1 = fred.get_series('PCND').resample(freq).mean()# monthly, nominal
    # Personal consumption expenditure services
    C2 = fred.get_series('PCESV').resample(freq).mean()
    C = C1 + C2
    #C = fred.get_series('PCEC').resample(freq).mean()# monthly, nominal
    
    " Non-institutional population "
    pop = fred.get_series('CNP16OV').resample(freq).mean()
    #defl = fred.get_series('GDPDEF').resample(freq).mean()
    
    " Consumer price index "
    CPI = fred.get_series('CPIAUCSL').resample(freq).mean()
    
    " Labor hours "
    L = fred.get_series('HOANBS').resample(freq).mean()
    
    
    " Investment "
    # Fixed private investment
    FPI = fred.get_series('FPI').resample(freq).mean().dropna()
    # Durable goods
    #PCDG = fred.get_series('PCDG').resample(freq).mean().dropna()
    # Change in business inventories
    CBI = fred.get_series('CBI').resample(freq).mean().dropna()
    I = FPI + CBI
    #I = fred.get_series('GPDIC1').resample(freq).mean().dropna()
    
    " Wages (real compensation per hour) "
    w = fred.get_series('COMPRNFB').resample(freq).mean().dropna()
    
    " Capacity utilization "
    cu = fred.get_series('TCU').resample(freq).mean().dropna()
    
   

    
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
    
    " Real government consumption expenditure "
    G = fred.get_series('A955RX1Q020SBEA').resample('Q').mean()
    
    " Relative price of investment goods "
    p_I = fred.get_series('PIRIC').resample('Q').mean()
    
    " Real GDP "
    Y = fred.get_series('GDPC1').resample(freq).mean().dropna() 
    # construct output from consumption and investment; omit G
    Y = C + I
    
    # Labor share of income #
    

    " Scale by population and CPI "
    y = Y/(pop*deflator)
    c = C/(pop*CPI)
    l = L/pop
    lab_prod = y/l
    i = I/(pop*inv_deflator)
    g = G/pop
    
    " List of data series "
    var_load_list = [y, c, i, w, l, lab_prod, g, p_I, SR, SR_util, cu] 
    return var_load_list



if __name__ == "__main__":
   
    init= '1960-01-01'
    final = '2023-3-31'
    load = False
    filter_type = 'hamilton'
    freq = 'Q'
    save_observables = True
    
    if load:
        var_load_list = pickle.load(open("var_load_list", "rb"))
    else:
        var_load_list = construct_data(init, final, freq)
        save_object(var_load_list, 'var_load_list')
    
    dat = pd.concat(var_load_list, axis=1)
    lab = ['Y', 'C', 'I', 'w', 'L', "lab_prod", 'G', 'p_I', 'SR', 'SR_util', 'cu']
    dat.columns = lab
    cycle = pd.concat([filter_transform(dat[x], init=init, final=final, transform_type='log',
                                        filter_type=filter_type) for x in lab], axis=1)
    cycle.columns = lab

    mom_data = moments(100*cycle, lab=['Y'])
    print(mom_data.to_latex())
    " Save moments "
    # Moments from data in growth rates and Hamilton-filtered data
    save_object(mom_data, 'mom_data')
    
    if save_observables:
        " Save relevant objects "
        #save_object(cycle, 'cycle')
        " Save output for estimation using growth filter"
        lab = ['Y_obs', 'C_obs', 'TI_obs', 'w_obs', 'L_obs', 'lab_prod_obs', 'G_obs', 'p_I_obs',
               'SR_obs', 'SR_util_obs', 'cu']
        dic_data = dict(zip(lab, [np.asarray(cycle[x]) for x in cycle.columns]))
        sio.savemat('observables.mat', dic_data)
        
    
    
    
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
        fig = plt.figure(figsize=(20, 8))
        next(col_cycle)
        for n in range(nvars-1):
            ax = fig.add_subplot(3, 3, n+1)
            z = next(col_cycle)
            ax.plot(cycle.Y, label='Y', lw=2, alpha=0.6, linestyle=next(lsty_cycler))
            ax.plot(cycle[z], label=f"{z}", lw=2, alpha=0.6, linestyle=next(lsty_cycler))
            ax.legend(loc='upper right')
            ax.xaxis.set_major_locator(years)
            ax.xaxis.set_major_formatter(years_fmt)
            ax.grid(True)
        #plt.savefig('output_comovement_simp.pdf')
        plt.tight_layout()
        plt.show()
    
    plot_cycle(cycle)
    # fig, ax = plt.subplots()
    # ax.plot(cycle.NE, label='NE', lw=2, alpha=0.6)
    # plt.show()
    
    cycle.mean()
    
    " Dynamic correlations "
    linestyle = ['-', ':', '-.']
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
    #plt.savefig("dynamic_correlations_SR_Y.pdf")
    
    
    " Two types of Solow residual "
    fig, ax = plt.subplots(figsize=(11, 4))
    ax.plot(cycle.SR, label="Solow residual", lw=2, alpha=0.6, color="blue")
    ax.plot(cycle.SR_util, label="Utilization-adjusted Solow residual", lw=2, alpha=0.6, color="green")
    ax.xaxis.set_major_locator(years)
    ax.xaxis.set_major_formatter(years_fmt)
    ax.grid(True)
    #plt.tight_layout()
    ax.legend(fontsize=11)
    
    " Compare Fernald utilization vs capacity utilization "
    cycle["util_Fern"] = cycle.SR - cycle.SR_util
    
    fig, ax = plt.subplots(figsize=(11, 4))
    ax.plot(100*cycle.util_Fern.loc["1980":], label="Utilization (Fernald)", lw=2, alpha=0.6, color="blue")
    ax.plot(100*cycle.cu.loc["1980":], label="Total capacity utilization", lw=2, alpha=0.6, color="green")
    ax.xaxis.set_major_locator(years)
    ax.xaxis.set_major_formatter(years_fmt)
    ax.set_ylabel("Percent")
    ax.grid(True)
    plt.tight_layout()
    ax.legend(fontsize=11)
    plt.savefig("utilization_series_comparison.pdf")
    
    util_series = cycle[["util_Fern", "cu", "Y"]]
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


