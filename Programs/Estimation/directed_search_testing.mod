

var p_C, p_I, P_C, q_C, q_I,
Q_C, Q_I, 
C, Gamma_C, Gamma_I, c_A, C_util, I_util,
I, I_C, I_I,
w, L_C, L_I, L_K, L,
//L_obs,
 K_C, K_I, K, lam, D,
u_C, u_I, cu,
% shock vars
Z, Z_I, u_ZI, zeta
kappa, u_shop,  chi,

%observables (4 series)
Y_obs, C_obs, TI_obs, p_I_obs, lab_prod_obs, SR_obs,
SR_util_obs, Y_util_obs;

% 6 shocks, 1 measurement errors--one more shock than observable
varexo e_ZI, e_Z, e_shop, e_chi;

parameters A, beta, delta_K, sigma_a, psi_inv, sigma, 
var_share, Gamma_bar, wL_Y, phi_I, Psi, Psi_K, gam,
% persistence parameters
rho_Z, rho_ZI , rho_shop, rho_zeta

% Roots AR(2) process on labor supply
lambda_1, lambda_2;

beta = 0.993;

% Frisch elasticity of labor supply
psi_inv = 0.72;
phi = 0.5;

% IES
sigma = 1.0;
% Adjustment cost parameter 
Psi_K = 4.0;


% Persistence parameters
rho_ZI = 0.979;
rho_Z = 0.979;
rho_shop = 0.979;
rho_zeta = 0.979;

%rho_chi = 0.979;
lambda_1 = 0.979;
lambda_2 = 0.0;

% labor share
wL_Y = 0.667;
phi_I = 0.22;
var_share = 0.5; % share of labor in consumption sector which is variable
A = 0.78; % steady-state occupancy rate
delta_K = 0.174/4;

% Key elasticities for estimation
Psi = 0.25;
gam = 0.42;
Gamma_bar = 1.35;

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
#alpha = phi_I*(r+delta_K)*Gamma_bar/delta_K;
#alpha_2 = var_share*(1-alpha);

%2) Consistency of labor share with ρ
#rho =1.0 + (r+delta_K)/delta_K + (Gamma_bar*wL_Y-1)*(r+delta_K)/(alpha*delta_K);

%3) Use Gamma_bar to extract phi
#phi = (rho -Gamma_bar/A^alpha_2)/(rho-alpha_2);

%4) Use Psi to get eta
# eta = phi*(1/Psi+rho-1) -1;
%#eta = 0.0;
% Labor share


% Variable labor

% Great ratios
#phi_C = 1-phi_I;
#D_Y = 1 - wL_Y - phi_I;

% Ratios of inputs to total stock
#phi_LK = (rho-1)*delta_K*alpha/(r+delta_K)/((rho-1)*delta_K*alpha/(r+delta_K)+1-alpha);


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
[name = 'Labor in retail']
w + L_C = C - Gamma_C;

% 7) 
[name = 'Labor in investment']
w + L_I = I - Gamma_I;

% 29) 
[name = 'Employment in investment shopping']
w+L_K = I;

% 8) 
[name = 'Labor intratemporal']
chi + psi*L = -sigma*c_A + w - P_C;

% 9) 
[name = 'Capital accumulation (consumption)']
K_C = (1-delta_K)*K_C(-1) + delta_K*(I_C(-1)) - (r+delta_K)*u_C(-1);

% 10) 
[name = 'Capital accumulation (investment)']
K_I = (1-delta_K)*K_I(-1) + delta_K*(I_I(-1)) - (r+delta_K)*u_I(-1);


% 11)  HH shopping
[name = 'HH shopping']
(1+eta)*q_C = c_A - kappa;

% 12) Workers shopping in investment sector
q_I = zeta + L_K;

% 13) Consumption multiplier
[name = 'Consumption multiplier']
- sigma*c_A = lam + P_C;


%13) 
[name = 'Euler equation of capital (C))']
   // 0 = lam(+1) - lam + (r+delta_K)/(1+r)*(C(+1)-Gamma_C(+1)-K_C(+1)-u_C(+1));
Q_C = lam(+1)-lam + (r+delta_K)/(1+r)*(C(+1)-K_C(+1)-u_C(+1)-Gamma_C(+1)) + Q_C(+1)/(1+r);

% 14)
[name = 'Euler equation of capital (I)']
// 0 = lam(+1) - lam + (r+delta_K)/(1+r)*(I(+1)-Gamma_I(+1)-K_I(+1)-u_I(+1));
Q_I = lam(+1)-lam + (r+delta_K)/(1+r)*(I(+1)-K_I(+1)-u_I(+1)-Gamma_I(+1)) + Q_I(+1)/(1+r);

% 15)
[name = 'Capital utilization (C)']
Q_C + u_C + K_C + sigma_a*u_C = C- Gamma_C;

% 16)
[name = 'Capital utilization (I)']
Q_I + u_I + K_I + sigma_a*u_I = I - Gamma_I;

%17)
[name = 'Relative price of capital good: consumption']
Q_C = Psi_K*delta_K*(I_C-K_C);

%18)
[name = 'Relative price of capital good: investment']
Q_I = Psi_K*delta_K*(I_I-K_I);

% 19) 
[name = 'Relative price of investment']
p_I_obs = p_I - p_C;


% 20)
[name =  'Retail production']
//YC = p_C + Z + (1-alpha_2)*(-phi*Q_C) + alpha*(K_C)+(1-alpha)*L_C;
C = (1-alpha_2)*phi*q_C + p_C + Z + alpha*(u_C+K_C)+(1-alpha)*L_C;

% 21) 
[name = 'Investment production']
I = (1-alpha_2)*(phi*q_I) + p_I + Z_I + alpha*(u_I+K_I) + (1-alpha)*L_I;

% 22) 
//[name = 'Utilization-adjusted retail production']
C_util = p_C + Z + alpha*(K_C) + (1-alpha)*L_C;


% 23) 
[name = 'Investment (utilization-adjusted)']
I_util = p_I + Z_I + alpha*(K_I) + (1-alpha)*(L_I);


% 24) 
[name = 'Labor composition']
L = (1-phi_LK)*(phi_C*L_C + phi_I*(L_I)) + phi_LK*L_K;

% 25) 
[name = 'Capital composition']
K = phi_C*K_C + phi_I*K_I;

% 26)
[name = 'Investment composition']
I = phi_C*I_C + phi_I*I_I;

% 27)
[name = 'Capacity utilization']
cu = phi_C*(phi*q_C + alpha*u_C) + phi_I*(phi*q_I+alpha*u_I);

% 28) 
[name = 'Aggregate accounting (income = expenditures)']
phi_C*C = wL_Y*C + D_Y*D;


% Technology shocks: common and investment-specific

Z = rho_Z*Z(-1) + e_Z;
u_ZI = rho_ZI*Z_I(-1) + e_ZI;
Z_I = Z + u_ZI;

% Shopping
u_shop = rho_shop*u_shop(-1) + e_shop;
kappa = - u_shop;

//zeta = rho_zeta*zeta(-1) + e_zeta;

zeta = u_shop;

% Labor supply
chi = rho_chi1*chi(-1) + rho_chi2*chi(-2) - e_chi;

% Empirically relevant, log
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Apply base-year prices (Laspeyres index)

C_obs = C - p_C; // equivalent to c - (p_C-P^H) like in BGM
TI_obs = I - p_I;
Y_obs = phi_C*(C-p_C) + phi_I*(I-p_I);
Y_util_obs = phi_C*(C_util-p_C) + phi_I*(I_util-p_I);

SR_obs = Y_obs - (1-wL_Y)*K - wL_Y*L;
SR_util_obs = Y_util_obs - (1-wL_Y)*K - wL_Y*L;

lab_prod_obs = Y_obs - L;
//L_obs = L + e_L_ME;

% Levels

end;

shocks;
var e_Z = 0.0072;
var e_ZI = 0.0072;
var e_shop = 0.0072;
//var e_zeta = 0.0072;
end;

% Observed variables (4 series) -- excluding labor supply for now
%%%%%%%%%%%%%%%%%%%%

stoch_simul (order=1, nofunctions, irf=100, periods=0,
conditional_variance_decomposition=[1 4 8 40])
C_obs, Y_obs, D, lab_prod_obs, SR_obs, cu, TI_obs, L_C, L_I, L, p_I_obs, Gamma_C, Gamma_I ;


