

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
    Z_I         ${Z_I}$ (long_name='Tech:I')
    theta_N     ${\theta_N}$ (long_name='Labor disutility')
    theta_D     ${\theta_D}$ (long_name='Shopping disutility')
    R_C         ${R_C}$ (long_name='Capital rental rate:C')
    R_I         ${R_I}$ (long_name='Capital rental rate:I')
    W           ${W}$ (long_name='Real wage')

    D           ${D}$ (long_name='Shopping effort')
    D_C           ${D}$ (long_name='Shopping effort:C')
    D_I           ${D}$ (long_name='Shopping effort:I')

    Gam        ${\Gamma}$ (long_name = 'Composite utility term')

    p_I        ${p_I}$ (long_name = 'Relative investment price')
    
    g          ${g}$ (long_name = 'Output growth rate due to technology')
    g_z        ${g_z}$ (long_name = 'Growth rate of technology')
    
    log_Y
    log_C
    log_I
    log_N
    log_Y_N
    log_D
    log_p_I
    
    C_obs
    I_obs
    Y_obs
    lab_prod_obs
    p_I_obs
    N_obs
    
    ;

varexo e_g ${e_g}$ (long_name= 'TFP shock')
       e_ZI ${e_ZI}$ (long_name= 'Investment-specific tech shock')
       e_N ${e_N}$ (long_name= 'Labor supply shock')
       e_D ${e_D}$ (long_name = 'Shopping disutility shock')
    ;
    
parameters 
    gam    ${\gamma}$   (long_name= 'Risk aversion')
    r_ann  ${r_ann}$    (long_name='Annual interest rate')
    g_bar  ${\overline{g}}$ (long_name = 'Quarterly growth rate')
    nu     $(\nu)$       (long_name = 'Frisch elasticity')
   
    I_Y    $(I_Y)$   (long_name = 'Investment-output ratio')
    K_Y    $(K_Y)$   (long_name = 'Capital-output ratio (quarterly)')
    labor_share    $(labor share)$   (long_name = 'Labor share')

    phi  $(\phi)$ (long_name = 'Shopping matching function elasticity')
    eta  $(\eta)$ (long_name = 'Shopping disutility')
    Psi  $(\Psi)$ (long_name = 'Matching utilization')

    rho_g    ${\rho_Z}$  (long_name='persistence TFP shock')
    rho_ZI    ${\rho_{ZI}}$  (long_name='persistence I-specific shock')
    rho_N    ${\rho_N}$  (long_name='persistence labor supply shock')
    rho_D    ${\rho_D}$  (long_name='persistence shopping effort shock')

    p_I_ss
    N_ss
    ;

%----------------------------------------------------------------
% set parameter values 
%----------------------------------------------------------------
gam = 1.0; % risk aversion
r_ann = 0.04; % annual interest rate 
g_bar = 0.0074; % quarterly growth rate
nu = 0.72; % Frisch

I_Y = 0.20;
K_Y = 11;
labor_share = 0.67;

phi = 0.32;
eta = 0.20;
Psi = 0.81;

p_I_ss = 1.0;
N_ss = 0.30;

rho_g = 0.9;
rho_ZI = 0.9;
rho_N = 0.9;
rho_D = 0.9;

%----------------------------------------------------------------
% enter model equations
%----------------------------------------------------------------

model;
% Dependent parameters
#r = (1+r_ann)^(1/4) - 1.0;
#I_K = I_Y/K_Y;
#beta=(1/(1+r))*(exp(g_bar))^(gam);
#delta = I_K + 1 - exp(g_bar);

#alpha_N = (1-phi)*labor_share;
#alpha_K = (r+delta)*K_Y;
#g_z_bar = g_bar*(1-alpha_K);

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

#W_ss = (p_I_ss/(1-phi))*alpha_N*I_ss/N_I_ss;

#Z_C_ss = (1-I_Y)/(Psi*exp(g_bar)^(-alpha_K)*K_C_ss^(alpha_K)*N_C_ss^(alpha_N));
#Z_I_ss = (I_Y)/(Psi*exp(g_bar)^(-alpha_K)*K_I_ss^(alpha_K)*N_I_ss^(alpha_N));

#theta_N_ss = (1-phi)*W_ss/(N_ss^(1/nu));


[name='Labor leisure']
theta_N_ss*exp(theta_N)*N^(1/nu) = (1-phi)*W;

[name='Shopping:C']
exp(theta_D)*D^(1/eta) = phi*C/D_C;

[name = 'Shopping:I']
exp(theta_D)*D^(1/eta) = phi*p_I*I/D_I;

[name = 'Composite utility term']
Gam = (C - exp(theta_D)*D^(1+1/eta)/(1+1/eta) - theta_N_ss*exp(theta_N)*N^(1+1/nu)/(1+1/nu));

[name= 'Euler equation: C']
Gam^(-gam)*p_I = beta*((1-phi)*R_C(+1) + p_I(+1)*(1-delta))*Gam(+1)^(-gam)*exp(g(+1))^(-gam);

[name = 'Euler equation: I']
R_I(+1) = R_C(+1);

[name = 'Consumption production']
C = A_C*(D_C)^phi*Z_C_ss*exp(g)^(-alpha_K)*(K_C(-1))^alpha_K*(N_C)^alpha_N;

[name = 'Investment production']
I = A_I*(D_I)^phi*Z_I_ss*exp(Z_I)*exp(g)^(-alpha_K)*(K_I(-1))^alpha_K*(N_I)^alpha_N;

[name = 'Capital law of motion']
I*exp(g) = (K_C + K_I)*exp(g) - (1-delta)*(K_C(-1)+K_I(-1));

[name = 'Labor demand:C']
(1-phi)*W = alpha_N*C/N_C;

[name = 'Capital demand:C']
(1-phi)*R_C = alpha_K*C/(K_C(-1))*exp(g);

[name = 'Labor demand:I']
(1-phi)*W/p_I = alpha_N*I/N_I;

[name = 'Capital demand:I']
(1-phi)*R_I/p_I = alpha_K*I/(K_I(-1))*exp(g);

[name = 'Labor composition']
N = N_C + N_I;

[name = 'Capital composition']
K = K_C + K_I;

[name = 'Shopping composition']
D = D_C + D_I;

[name = 'Output (base-year prices)']
Y = C + p_I_ss*I;

% Exogenous processes
[name='exogenous TFP growth process']
g_z = (1-rho_g)*g_z_bar + rho_g*g_z(-1) + e_g;

[name = 'output growth related to TFP growth']
g = g_z/(1-alpha_K); % implies exp(g) = exp(g_z)^(1/(1-alpha_K));


[name ='investment-specific TFP process']
Z_I = rho_ZI*Z_I(-1) + e_ZI;

[name ='Labor supply process']
theta_N = rho_N*theta_N(-1) - e_N;

[name ='Shopping effort process']
theta_D = rho_D*theta_D(-1) - e_D;


[name='Definition log output']
log_Y = log(Y) - steady_state(log(Y));
[name='Definition log consumption']
log_C = log(C) - steady_state(log(C));
[name = 'Definition log investment']
log_I = log(I) - steady_state(log(I));
[name='Definition log hours']
log_N = log(N) - steady_state(log(N));
[name='Definition log labor productivity']
log_Y_N = log_Y - log_N;
[name = 'Definition log shopping effort']
log_D = log(D) - steady_state(log(D));
[name = 'Definition of log relative investment  price']
log_p_I = log(p_I) - steady_state(log_p_I);

% Observation variables: first differences (demeaned) -> link to data in first differences
C_obs = log_C - log_C(-1);
I_obs = log_I - log_I(-1);
Y_obs = log_Y - log_Y(-1);
lab_prod_obs = log_Y_N - log_Y_N(-1);
p_I_obs = log_p_I - log_p_I(-1);
N_obs = log_N - log_N(-1);


end;

steady_state_model;
    //Do Calibration
    //Calibrate the model to N=0.3, annual interest rate, and normalizations

    N = N_ss;
    Y = 1.0;
    p_I = 1.0;
    I = I_Y;
    C = 1-I_Y;
    D = phi^(eta/(1+eta));
    D_C = (1-I_Y)*D;
    D_I = I_Y*D;

    K = K_Y*exp(g_bar);
    K_I = I_Y*K;
    K_C = (1-I_Y)*K;
    N_I = I_Y*N;
    N_C = (1-I_Y)*N;

    Z_C = 0;
    Z_I = 0;
    u_ZI = 0;
    theta_N = 0;
    theta_D = 0;

    alpha_N_ss = (1-phi)*labor_share;
    W = alpha_N_ss*I/N_I*p_I/(1-phi);
    theta_N_s = (1-phi)*W/(N^(1/nu));
    Gam = C - D^(1+1/eta)/(1+1/eta) - theta_N_s*N^(1+1/nu)/(1+1/nu);
    
    r_ss = (1+r_ann)^(1/4) - 1.0;
    beta_ss = (1/(1+r_ss))*exp(g_bar)^(gam);
    delta_ss = I_Y/K_Y + 1 - exp(g_bar);
    alpha_K_ss = (r_ss+delta_ss)*K_Y;
    
    % Growth parameters
    g = g_bar;
    g_z = g_bar*(1-alpha_K_ss);

    R_C = W*exp(g)*(alpha_K_ss/alpha_N_ss)*N_I/K_I;
    R_I = R_C;
    
    % Logged versions of variables
    log_Y = 0;
    log_C = 0;
    log_I = 0;
    log_N = 0;
    log_Y_N = 0;
    log_D = 0;
    log_p_I = 0;
    
    C_obs = 0;
    I_obs = 0;
    Y_obs = 0;
    lab_prod_obs = 0;
    N_obs = 0;
    p_I_obs = 0;

end;

//set shock variances
shocks;
    var e_g=0.0072^2;
    var e_ZI=0.0072^2;
    var e_N = 0.0072^2;
    var e_D = 0.0072^2;
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

% Persistence parameters
rho_g,  0.1, 0.0001, 0.9,        BETA_PDF, 0.1, 0.05;
rho_ZI,  0.95, 0.01, 0.999999,    BETA_PDF, 0.6, 0.2;
rho_N,  0.6, 0.01, 0.9999,        BETA_PDF, 0.6, 0.2;
rho_D,  0.9, 0.01, 0.9999,        BETA_PDF, 0.6, 0.2;

% Standard errors
stderr e_ZI, 0.01, 0.0001, 0.2,  INV_GAMMA_PDF, 0.01, 0.1;
stderr e_g, 0.01, 0.00001, 0.2,  INV_GAMMA_PDF, 0.01, 0.1;
stderr e_N, 0.01, 0.0001, 0.2,  INV_GAMMA_PDF, 0.01, 0.1;
stderr e_D, 0.01, 0.0001, 0.4,  INV_GAMMA_PDF, 0.01, 0.1;

end;

options_.TeX=1;

varobs I_obs, Y_obs, lab_prod_obs, p_I_obs;


estimation(optim=('MaxIter', 200), 
datafile=observables_fd, 
mode_file=BRS_growth_mode, 
load_mh_file, 
//mh_recover,
//mcmc_jumping_covariance=prior_variance,

mode_compute=0,
presample=0, 
lik_init=1,
//mh_jscale=0.005, 
mh_jscale=0.3,
mode_check, 
//mh_replic=250000, 
mh_replic=0,
mh_nblocks=2, 
bayesian_irf,
irf=100,
mh_drop=0.3, 
moments_varendo,
prior_trunc=0,
tex)
Y_obs, lab_prod_obs, I_obs, p_I_obs, C_obs,
log_I, log_C, log_Y, log_Y_N, log_p_I;


%----------------------------------------------------------------
% generate LaTeX output
%----------------------------------------------------------------

write_latex_dynamic_model;
write_latex_parameter_table;
write_latex_definitions;
write_latex_prior_table;
//generate_trace_plots(1);
collect_latex_files;
% if system(['pdflatex -halt-on-error -interaction=batchmode ' M_.fname '_TeX_binder.tex'])
%     error('TeX-File did not compile.')
% end

%*/
% Stochastic simulation 
stoch_simul (order=1, nofunctions, irf=100, periods=0,
conditional_variance_decomposition=[1 4 8 40])
Y_obs, lab_prod_obs, I_obs, p_I_obs, C_obs,
log_Y, log_Y_N, log_I, log_p_I, log_C;

