import os
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import scipy.io as sio
import statsmodels.api as sm
import statsmodels.formula.api as smf
from statsmodels.graphics.tsaplots import plot_acf
from statsmodels.tsa.stattools import grangercausalitytests
#import statsmodels.api as sm
from fredapi import Fred
import matplotlib.dates as mdates
import pickle
fred = Fred(api_key = 'd35aabd7dc07cd94481af3d1e2f0ecf3	')
#from statsmodels.tsa.arima_model import ARMA
pd.set_option('display.precision', 2)
#pd.options.display.float_format = '{:5,.4g}'.format
# Get the parent directory of the current script

def print_stata_table(results, digits=4, ci=True):
    """
    Print regression results in a STATA-style summary table (no t-statistic).
    Parameters:
        results: statsmodels regression results object (standard or robust)
        digits: number of decimals to display
        ci: if True, include 95% confidence intervals
    """
    # Get variable names robustly
    try:
        varnames = results.params.index
    except AttributeError:
        varnames = results.model.exog_names

    # Header
    if ci:
        print("{:<16} {:>10} {:>10} {:>10} {:>12} {:>12}".format(
            "Variable", "Coef.", "Std.Err.", "P>|t|", "[0.025", "0.975]"
        ))
    else:
        print("{:<16} {:>10} {:>10} {:>10}".format(
            "Variable", "Coef.", "Std.Err.", "P>|t|"
        ))
    print("-" * (66 if ci else 48))

    # Table rows
    for i, var in enumerate(varnames):
        coef = results.params[i]
        se = results.bse[i]
        pval = results.pvalues[i]
        if ci:
            conf_int = results.conf_int()[i]
            print("{:<16} {:>10.{d}f} {:>10.{d}f} {:>10.{d}f} {:>12.{d}f} {:>12.{d}f}".format(
                var, coef, se, pval, conf_int[0], conf_int[1], d=digits
            ))
        else:
            print("{:<16} {:>10.{d}f} {:>10.{d}f} {:>10.{d}f}".format(
                var, coef, se, pval, d=digits
            ))
    print("-" * (66 if ci else 48))
    print(f"Number of obs = {results.nobs:.0f}")
    try:
        print(f"R-squared     = {results.rsquared:.{digits}f}")
    except AttributeError:
        pass

def save_object(obj, filename):
    with open(filename, 'wb') as output:
        pickle.dump(obj, output, pickle.HIGHEST_PROTOCOL)  


def construct_data(freq):
    
    " Capacity utilization "
    util = fred.get_series('TCU').resample(freq).mean().dropna()
    # Durable manufacturing
    " Unemployment rate"
    u = fred.get_series('UNRATE').resample(freq).mean().dropna()
    
    " Inflation rate: based on core CPE "
    PCE = fred.get_series("PCEPILFE").resample(freq).mean().dropna()
    pi = 100*np.log(PCE).diff()
    " List of data series "
    var_load_list = [util, u, pi] 
    return var_load_list


if __name__ == "__main__":
    # Baseline
    init= '1964-01-01'
    final = '2024-12-30'
    #freq = 'ME'
    freq = 'QE'
    save_observables = True
    var_load_list = construct_data(freq)
    dat = pd.concat(var_load_list, axis=1)[init:final]
    lab = ['util', 'u', 'pi']
    dat.columns = lab
    

    # Do plots
    
    years = mdates.YearLocator(5, month=1)
    years_fmt = mdates.DateFormatter('%Y')
    
    # Initial descriptive plot
    fig, ax = plt.subplots(figsize=(11, 4))
    ax.plot(dat.util-dat.util.mean(), label= "Total capacity utilization", lw=2, alpha=0.7)
    ax.plot(dat.u-dat.u.mean(), label= "Unemployment rate", lw=2, alpha=0.7)
    ax.legend(loc="upper right")
    ax.xaxis.set_major_locator(years)
    ax.xaxis.set_major_formatter(years_fmt)
    ax.set_ylabel("%")
    ax.grid(True)
    plt.tight_layout()
    plt.show()
    
    print(dat.corr())
    
    dat["u_lag"] = dat.u.shift(1)
    dat["u_lag2"] = dat.u.shift(2)
    dat["util_lag"] = dat.util.shift(1)
    dat["util_lag2"] = dat.util.shift(2)
    dat["pi_lag"] = dat.pi.shift(1)
    #dat = dat.dropna(subset=["u", "u_lag", "util"])
    # Use Newey-West standard errors: robust to both autocorrelation and hetereoskedasticity
    model = smf.ols("u ~ u_lag  + util ", data=dat).fit()
    nw_se = model.get_robustcov_results(cov_type="HAC", maxlags=1)
    print(nw_se.summary())
    
    print_stata_table(nw_se, ci=True)  
    
    # Plot autocorrelation function
    res = nw_se.resid
    plot_acf(res, lags=8)
    plt.title("ACF of Model Residuals")
    plt.show()
    
# Fetch University of Michigan inflation expectations (median expected price change next 12 months)
# Since this survey provides 12-month-ahead expectations, we construct quarterly expectations by averaging the survey responses from 3 to 15 months before the current quarter. 
# This approach ensures that the expectation measure reflects beliefs about inflation that were formed before the current quarter but whose forecast horizon includes the current quarter.
# The average of multiple lags provides a robust measure that aggregates the evolution of expectations over time.

mich_monthly = fred.get_series('MICH', start_date='1980-01-01') 
mich_df = pd.DataFrame(mich_monthly, columns=['MICH'])
mich_df.index = pd.to_datetime(mich_df.index)

"""
mich_df['MICH_3m_lag'] = mich_df['MICH'].shift(3)
mich_df['MICH_6m_lag'] = mich_df['MICH'].shift(6)
mich_df['MICH_9m_lag'] = mich_df['MICH'].shift(9)
mich_df['MICH_12m_lag'] = mich_df['MICH'].shift(12)
mich_df['MICH_15m_lag'] = mich_df['MICH'].shift(15)

mich_quarterly = mich_df[['MICH_3m_lag', 'MICH_6m_lag', 'MICH_9m_lag', 'MICH_12m_lag', 'MICH_15m_lag']].resample('Q').last()
mich_quarterly['pi_exp_avg'] = mich_quarterly.mean(axis=1)
mich_quarterly.index = mich_quarterly.index.to_period('Q').to_timestamp('Q')

if hasattr(dat.index[0], 'date'):
    mich_quarterly.index = mich_quarterly.index.date
"""

def annual_to_quarterly_exp(michigan_exp):
    """
    Transforms University of Michigan 12-month-ahead expected inflation (percent)
    to quarter-on-quarter expected inflation (percent).
    """
    qoq_exp = 100*((1 + michigan_exp / 100) **(1/4) - 1)
    return qoq_exp

def annual_to_monthly_exp(michigan_exp):
    """
    Transforms University of Michigan 12-month-ahead expected inflation (percent)
    to quarter-on-quarter expected inflation (percent).
    """
    qoq_exp = 100*((1 + michigan_exp / 100) **(1/12) - 1)
    return qoq_exp


mich_df["pi_exp_qq"] = annual_to_quarterly_exp(mich_df["MICH"])
pi_exp_qq_Q = mich_df["pi_exp_qq"].resample("QE").mean()
#pi_exp_qq_Q = mich_df["pi_exp_qq"].resample("QE").last()
#pi_exp_qq_Q = mich_df["pi_exp_qq"].resample("ME").mean()
dat["pi_exp_qq_Q"] = pi_exp_qq_Q

# Hybrid NKPC with capacity utilization in place of output gap #
##pi_t = alpha + beta_1 pi_{t-1} + beta_2 E pi_{t+1} + gamma*util_t+epsi_t##
# Core PCE is more appropariate: Gali and Gertler  (1999), Mavroeidis, Plagborg-Møller & Stock (2014)
NKPC = smf.ols("pi ~ pi_lag + pi_exp_qq_Q + util", data=dat).fit()
#NKPC = smf.ols("pi ~ pi_lag + pi_exp_qq_Q + util+util_lag + util_lag2", data=dat).fit()
NKPC_robust = NKPC.get_robustcov_results(cov_type="HAC", maxlags=1)
print(NKPC_robust.summary())
print_stata_table(NKPC_robust, ci=True) 



# Documentation 
#https://www.philadelphiafed.org/-/media/FRBP/Assets/Surveys-And-Data/survey-of-professional-forecasters/spf-documentation.pdf?sc_lang=en&hash=8408A4F1BF351A3C268B40F6BC7B95AA
#url_csv = "https://www.philadelphiafed.org/-/media/FRBP/Assets/Surveys-And-Data/survey-of-professional-forecasters/data-files/files/Median_CPI_Level.xlsx?sc_lang=en&hash=62D40007994C18991419F9F1B06923E4"
df = pd.read_excel("Median_CPI_Level.xlsx")
print(df.head())
df = df[["YEAR","QUARTER", "CPI3"]]
df = df.dropna()
start = "1981Q3"
index = pd.period_range(start="1981Q3", periods=len(df), freq="Q")
index = index.to_timestamp(how="end").date #QE-DEC format
df.index = index
#df.drop(columns=["YEAR", "QUARTER"], inplace=True)
dat["pi_exp"] = mich_quarterly['pi_exp_avg'].reindex(dat.index)
# Annualized rate, so convert to quarterly measure 
dat["pi_exp"] =100*((1+dat["pi_exp"]/100)**(1/4) - 1)
#dat["pi_exp"] = (1+dat["pi_exp"]/100)**(1/4) - 1

dat["util_gap"] = dat["util"] - dat["util"].mean()
dat["pi_forward"] = dat["pi"].shift(-1)
NKPC = smf.ols("pi ~ pi_lag + pi_exp + util_gap", data=dat).fit()
NKPC_robust = NKPC.get_robustcov_results(cov_type="HAC", maxlags=1)
print(NKPC_robust.summary())
print_stata_table(NKPC_robust, ci=True) 


"""
# Granger causality test

max_lag = 2  # you can choose the maximum lag
test_result = grangercausalitytests(dat[['u', 'util']], maxlag=max_lag, verbose=True)

model = smf.ols("u ~ u_lag + util_lag", data=dat).fit()
nw_se = model.get_robustcov_results(cov_type="HAC", maxlags=1)
print(nw_se.summary())
print_stata_table(nw_se, ci=True) 
"""    