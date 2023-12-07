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
import os
pd.set_option('display.precision', 2)

from time_series_functions import (moments, filter_transform)
from statsmodels.tsa.seasonal import seasonal_decompose
import matplotlib.dates as mdates
years = mdates.YearLocator(5, month=1)
years_fmt = mdates.DateFormatter('%Y')
#import statsmodels
#arima =  statsmodels.tsa.x13.x13_arima_analysis

dtfp = pd.read_csv('quarterly_tfp.csv', header=0, nrows=304, sep=';' )
#dtfp = dtfp[dtfp['date'] < '2023:Q3']
date = pd.date_range(start='1947Q1', periods=dtfp.shape[0], freq='Q')
dtfp.index = date
dtfp = dtfp[['dtfp', 'dtfp_util']]
tfp = np.cumsum(dtfp/400)
SR = np.exp(tfp)

# Figure 1 in paper
SR_perc = 100*SR.pct_change(periods=4, axis=0)
SR_perc = SR_perc.loc['1980':'2022']

" Compare TFP to utilization-adjusted TFP"
fig, ax = plt.subplots(figsize=(12, 5))
ax.plot(SR_perc.dtfp, label='TFP', lw=2, alpha=0.6)
ax.plot(SR_perc.dtfp_util, label=' TFP utilization-adjusted', lw=2, alpha=0.6)
ax.set_xlabel('Period')
ax.set_ylabel('Percent')
ax.legend()
ax.xaxis.set_major_locator(years)
ax.xaxis.set_major_formatter(years_fmt)
ax.grid(True)
plt.savefig('TFP_comparison_plot.pdf')

# Labor share of income
labor_share = fred.get_series('LABSHPUSA156NRUG')
labor_share = labor_share.loc['1964':'2023']
labor_share.mean()



def save_object(obj, filename):
    with open(filename, 'wb') as output:
        pickle.dump(obj, output, pickle.HIGHEST_PROTOCOL)  

init= '1964-01-01'
final = '2023-09-30'

# Calculate ratio of government to consumption spending: ratio in nominal terms
# government-purchases: billions of dollars quarterly, annualized rate
# G = fred.get_series('W068RCQ027SBEA').resample('A').mean()
C1 = fred.get_series('PCND').resample('A').mean()# monthly, nominal
# Personal consumption expenditure: services
C2 = fred.get_series('PCESV').resample('A').mean()
#C3 = fred.get_series('PCEDG').resample('A').mean()
C = C1 + C2
# g_c = (G/C)[init:final]
# g_c = g_c.mean()


# Real government consumption expenditures and gross investment
# G_tot = fred.get_series('GCEC1').resample('Q').mean()
# # Real government consumption expenditures
# G = fred.get_series('A955RX1Q020SBEA').resample('Q').mean()
# fix, ax = plt.subplots()
# ax.plot(G, label= "Government consumption expenditure", linewidth=2, alpha=0.6)
# ax.plot(G_tot, label="Government consumption and investment expenditure", linewidth=2, alpha=0.6)
# ax.legend()
# plt.show()

# # Consumption relative to output
# Y = fred.get_series('GDP').resample('A').mean()
# C_Y = C/Y
# C_Y.loc[init:final].mean()
