

var p_C, p_I, P_C, q_C, q_I, Q,
C, I, Y,
 Gamma_C, Gamma_I, c_A, C_util, I_util,
r_I, r_C,
w, L_C, L_I, L,
//L_obs,
 K_C, K_I, K, lam,
u_C, u_I,
% shock vars
Z, Z_I, u_ZI, kappa, zeta

%observables (4 series)
C_obs, TI_obs, LC_obs, LI_obs, Y_obs, p_I_obs, lab_prod_obs, labor_share, SR_obs, w_obs,
SR_util_obs, Y_util_obs;

% 6 shocks, 1 measurement errors--one more shock than observable
//varexo e_ZI, e_Z, e_kappa, e_zeta, e_chi;
varexo e_ZI, e_Z, e_kappa, e_zeta;

parameters A, beta, delta_K, sigma_a, psi_inv, sigma, 
var_share, Gamma_bar, wL_Y, phi_I, Psi, Psi_K, gam

% persistence parameters
rho_Z, rho_ZI , rho_kappa, rho_zeta

% Roots AR(2) process on labor supply
lambda_1, lambda_2;

beta = 0.993;

% Frisch elasticity of labor supply
psi_inv = 0.72;

% IES
sigma = 1.5;
% Adjustment cost parameter 
Psi_K = 2.0;


% Persistence parameters
rho_ZI = 0.979;
rho_Z = 0.979;
rho_kappa = 0.979;
rho_zeta = 0.979;

%rho_chi = 0.979;
lambda_1 = 0.979;
lambda_2 = 0.0;

% labor share
wL_Y = 0.667;
phi_I = 0.22;
A = 0.78; % steady-state occupancy rate
delta_K = 0.174/4;

var_share = 0.0; % share of labor in consumption sector which is variable

% Habit formation parameter
//iota = 0.0;

% Key elasticities for estimation
Psi = 0.25;
gam = 0.42;
Gamma_bar = 1.3;

sigma_a = 0.32;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

model(linear);
% Dependent parameters
% Frisch elasticity
#psi = 1/psi_inv;

% labor supply
#rho_chi1 = lambda_1 + lambda_2;
#rho_chi2 = -lambda_1*lambda_2; 

#r = 1/beta-1;
%1) Consistency of α with investment share
#alpha_ratio = phi_I*(r+delta_K)/(delta_K*wL_Y);
#alpha = alpha_ratio/(1+alpha_ratio);
#alpha_2 = var_share*(1-alpha);
#alpha_1 = 1-alpha-alpha_2;

%2) Fixed cost share
#nu_R = Gamma_bar*wL_Y/(1-alpha) - 1;

%3) Solve for phi and rho
#Psi_inv = 1/Psi;
#A_c = alpha_2*(1+nu_R)+Psi_inv - 1;
#B_c = - (Psi_inv+Gamma_bar/A^alpha_2);
#C_c = 1.0; 

#phi = (- B_c-sqrt(B_c^2-4*A_c*C_c))/(2*A_c);
#rho = 1-Psi_inv + 1/phi;

% Variable labor

% Great ratios
#phi_C = 1-phi_I;
#r_KK_Y = alpha/(1-alpha)*wL_Y;
#D_Y = 1 - wL_Y - r_KK_Y;

#c_rho = 1 - (rho-1)/phi_C;


%%%%%Start of main equations%%%%%%%%%%%%%%%%%%%%%%%

% 1) 
[name = 'Variety effect: household']
P_C = phi*q_C*(1-rho) + p_C;

% 2) 
[name = 'Variety effect (investment)']
0 = phi*q_I*(1-rho) + p_I;

% 3) 
[name = 'Consumption aggregation']
C = P_C + c_A;

% 4) 
[name = 'Markup (consumption)']
Gamma_C = alpha_2*phi*q_C + A^alpha_2*phi*(alpha_2-rho)/Gamma_bar*(1-phi)*gam*q_C;
//Gamma_C = 0.0;

% 5)
[name = 'Markup (investment)']
Gamma_I = alpha_2*phi*q_I + A^alpha_2*phi*(alpha_2-rho)/Gamma_bar*(1-phi)*gam*q_I;
//Gamma_I = 0.0;

% 6) 
[name = 'Labor C']
w + L_C = C - Gamma_C + nu_R/(1+nu_R)*(p_C+phi*q_C-C);

% 7) 
[name = 'Labor in I']
w + L_I = I - Gamma_I + nu_R/(1+nu_R)*(p_I+phi*q_I-I);

% 8)
[name = 'Capital in C']
r_C+u_C+K_C(-1) = w + L_C;

% 9)
[name = 'Capital in I']
r_I+u_I+K_I(-1) = w+L_I;

% 10) 
[name = 'Labor intratemporal']
//chi + psi*L = lam + w;
 psi*L = lam + w;

% 11) 
[name = 'Capital accumulation (consumption)']
K = (1-delta_K)*K(-1) + delta_K*(I) - (r+delta_K)*(phi_C*u_C+phi_I*u_I);


% 12)  
[name = 'C shopping']
q_C = c_A - kappa;

% 13) 
[name = 'I shopping']
q_I = I-P_C-kappa-zeta;

% 14) 
[name = 'Consumption multiplier']
//lam + P_C = -sigma*c_A + sigma*(rho-1)/(phi_C-(rho-1))*(Y-C);
lam + P_C = -sigma/(c_rho)*(c_rho*c_A-(rho-1)/phi_C*(Y-C));


%14) 
[name = 'Euler equation of capital (C))']
   // 0 = lam(+1) - lam + (r+delta_K)/(1+r)*(C(+1)-Gamma_C(+1)-K_C(+1)-u_C(+1));
Q = lam(+1)-lam + (r+delta_K)/(1+r)*(r_C(+1)) + Q(+1)/(1+r);

% 15)
[name = 'Euler equation of capital (I)']
// 0 = lam(+1) - lam + (r+delta_K)/(1+r)*(I(+1)-Gamma_I(+1)-K_I(+1)-u_I(+1));
Q = lam(+1)-lam + (r+delta_K)/(1+r)*(r_I(+1)) + Q(+1)/(1+r);

% 16)
[name = 'Capital utilization (C)']
r_C = sigma_a*u_C+Q;

% 17)
[name = 'Capital utilization (I)']
r_I = sigma_a*u_I+Q;

%18)
[name = 'Relative price of investment']
Q = Psi_K*delta_K*(I-K(-1));


% 19) 
[name = 'Relative price of investment']
p_I_obs = p_I - p_C;


% 19)
[name =  'C production']
//YC = p_C + Z + (1-alpha_2)*(-phi*Q_C) + alpha*(K_C)+(1-alpha)*L_C;
C = (1+nu_R)*((1-alpha_2)*phi*q_C + p_C + Z + alpha*(u_C+K_C(-1))+(1-alpha)*L_C)-nu_R*(p_C+phi*q_C);

% 20) 
[name = 'I production']
I = (1+nu_R)*((1-alpha_2)*(phi*q_I) + p_I + Z_I + alpha*(u_I+K_I(-1)) + (1-alpha)*L_I) - nu_R*(p_I+phi*q_I);

% 21) 
//[name = 'Utilization-adjusted retail production']
C_util = (1+nu_R)*(p_C + Z + alpha*(K_C(-1))+(1-alpha)*L_C)-nu_R*(p_C);


% 22) 
[name = 'Investment (utilization-adjusted)']
I_util = (1+nu_R)*(p_I + Z_I + alpha*(K_I(-1)) + (1-alpha)*L_I) - nu_R*(p_I);


% 23) 
[name = 'Labor composition']
L = phi_C*L_C + phi_I*(L_I);

% 24) 
[name = 'Capital composition']
K = phi_C*K_C + phi_I*K_I;


% 25)
//[name = 'Capacity utilization']
//cu = phi_C*(phi*q_C + alpha*u_C) + phi_I*(phi*q_I+alpha*u_I);

% 26) 
[name = 'Aggregate accounting (income = expenditures)']
Y = phi_C*C + phi_I*I;


% Technology shocks: common and investment-specific

Z = rho_Z*Z(-1) + e_Z;
u_ZI = rho_ZI*u_ZI(-1) + e_ZI;
Z_I = Z + u_ZI;

% Shopping
kappa = rho_kappa*kappa(-1) - e_kappa;
zeta = rho_zeta*zeta(-1) - e_zeta;

% Labor supply
//chi = rho_chi1*chi(-1) + rho_chi2*chi(-2) - e_chi;

% Empirically relevant, log
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Apply base-year prices (Laspeyres index)

C_obs = C - p_C; // equivalent to c - (p_C-P^H) like in BGM
TI_obs = I - p_I;
Y_obs = phi_C*(C-p_C) + phi_I*(I-p_I);
w_obs = w - p_I;
Y_util_obs = phi_C*(C_util-p_C) + phi_I*(I_util-p_I);

SR_obs = Y_obs - (1-wL_Y)*K(-1) - wL_Y*L;
SR_util_obs = Y_util_obs - (1-wL_Y)*K(-1) - wL_Y*L;

lab_prod_obs = Y_obs - L;
labor_share = w_obs + L - Y_obs;
LC_obs = L_C;
LI_obs = L_I;
//L_obs = L + e_L_ME;

% Levels

end;

shocks;
var e_Z = 0.0072;
var e_ZI = 0.0072;
var e_kappa = 0.0072;
var e_zeta = 0.0072;
end;

% Observed variables (4 series) -- excluding labor supply for now
%%%%%%%%%%%%%%%%%%%%
varobs LC_obs, LI_obs, C_obs, TI_obs;

estimated_params;
//x, init_value, lower bound, upper bound, prior shape, prior mean, prior std
sigma, 1.5, 0.5, 4,            GAMMA_PDF, 1.5, 0.25;


% Inverse of Frisch elasticity
//psi_inv, 0.72, 0.1, 5.0,         GAMMA_PDF, 0.74, 0.25;

% Elasticity of TFP wrt real spending
Psi, 0.25, 0.0, 0.5,          BETA_PDF, 0.2, 0.1, 0, 0.5;

% Gross markup
Gamma_bar, 1.3, 1.01, 2.0,    BETA_PDF, 1.3, 0.20, 1.01, 2.0;

% Elasticity parameter matching function
gam, 0.42, 0.01, 2.0,          BETA_PDF, 0.42, 0.3, 0.0, 2.0;

% Adjustment costs
Psi_K, 2.0, 0.00, 30,        GAMMA_PDF, 1.57, 1.5;

% Share of variable labor among labor
//var_share, 0.9, 0.01, 0.999,      BETA_PDF, 0.5, 0.2;

% Capital utilization cost sigma_a
sigma_a, 0.2, 0.0, 30.0,        GAMMA_PDF, 0.32, 0.3;

% Persistence parameters
rho_Z, 0.9, 0.0212, 0.99999,        BETA_PDF, 0.6, 0.2;
rho_ZI, 0.92, 0.0212, 0.99999,       BETA_PDF, 0.6, 0.2;

rho_kappa, 0.95, 0.0212, 0.9999,     BETA_PDF, 0.6, 0.2;
rho_zeta, 0.9, 0.0212, 0.9999,     BETA_PDF, 0.6, 0.2;

% Roots for labor supply
//lambda_1, 0.9, -0.999, 0.9999,       BETA_PDF, 0.6, 0.2, -1, 1;
//lambda_1, 0.9, 0.0212, 0.9999,       BETA_PDF, 0.6, 0.2;
//lambda_2, 0.1, -0.999, 0.999,        BETA_PDF, 0.0, 0.2, -1, 1;


% Conditional standard deviations
% technology: sector-specific and common
stderr e_ZI, 0.01, 0.001, 0.2,  INV_GAMMA_PDF, 0.01, 0.004;
stderr e_Z, 0.01, 0.001, 0.2,  INV_GAMMA_PDF, 0.01, 0.004;

% Shopping demand: sector-specific and common
stderr e_kappa, 0.01, 0.0001, 0.4,  INV_GAMMA_PDF, 0.01, 0.004;
stderr e_zeta, 0.02, 0.0001, 0.4,  INV_GAMMA_PDF, 0.01, 0.004;

% Labor supply
//stderr e_chi, 0.02, 0.001, 0.4,  INV_GAMMA_PDF, 0.01, 0.004;
end;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Estimation options
% local identification
identification(ar=10);
% brute-force search identification
//identification(advanced=1, max_dim_cova_group=2);

resid(1);
steady;
check;


estimation(optim=('MaxIter', 200), 
datafile=observables, 
//mode_file=shopping_JR_simplified_noadj_cost_mode, 
//load_mh_file, 
//mh_recover,
//mcmc_jumping_covariance=prior_variance,

mode_compute=9, 
presample=0, 
lik_init=1,
mh_jscale=0.3, 
mode_check, 
prefilter=1,
mh_replic=250000, 
//mh_replic=0,
mh_nblocks=2, 
bayesian_irf,
mh_drop=0.3, 
prior_trunc=0,
tex)

% Estimation variables
C_obs, TI_obs, Y_obs, lab_prod_obs, labor_share, L_C, L_I, L, p_I_obs;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

stoch_simul (order=1, nofunctions, irf=100, periods=0,
conditional_variance_decomposition=[1 4 8 40])
C_obs, TI_obs, Y_obs, lab_prod_obs, labor_share, L_C, L_I, L, p_I_obs ;


