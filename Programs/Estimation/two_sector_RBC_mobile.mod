

var p_C, p_I, P_C, Q,
C, I, Y,
c_A, 
r_I, r_C,
w, L_C, L_I, L,
//L_obs,
 K_C, K_I, K, lam,
u_C, u_I,
% shock vars
Z, chi,

%observables (4 series)
Y_obs, C_obs, TI_obs, p_I_obs, lab_prod_obs, labor_share, SR_obs;

% 6 shocks, 1 measurement errors--one more shock than observable
varexo e_Z, e_chi;

parameters beta, delta_K, sigma_a, psi_inv, sigma, 
Gamma_bar, wL_Y,  Psi_K, iota,

% persistence parameters
rho_Z, rho_ZI 

% Roots AR(2) process on labor supply
lambda_1, lambda_2;

beta = 0.993;

% Frisch elasticity of labor supply
psi_inv = 0.72;

% IES
sigma = 1.0;
% Adjustment cost parameter 
Psi_K = 5.0;
% Habit formation
iota = 0.0;

% Persistence parameters
rho_ZI = 0.979;
rho_Z = 0.979;

%rho_chi = 0.979;
lambda_1 = 0.979;
lambda_2 = 0.0;

% labor share
wL_Y = 0.667;
delta_K = 0.04325;

% Key elasticities for estimation
Gamma_bar = 1.1; %more reasonable investment share
sigma_a = 10000;
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
#alpha = 1 - Gamma_bar*wL_Y;
#phi_I = alpha/(Gamma_bar)*delta_K/(r+delta_K);

%3) Solve for phi and rho
#rho = Gamma_bar;

% Variable labor

% Great ratios
#phi_C = 1-phi_I;
#r_KK_Y = alpha/(1-alpha)*wL_Y;
#D_Y = 1 - wL_Y - r_KK_Y;



%%%%%Start of main equations%%%%%%%%%%%%%%%%%%%%%%%

% 1) 
[name = 'Variety effect: household']
P_C =  p_C;

% 2) 
[name = 'Variety effect (investment)']
0 =  p_I;

% 3) 
[name = 'Consumption aggregation']
C = P_C + c_A;

% 6) 
[name = 'Labor C']
w + L_C = C; 

% 7) 
[name = 'Labor in I']
w + L_I = I; 

% 8)
[name = 'Capital in C']
r_C+u_C+K_C = w + L_C;

% 9)
[name = 'Capital in I']
r_I+u_I+K_I = w+L_I;

% 10) 
[name = 'Labor intratemporal']
chi + psi*L = lam + w;

% 11) 
[name = 'Capital accumulation (consumption)']
K = (1-delta_K)*K(-1) + delta_K*(I) - (r+delta_K)*(phi_C*u_C+phi_I*u_I);

% 14) 
[name = 'Consumption multiplier']
lam + P_C = -sigma/(1-iota)*(c_A-iota*c_A(-1));


%14) 
[name = 'Euler equation of capital (C))']
   // 0 = lam(+1) - lam + (r+delta_K)/(1+r)*(C(+1)-Gamma_C(+1)-K_C(+1)-u_C(+1));
Q = lam(+1)-lam + (r+delta_K)/(1+r)*(r_C(+1)) + Q(+1)/(1+r);

% 15)
[name = 'Euler equation of capital (I)']
//0 = lam(+1) - lam + (r+delta_K)/(1+r)*(I(+1)-Gamma_I(+1)-K_I(+1)-u_I(+1));
Q = lam(+1)-lam + (r+delta_K)/(1+r)*(r_I(+1)) + Q(+1)/(1+r);

% 16)
[name = 'Capital utilization (C)']
r_C = sigma_a*u_C+Q;

% 17)
[name = 'Capital utilization (I)']
r_I = sigma_a*u_I+Q;

%18)
[name = 'Relative price of capital good']
Q = Psi_K*delta_K*(I-K(-1));

% 19) 
[name = 'Relative price of investment']
p_I_obs = p_I - p_C;


% 19)
[name =  'C production']
C = (p_C + Z + alpha*(u_C+K_C)+(1-alpha)*L_C);

% 20) 
[name = 'I production']
I = (p_I + Z + alpha*(u_I+K_I) + (1-alpha)*L_I);


% 23) 
[name = 'Labor composition']
L = phi_C*L_C + phi_I*(L_I);

% 24) 
[name = 'Capital composition']
K(-1) = phi_C*K_C + phi_I*K_I;


% 25)
//[name = 'Capacity utilization']
//cu = phi_C*(phi*q_C + alpha*u_C) + phi_I*(phi*q_I+alpha*u_I);

% 26) 
[name = 'Aggregate accounting (income = expenditures)']
Y = phi_C*C + phi_I*I;

% Technology shocks: common and investment-specific

Z = rho_Z*Z(-1) + e_Z;
//u_ZI = rho_ZI*Z_I(-1) + e_ZI;
//Z_I = Z + u_ZI;


% Labor supply
chi = rho_chi1*chi(-1) + rho_chi2*chi(-2) - e_chi;

% Empirically relevant, log
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Apply base-year prices (Laspeyres index)

C_obs = C - p_C; // equivalent to c - (p_C-P^H) like in BGM
TI_obs = I - p_I;
Y_obs = phi_C*(C-p_C) + phi_I*(I-p_I);

SR_obs = Y_obs - (1-wL_Y)*K(-1) - wL_Y*L;

lab_prod_obs = Y_obs - L;
labor_share = w-p_I + L - Y_obs;
//L_obs = L + e_L_ME;

% Levels

end;

shocks;
var e_Z = 0.0072;
//var e_ZI = 0.0072;
end;

% Observed variables (4 series) -- excluding labor supply for now
%%%%%%%%%%%%%%%%%%%%

stoch_simul (order=1, nofunctions, irf=100, periods=0,
conditional_variance_decomposition=[1 4 8 40])
C_obs, TI_obs, Y_obs, lab_prod_obs, labor_share, L_C, L_I, L, p_I_obs ;


