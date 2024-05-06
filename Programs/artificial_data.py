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

from time_series_functions import (moments, filter_transform, crosscorr)
#import statsmodels

"Artificial data from estimation"
art_data = sio.loadmat("artificial_data.mat")
var_names = ['C_obs', 'I_obs', 'NC_obs', 'NI_obs', 'p_I_obs', 'util_D_obs', 'util_ND_obs']
# Express as list of series
var_list = [pd.Series(art_data[key].flatten()) for key in var_names]
art_data = pd.concat(var_list, axis=1)
art_data.columns = var_names
mom_art_data = moments(100*art_data, lab=['I_obs', 'NI_obs'], lags=[1])