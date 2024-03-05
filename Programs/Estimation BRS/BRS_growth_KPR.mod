

// define variables

var Y           ${Y}$ (long_name='output')
    C           ${C}$ (long_name='consumption')
    I           ${I}$ (long_name = 'investment')
    K           ${K}$ (long_name='Capital')
    K_C         ${K_C}$ (long_name='Capital:C')
    K_I         ${K_I}$ (long_name='Capital:I')
    N           ${N}$   (long_name='Hours')
    N_C         ${N_C}$ (long_name='Hours:C')
    N_I         ${N_I}$ (long_name='Hours:I')
    N_comp           ${N}$ (long_name= 'Labor CES aggregate')

    Z_C         ${Z_C}$ (long_name='Tech:C')
    u_ZI
    Z_I         ${Z_I}$ (long_name='Tech:I')
    theta_N     ${\theta_N}$ (long_name='Labor disutility')
    theta_D     ${\theta_D}$ (long_name='Shopping disutility')
    theta_I     ${\theta_I}$ (long_name ='Relative shopping disutility')
    theta_C     ${\theta_C}$ (long_name='Consumption preference shock')
    R_C         ${R_C}$ (long_name='Capital rental rate:C')
    R_I         ${R_I}$ (long_name='Capital rental rate:I')
    W_C           ${W}$ (long_name='Real wage:C')
    W_I           ${W}$ (long_name='Real wage:C')

    h_C         ${h_C}$ (long_name= 'Capital utilization rate:C')
    h_I         ${h_I}$ (long_name= 'Capital utilization rate:I')

    delta_C    ${\delta_C}$ (long_name= 'Capital depreciation rate:C')
    delta_I    ${\delta_I}$ (long_name= 'Capital depreciation rate:I')

    delta_C_pr    ${\delta_C}$ (long_name= 'Capital depreciation rate derivative:C')
    delta_I_pr    ${\delta_I}$ (long_name= 'Capital depreciation rate derivative:I')
    S            $S$ (long_name = 'Investment adjustment cost')
    S_pr         $S_pr$ (long_name = 'Derivative investment adjustment cost')

    D           ${D}$ (long_name='Shopping effort')
    D_C           ${D}$ (long_name='Shopping effort:C')
    D_I           ${D}$ (long_name='Shopping effort:I')

    Gam        ${\Gamma}$ (long_name = 'Composite utility term')

    p_I        ${p_I}$ (long_name = 'Relative investment price')
    Q          ${Q}$ (long_name = 'Relative price of capital')
    x          ${x}$ (long_name = 'Growth rate of investment')

    log_SR         (long_name='Solow residual')
    
    util       ${util}$ (long_name = 'Capacity utilization:')

    g          ${g}$ (long_name = 'Growth rate of stochastic trend')
    
    log_Y
    log_C
    log_I
    log_N
    log_NC
    log_NI
    log_K
    log_Y_N
    log_D
    log_p_I
    log_util
    
    C_obs
    I_obs
    Y_obs
    Y_N_obs
    p_I_obs
    N_obs
    NC_obs
    NI_obs
    util_obs
    D_obs
    K_obs
    SR_obs
  
    ;

varexo e_g ${e_g}$ (long_name= 'Labor-augmenting-technology growth shock')
       e_Z ${e_Z}$ (long_name= 'TFP shock')
       e_ZI ${e_{ZI}}$ (long_name= 'Investment-specific tech shock')
       e_N ${e_N}$ (long_name= 'Labor supply shock')
       e_D ${e_D}$ (long_name = 'Shopping disutility shock')
       e_DI ${e_DI}$ (long_name = 'Relative investment shopping disutility shock')
       e_C ${e_C}$ (long_name = 'Consumption preference shock')
    ;
    
parameters 
    gam    ${\gamma}$   (long_name= 'Risk aversion')
    gam_max ${\gamma_{max}}$ (long_name= 'Upper bound on risk aversion')
    r_ann  ${r_ann}$    (long_name='Annual interest rate')
    g_bar  ${\overline{g}}$ (long_name = 'Quarterly trend growth rate')
    xi     $\nu$       (long_name = 'Frisch elasticity parameter')
    sigma_a ${\sigma_a}$ (long_name = 'Inverse elasticity of marginal utilization cost wrt rental rate')
    Psi_K ${\Psi_K}$ (long_name = 'Investment adjustment cost parameter')
   
    I_Y    ${I_Y}$   (long_name = 'Investment-output ratio')
    K_Y    ${K_Y}$   (long_name = 'Capital-output ratio (quarterly)')
    labor_share    $(labor share)$   (long_name = 'Labor share')
    nu_R   ${\nu_R}$ (long_name = 'Fixed cost share')
    ha     ${ha}$ (long_name = 'Habit persistence')

    //phi  ${\phi}$ (long_name = 'Shopping matching function elasticity')
    m    ${m}$    (long_name = 'Ratio of price dispersion to consumption dispersion')
    eta  ${\eta}$ (long_name = 'Shopping disutility')
    Psi  ${\Psi}$ (long_name = 'Matching utilization')

    theta ${\theta}$ (long_name = 'Inverse intersectoral elasticity of labor supply')

    rho_g    ${\rho_g}$  (long_name='persistence TFP growth shock')
    rho_Z   ${\rho_Z}$  (long_name='persistence TFP shock')
    rho_ZI    ${\rho_{ZI}}$  (long_name='persistence I-specific shock')
    rho_N    ${\rho_N}$  (long_name='persistence labor supply shock')
    rho_D    ${\rho_D}$  (long_name='persistence shopping effort shock')
    rho_DI   ${\rho_{DI}}$ (long_name='persistence relative shopping effort shock')
    rho_C    ${\rho_C}$  (long_name='persistence consumption preference shock')

    p_I_ss
    N_ss
    ;

%----------------------------------------------------------------
% set parameter values 
%----------------------------------------------------------------
gam = 2.0; % risk aversion
r_ann = 0.04; % annual interest rate 
g_bar = 0.0045; % quarterly growth rate
gam_max = (1/4)*log(1+r_ann)/g_bar;
sigma_a = 0.32; % inverse of elasticity of capital utilization wrt rental rate
Psi_K = 1.5;
ha = 0.1;

I_Y = 0.20;
K_Y = 11;
labor_share = 0.67;
nu_R = 0.2; % share of fixed costs in output

m = 0.286;
eta = 0.20;
//phi = 0.32;
Psi = 0.81;

theta = 0.5;

p_I_ss = 1.0;
N_ss = 0.30;

xi = (1-N_ss)/N_ss*(1/0.72);

rho_g = 0.1;
rho_Z = 0.9;
rho_ZI = 0.9;
rho_N = 0.9;
rho_D = 0.9;
rho_DI = 0.9;
rho_C = 0.9;

%----------------------------------------------------------------
% enter model equations
%----------------------------------------------------------------

model;
% Dependent parameters
#r = (1+r_ann)^(1/4) - 1.0;
#I_K = I_Y/K_Y;
#delta = I_K + 1 - exp(g_bar);
#beta=(1/(1+r))*(exp(g_bar))^(gam);

# sigma_b = r + delta;
#phi = (eta+1)*m/(1+eta*m);

#alpha_K = (r+delta)*K_Y/(1+nu_R);
#alpha_N = (1-phi)*labor_share/(1+nu_R);


#D_ss = phi^(eta/(1+eta));
#D_C_ss = (1-I_Y)*D_ss;
#D_I_ss = I_Y*D_ss;
#A_C = Psi/D_C_ss^phi;
#A_I = Psi/D_I_ss^phi;

#I_ss = I_Y;
#C_ss = 1 - I_ss;
#K_ss = K_Y*exp(g_bar);
#K_I_ss = I_Y*K_ss;
#K_C_ss = (1-I_Y)*K_ss;
#N_I_ss = I_Y*N_ss;
#N_C_ss = (1-I_Y)*N_ss;
#omega = N_C_ss/N_ss;

#W_ss = labor_share/N_ss;
#Gam_ss = C_ss*(1-ha) - D_ss^(1+1/eta)/(1+1/eta);

#nu_C = nu_R*C_ss/Psi;
#nu_I = nu_R*I_ss/Psi;

#Z_C_ss = (C_ss/(Psi) + nu_C)/(exp(g_bar)^(-alpha_K)*K_C_ss^(alpha_K)*N_C_ss^(alpha_N));
#Z_I_ss = (I_ss/Psi+nu_I)/(exp(g_bar)^(-alpha_K)*K_I_ss^(alpha_K)*N_I_ss^(alpha_N));

#theta_N_ss = (1-phi)*W_ss/(Gam_ss*(1-N_ss)^(-xi));

[name = 'Labor composite']
N_comp = (omega^(-theta)*N_C^(1+theta) + (1-omega)^(-theta)*N_I^(1+theta))^(1/(1+theta));

[name = 'Composite utility term']
Gam = exp(theta_C)*(C-ha*C(-1)) - exp(theta_D)*D^(1+1/eta)/(1+1/eta);

[name='Labor leisure:C']
theta_N_ss*exp(theta_N)*(1-N_comp)^(-xi)*(N_C/N_comp)^theta*omega^(-theta) = exp(theta_C)*(1-phi)*W_C/Gam;

[name='Labor leisure:I']
theta_N_ss*exp(theta_N)*(1-N_comp)^(-xi)*(N_I/N_comp)^theta*(1-omega)^(-theta)  = exp(theta_C)*(1-phi)*W_I/Gam;

[name='Shopping:C']
exp(theta_D)*D^(1/eta) = exp(theta_C)*phi*C/D_C;

[name = 'Shopping:I']
//exp(theta_D)*D^(1/eta) = phi*exp(theta_C)*p_I*I/D_I;
exp(theta_D)*D^(1/eta)*exp(theta_I) = phi*exp(theta_C)*p_I*I/D_I;


[name = 'Investment adjustment cost function']
S =Psi_K/2*(x-exp(g_bar))^2;

[name = 'Investment adjustment cost function: derivative']
S_pr = Psi_K*(x-exp(g_bar));

[name = 'Investment growth']
x = I/I(-1)*exp(g);

[name = 'Tobins Q']
p_I/(1-phi) = Q*(1-S_pr*x-S) + 
    beta*exp(theta_C(+1))/exp(theta_C)*(Gam(+1)/Gam)^(-gam)*exp(g(+1))^(-gam)*Q(+1)*S_pr(+1)*x(+1)^2;

[name= 'Euler equation: C']
//Q = beta*(Gam(+1)/Gam)^(-gam)*exp(g(+1))^(-gam)*(R_C(+1)*h_C(+1) + (1-delta_C(+1))*Q(+1));
Q = beta*exp(theta_C(+1))/exp(theta_C)*(Gam(+1)/Gam)^(-gam)*exp(g(+1))^(-gam)*(R_C(+1)*h_C(+1) + (1-delta_C(+1))*Q(+1));

[name = 'Euler equation: I']
//Q = beta*(Gam(+1)/Gam)^(-gam)*exp(g(+1))^(-gam)*(R_I(+1)*h_I(+1) + (1-delta_I(+1))*Q(+1));
Q = beta*exp(theta_C(+1))/exp(theta_C)*(Gam(+1)/Gam)^(-gam)*exp(g(+1))^(-gam)*(R_I(+1)*h_I(+1) + (1-delta_I(+1))*Q(+1));


[name = 'Utilization: C']
delta_C_pr*Q = R_C;

[name = 'Utilization: I']
delta_I_pr*Q = R_I;

[name = 'Depreciation rate: C']
delta_C = delta + sigma_b*(h_C-1) + sigma_a*sigma_b/2*(h_C-1)^2;

[name = 'Depreciation rate: I']
delta_I = delta + sigma_b*(h_I-1) + sigma_a*sigma_b/2*(h_I-1)^2;

[name = 'Depreciation rate derivative: C']
delta_C_pr = sigma_b + sigma_a*sigma_b*(h_C-1);

[name = 'Depreciation rate derivative: I']
delta_I_pr = sigma_b + sigma_a*sigma_b*(h_I-1);

[name = 'Consumption production']
C = A_C*(D_C)^phi*(Z_C_ss*exp(g)^(-alpha_K)*exp(Z_C)*(h_C*K_C(-1))^alpha_K*(N_C)^alpha_N-nu_C);

[name = 'Investment production']
I = A_I*(D_I)^phi*(Z_I_ss*exp(g)^(-alpha_K)*exp(Z_I)*(h_I*K_I(-1))^alpha_K*(N_I)^alpha_N-nu_I);

[name = 'Capital law of motion']
(1-S)*I*exp(g) = (K_C + K_I)*exp(g) - (1-delta_C)*K_C(-1) - (1-delta_I)*K_I(-1);
//I*exp(g) = (K_C + K_I)*exp(g) - (1-delta_C)*K_C(-1) - (1-delta_I)*K_I(-1);

[name = 'Labor demand:C']
(1-phi)*W_C = alpha_N*(C+A_C*D_C^phi*nu_C)/N_C;

[name = 'Labor demand:I']
(1-phi)*W_I/p_I = alpha_N*(I+A_I*D_I^phi*nu_I)/N_I;

[name = 'Capital demand:C']
(1-phi)*R_C = exp(g)*alpha_K*(C+A_C*D_C^phi*nu_C)/(h_C*K_C(-1));

[name = 'Capital demand:I']
(1-phi)*R_I/p_I = exp(g)*alpha_K*(I+A_I*D_I^phi*nu_I)/(h_I*K_I(-1));

[name = 'Labor composition']
N = N_C + N_I;

[name = 'Capital composition']
K = K_C + K_I;

[name = 'Shopping composition']
D = D_C + exp(theta_I)*D_I;

[name = 'Output (base-year prices)']
Y = C + p_I_ss*I;

[name = 'Capacity utilization']
util = (C/Y)*A_C*D_C^phi*((h_C*K_C(-1))^alpha_K*N_C^alpha_N-nu_C)/(K_C(-1)^alpha_K*N_C^alpha_N-nu_C) + 
(I/Y)*A_I*D_I^phi*((h_I*K_I(-1))^alpha_K*N_I^alpha_N-nu_I)/(K_I(-1)^alpha_K*N_I^alpha_N-nu_I);
 
% Exogenous processes
[name='stochastic trend process']
g = (1-rho_g)*g_bar + rho_g*g(-1) + e_g;

[name='Stationary TFP process']
Z_C = rho_Z*Z_C(-1) + e_Z;

[name='Independent component of I-specific tech']
u_ZI = rho_ZI*Z_I(-1) + e_ZI;

[name ='Investment-specific TFP process']
Z_I = Z_C + u_ZI;

[name ='Labor supply process']
theta_N = rho_N*theta_N(-1) - e_N;

[name ='Shopping effort process']
theta_D = rho_D*theta_D(-1) - e_D;

[name ='Relative shopping effort process']
theta_I = rho_DI*theta_I(-1) - e_DI;

[name='Consumption preference process']
theta_C = rho_C*theta_C(-1) + e_C;


[name='Definition log output']
log_Y = log(Y) - steady_state(log(Y));
[name='Definition log consumption']
log_C = log(C) - steady_state(log(C));
[name = 'Definition log investment']
log_I = log(I) - steady_state(log(I));
[name='Definition log hours']
log_N = log(N) - steady_state(log(N));
log_NC = log(N_C) - steady_state(log(N_C));
log_NI = log(N_I) - steady_state(log(N_I));

[name='log capital']
log_K = log(K) - steady_state(log(K));
[name='Definition log labor productivity']
log_Y_N = log_Y - log_N;
[name = 'Definition log shopping effort']
log_D = log(D) - steady_state(log(D));
[name = 'Definition of log relative investment  price']
log_p_I = log(p_I) - steady_state(log_p_I);
[name = 'Definition of log capacity utilization']
log_util = log(util) - steady_state(log(util));
[name = 'Definition of log Solow residual']
log_SR = log_Y - (1-labor_share)*log_K(-1) - labor_share*log_N;

% Observation variables: first differences (demeaned) -> link to data in first differences (p. 58 of Pfeifer's Observation Equations)
C_obs = log_C - log_C(-1) + g - g_bar ;
I_obs = log_I - log_I(-1) + g - g_bar ;
Y_obs = log_Y - log_Y(-1) + g - g_bar ;
Y_N_obs = log_Y_N - log_Y_N(-1) + g - g_bar ;
K_obs = log_K - log_K(-1) + g - g_bar;
SR_obs = Y_obs - labor_share*N_obs - (1-labor_share)*K_obs(-1);

% Stationary variables
p_I_obs = log_p_I - log_p_I(-1);
N_obs = log_N - log_N(-1);
NC_obs = log_NC - log_NC(-1);
NI_obs = log_NI - log_NI(-1);
util_obs = log_util - log_util(-1);
D_obs = log_D - log_D(-1);

end;

steady_state_model;
    //Do Calibration
    //Calibrate the model to N=0.3, annual interest rate, and normalizations
    N = N_ss;
    Y = 1.0;
    p_I = 1.0;
    
    phi_ss = (eta+1)*m/(1+eta*m);

    I = I_Y;
    C = 1-I_Y;
    D = phi_ss^(eta/(1+eta));
    D_C = (1-I_Y)*D;
    D_I = I_Y*D;
    
    A_C_ss = Psi/D_C^phi_ss;
    A_I_ss = Psi/D_I^phi_ss;

    //K = K_Y;
    K = K_Y*exp(g_bar);
    K_I = I_Y*K;
    K_C = (1-I_Y)*K;
    N_I = I_Y*N;
    N_C = (1-I_Y)*N;
    omega_ss = N_C/N;
    N_comp = N;

    nu_C_ss = nu_R*C/Psi;
    nu_I_ss = nu_R*I/Psi;
   
    Gam = C*(1-ha) - D^(1+1/eta)/(1+1/eta);
    alpha_N_ss = (1-phi_ss)*labor_share/(1+nu_R);
    W_C = labor_share*Y/N;
    W_I = W_C;
   
    r_ss = (1+r_ann)^(1/4) - 1.0;
    beta_ss = (1/(1+r_ss))*exp(g_bar)^(gam);
    //delta_ss = I_Y/K_Y*(1+g_bar) - g_bar;
    delta_ss = I_Y/K_Y + 1 - exp(g_bar);
    sigma_b_ss = r_ss + delta_ss;
    alpha_K_ss = (r_ss+delta_ss)*K_Y/(1+nu_R);

    g = g_bar;

    % Utilization variables
    h_C = 1;
    h_I = 1;
    delta_C = delta_ss;
    delta_I = delta_ss;

    delta_C_pr = sigma_b_ss;
    delta_I_pr = sigma_b_ss;

    Q = p_I/(1-phi_ss);
    x = exp(g_bar);
    S = 0;
    S_pr = 0;
    

    util_C = A_C_ss*D_C^phi_ss*((h_C*K_C)^alpha_K_ss*N_C^alpha_N_ss-nu_C_ss)/(K_C^alpha_K_ss*N_C^alpha_N_ss-nu_C_ss);
    util_I = A_I_ss*D_I^phi_ss*((h_I*K_I)^alpha_K_ss*N_I^alpha_N_ss-nu_I_ss)/(K_I^alpha_K_ss*N_I^alpha_N_ss-nu_I_ss);
    util = (C/Y)*util_C + (I/Y)*util_I;

    Z_C = 0;
    Z_I = 0;
    u_ZI = 0;
    theta_N = 0;
    theta_D = 0;
    theta_C = 0;
    theta_I = 0;

   
    R_C = W_C*exp(g)*(alpha_K_ss/alpha_N_ss)*N_C/K_C;
    R_I = R_C;
    
    % Logged versions of variables
    log_Y = 0;
    log_C = 0;
    log_I = 0;
    log_N = 0;
    log_NC = 0;
    log_NI = 0;
    log_K = 0;
    log_Y_N = 0;
    log_D = 0;
    log_p_I = 0;
    log_util = 0;
    log_SR = 0;
    
    C_obs = 0;
    I_obs = 0;
    Y_obs = 0;
    Y_N_obs = 0;
    N_obs = 0;
    NC_obs = 0;
    NI_obs = 0;
    K_obs = 0;
    p_I_obs = 0;
    util_obs = 0;
    D_obs = 0;
    SR_obs = 0;

end;

//set shock variances
shocks;
    var e_g=0.0072^2;
    var e_Z = 0.0072^2;
    var e_ZI=0.0072^2;
    var e_N = 0.0072^2;
    var e_D = 0.0072^2;
    var e_C = 0.0072^2;
    var e_DI = 0.0072^2;
end;

// local identification
//identification(ar=10);
//check the starting values for the steady state
resid;

// compute steady state given the starting values
steady;
// check Blanchard-Kahn-conditions
check;

%/*
estimated_params;
//x, init_value, lower bound, upper bound, prior shape, prior mean, prior std

//gam, 1.5, 0.5, 4,            GAMMA_PDF, 1.5, 0.25;
gam, 1.5, 1.0, gam_max,       BETA_PDF, 1.5, 0.25, 1.0, gam_max;
ha, 0.5, 0.0, 0.95,           BETA_PDF, 0.5, 0.2;
m, 0.286, 0.0, 0.95,          GAMMA_PDF, 0.286, 0.2;
xi, 3.24, 0.1, 10.0,           GAMMA_PDF, 3.24, 0.5;

sigma_a, 0.32, 0.0, 10,       INV_GAMMA_PDF, 1, 1;
Psi_K, 1.5, 0.0, 50,           GAMMA_PDF, 4, 1.0; % Schmitt-Grohe and Uribe (2010), Katayama and Kim 2018, 

//phi, 0.32, 0.00, 0.999,        BETA_PDF, 0.32, 0.2;
eta, 0.20, 0.00, 10.0,          GAMMA_PDF, 0.2, 0.15;

theta, 0.5, .00, 10,   GAMMA_PDF, 1, 0.5; %Katayama and Kim 2018, based on Horvath (2000)


% Persistence parameters
rho_g,  0.1, 0.0001, 0.9,        BETA_PDF, 0.1, 0.05;
rho_Z, 0.95, 0.01, 0.999999,     BETA_PDF, 0.6, 0.2;
rho_ZI,  0.95, 0.01, 0.999999,    BETA_PDF, 0.6, 0.2;
rho_N,  0.6, 0.01, 0.9999,        BETA_PDF, 0.6, 0.2;
rho_D,  0.95, 0.01, 0.9999,        BETA_PDF, 0.6, 0.2;
rho_DI, 0.95, 0.01, 0.9999,          BETA_PDF, 0.6, 0.2;
rho_C,  0.95, 0.01, 0.99999999,        BETA_PDF, 0.6, 0.2;

% Standard errors
stderr e_g, 0.01, 0.00001, 0.2,  INV_GAMMA_PDF, 0.01, 0.1;
stderr e_Z, 0.01, 0.00001, 0.2,  INV_GAMMA_PDF, 0.01, 0.1;
stderr e_ZI, 0.01, 0.0001, 0.2,  INV_GAMMA_PDF, 0.01, 0.1;
stderr e_N, 0.01, 0.0001, 0.2,  INV_GAMMA_PDF, 0.01, 0.1;
stderr e_D, 0.01, 0.0001, 0.4,  INV_GAMMA_PDF, 0.01, 0.1;
stderr e_DI, 0.01, 0.0001, 0.2,  INV_GAMMA_PDF, 0.01, 0.1;
stderr e_C, 0.01, 0.0001, 0.4,  INV_GAMMA_PDF, 0.01, 0.1;

end;

options_.TeX=1;

varobs I_obs, Y_obs, Y_N_obs, p_I_obs;
//varobs NC_obs, NI_obs, C_obs, I_obs, p_I_obs;


estimation(tex, optim=('MaxIter', 200), 
datafile=observables_sectoral, 
//mode_file=BRS_growth_mode, 
//nograph,
//load_mh_file, 
//mh_recover,
mcmc_jumping_covariance=prior_variance,

mode_compute=1,
presample=0, 
lik_init=2,
mh_jscale=0.002, 
mh_init_scale =0.0004,
//mh_jscale=0.3,
mode_check, 
mh_replic=150000, 
//mh_replic=0,
mh_nblocks=2, 
//bayesian_irf,
//irf=100,
mh_drop=0.3, 
//moments_varendo,
prior_trunc=0)
Y_obs, Y_N_obs, I_obs, p_I_obs, C_obs, NC_obs, NI_obs, util_obs;
//log_Y, log_Y_N, log_I, log_p_I, log_C, log_N, log_NC, log_NI, util;



%----------------------------------------------------------------
% generate LaTeX output
%----------------------------------------------------------------

write_latex_dynamic_model;
write_latex_parameter_table;
write_latex_definitions;
write_latex_prior_table;
generate_trace_plots(1);
collect_latex_files;
% if system(['pdflatex -halt-on-error -interaction=batchmode ' M_.fname '_TeX_binder.tex'])
%     error('TeX-File did not compile.')
% end

%*/
% Stochastic simulation -> for conditional FEVD and IRF
stoch_simul (order=1, nofunctions, irf=100, periods=0,
conditional_variance_decomposition=[1 4 8 40])
Y_obs, Y_N_obs, SR_obs, I_obs, p_I_obs, C_obs, NC_obs, NI_obs, util_obs, D_obs,
log_Y, log_Y_N, log_SR, log_I, log_p_I, log_C, log_N, log_NC, log_NI, log_util, log_D;

