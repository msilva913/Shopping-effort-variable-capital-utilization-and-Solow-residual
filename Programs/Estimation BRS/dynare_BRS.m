clc;
clear;
%% 
addpath c:\dynare\5.4\matlab

%% BRS in levels (Hamilton regression filter)
dynare BRS.mod

%% BRS in levels (estimate shopping parameters)
dynare BRS_est_shopping.mod


%% BRS: target LC, LI, C, I
dynare BRS_comovement.mod


%% BRS in first differences (demeaned) -> closest correspondence to paper
dynare BRS_fd.mod

%% BRS first differences with utilization and investment adjustment costs
dynare BRS_extended_fd.mod

%% BRS extended with TFP growth (shock to growth rate)
dynare BRS_growth_ext_fd_v1.mod nostrict

%dynare BRS_growth_ext_fd.mod nostrict
%% BRS extended with TFP growth (estimate shopping parameters)
dynare BRS_growth_ext_shopping.mod

%% BRS with growth and capacity utilization (I, Y, Y_N, p_I, util_obs)
dynare BRS_growth_ext_util.mod 

%% BRS with growth, cap. utilization, and predetermined labor (I, Y, Y_N, p_I, util_obs)

%% BRS extended with TFP growth (estimate on sectoral data LC, LI, C, I)
dynare BRS_growth_ext_comovement.mod 