

var p_C, p_I, P_C,
C, I, Y,
c_A, r_C, r_I,
w, L_C, L_I, L,
//L_obs,
 K_C, K_I, K, lam,
% shock vars
Z

%observables (4 series)
Y_obs, C_obs, TI_obs, p_I_obs, lab_prod_obs, labor_share, SR_obs;

% 6 shocks, 1 measurement errors--one more shock than observable
varexo e_Z;

parameters beta, delta_K, psi_inv, sigma, 
var_share, Gamma_bar, wL_Y,  Psi_K, iota,

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

% 4) 
[name = 'Labor C']
w + L_C = C; 

% 5) 
[name = 'Labor in I']
w + L_I = I; 

% 6)
[name = 'Capital in C']
r_C+K_C(-1) = w + L_C;

% 7)
[name = 'Capital in I']
r_I + K_I(-1) = w+L_I;

% 8) 
[name = 'Labor intratemporal']
//chi + psi*L = lam + w;
psi*L = lam + w;

% 9) 
[name = 'Capital accumulation (consumption)']
K = (1-delta_K)*K(-1) + delta_K*(I);

% 10) 
[name = 'Consumption multiplier']
lam + P_C = -sigma/(1-iota)*(c_A-iota*c_A(-1));


%11) 
[name = 'Euler equation of capital (C))']
   // 0 = lam(+1) - lam + (r+delta_K)/(1+r)*(C(+1)-Gamma_C(+1)-K_C(+1)-u_C(+1));
0 = lam(+1)-lam + (r+delta_K)/(1+r)*(r_C(+1));

%12) 
[name = 'Euler equation of capital (C))']
   // 0 = lam(+1) - lam + (r+delta_K)/(1+r)*(C(+1)-Gamma_C(+1)-K_C(+1)-u_C(+1));
0 = lam(+1)-lam + (r+delta_K)/(1+r)*(r_I(+1));



% 12) 
[name = 'Relative price of investment']
p_I_obs = p_I - p_C;


% 13)
[name =  'C production']
C = (p_C + Z + alpha*(K_C(-1))+(1-alpha)*L_C);

% 14) 
[name = 'I production']
I = (p_I + Z + alpha*(K_I(-1)) + (1-alpha)*L_I);


% 15) 
[name = 'Labor composition']
L = phi_C*L_C + phi_I*(L_I);

% 16) 
[name = 'Capital composition']
K = phi_C*K_C + phi_I*K_I;


% 17) 
[name = 'Aggregate accounting (income = expenditures)']
Y = phi_C*C + phi_I*I;

% Technology shocks: common and investment-specific

Z = rho_Z*Z(-1) + e_Z;
//u_ZI = rho_ZI*Z_I(-1) + e_ZI;
//Z_I = Z + u_ZI;


% Labor supply
//chi = rho_chi1*chi(-1) + rho_chi2*chi(-2) - e_chi;

% Empirically relevant, log
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Apply base-year prices (Laspeyres index)

C_obs = C - p_C; // equivalent to c - (p_C-P^H) like in BGM
TI_obs = I - p_I;
Y_obs = phi_C*(C-p_C) + phi_I*(I-p_I);

SR_obs = Y_obs - (1-wL_Y)*K - wL_Y*L;

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


