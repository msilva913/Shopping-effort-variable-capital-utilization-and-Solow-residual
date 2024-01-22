clc;
clear;
%% 
addpath c:\dynare\5.4\matlab

%% BRS in levels (Hamilton regression filter)
dynare BRS.mod

%% BRS in first differences (demeaned)
dynare BRS_fd.mod
