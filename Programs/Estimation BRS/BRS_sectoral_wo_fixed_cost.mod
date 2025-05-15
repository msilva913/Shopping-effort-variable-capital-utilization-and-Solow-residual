

// define variables

var Y           ${Y}$ (long_name='output')
    C           ${C}$ (long_name='consumption')
    Y_mc        ${Y_{mc}}$ (long_name = 'consumption non-durable goods')
    Y_sc        $Y_{sc}}$ (long_name = 'consumption services')

    SR          ${SR}$ (long_name='aggregate share-weighted Solow residual')

    I           ${I}$ (long_name = 'investment')
    I_mc         ${I_C}$ (long_name = 'investment:mc')
    I_sc         ${I_C}$ (long_name = 'investment:sc')
    I_I         ${I_I}$ (long_name = 'investment:I')

    K           ${K}$ (long_name='Capital')
    K_mc         ${K_{mc}}$ (long_name='Capital:mc')
    K_sc         ${K_{sc}}$ (long_name='Capital:sc')
    K_I         ${K_I}$ (long_name='Capital:I')

    N           ${N}$   (long_name='Hours')
    N_mc         ${N_{mc}}$ (long_name='Hours:mc')
    N_sc         ${N_{sc}}$ (long_name='Hours:sc')
    N_C         ${N_C}$ (long_name= 'Hours:C')
    N_I         ${N_I}$ (long_name='Hours:I')
    N_comp           ${N}$ (long_name= 'Labor CES aggregate')

    Z_C         ${Z_{C}}$ (long_name='Tech:mc')
    //Z_sc         ${Z_{sc}$ (long_name='Tech:sc')
    u_ZI
    Z_I         ${Z_I}$ (long_name='Tech:I')
    tech         ${tech}$ (long_name = 'General technology measure')
    

    theta_N     ${\theta_N}$ (long_name='Labor disutility')
    theta_D     ${\theta_D}$ (long_name='Shopping disutility')
    theta_I     ${\theta_I}$ (long_name ='Relative shopping disutility')
    theta_b     ${\theta_b}$ (long_name='Discount factor shock')
    mu_C        ${\mu_C}$
    mu_I        $\mu_I}$

    R_mc         ${R_{mc}}$ (long_name='Capital rental rate:mc')
    R_sc         ${R_{sc}}$ (long_name='Capital rental rate:sc')
    R_I         ${R_I}$ (long_name='Capital rental rate:I')
    W_C           ${W_C}$ (long_name='Real wage:C')
    W_I           ${W_I}$ (long_name='Real wage:I')
    W          ${W}$ (long_name='Real wage')

    h_mc         ${h_mc}$ (long_name= 'Capital utilization rate:mc')
    h_sc         ${h_sc}$ (long_name= 'Capital utilization rate:sc')
    h_I         ${h_I}$ (long_name= 'Capital utilization rate:I')
    h           $h$ (long_name = 'Capital utilization rate: average')

    delta_mc    ${\delta_{mc}}$ (long_name= 'Capital depreciation rate:mc')
    delta_sc    ${\delta_{sc}}$ (long_name= 'Capital depreciation rate:sc')
    delta_I    ${\delta_I}$ (long_name= 'Capital depreciation rate:I')

    delta_mc_pr    ${\delta_{mc,pr}$ (long_name= 'Capital depreciation rate derivative:mc')
    delta_sc_pr    ${\delta_{sc,pr}}$ (long_name= 'Capital depreciation rate derivative:sc')
    delta_I_pr    ${\delta_{I,pr}}$ (long_name= 'Capital depreciation rate derivative:I')

    Smc            $S$ (long_name = 'Investment adjustment cost:mc')
    Ssc            $S$ (long_name = 'Investment adjustment cost:sc')
    Si            $S$ (long_name = 'Investment adjustment cost:I')
    Smc_pr         $S_pr$ (long_name = 'Derivative investment adjustment cost:mc')
    Ssc_pr         $S_pr$ (long_name = 'Derivative investment adjustment cost:sc')
    Si_pr         $S_pr$ (long_name = 'Derivative investment adjustment cost:I')

    D           ${D}$ (long_name='Shopping effort')
    D_mc        ${D_{mc}}$ (long_name='Shopping effort:mc')
    D_sc        ${D_{sc}}$ (long_name='Shopping effort:sc')
    D_I         ${D_I}$ (long_name='Shopping effort:I')

    Gam        ${\Gamma}$ (long_name = 'Composite utility term')
    //zeta       ${\zeta}$ (long_name = 'Wealth effects parameter')
    
    p_mc       ${p_{mc}}$ (long_name = 'Relative non-durable price')
    p_sc       ${p_{sc}}$ (long_name = 'Relative service price')
    p_I        ${p_I}$ (long_name = 'Relative investment price')

    lam    ${\lambda}$ (long_name = 'Marginal utility of wealth')
    
    Q_mc          ${Q}$ (long_name = 'Relative price of capital:mc')
    Q_sc          ${Q}$ (long_name = 'Relative price of capital:sc')
    Q_I          ${Q}$ (long_name = 'Relative price of capital:I')
    x_mc          ${x}$ (long_name = 'Growth rate of investment:mc')
    x_sc          ${x}$ (long_name = 'Growth rate of investment:sc')
    x_I          ${x}$ (long_name = 'Growth rate of investment:I')  



    log_SR         (long_name='Solow residual')
    
    util       ${util}$ (long_name = 'Capacity utilization')
    util_ND    ${util_{ND}}$ (long_name = 'Capacity utilization:ND')
    util_sc    ${util_{sc}}$ (long_name = 'Capacity utilization:sc')
    util_D     ${util_D}$ (long_name = 'Capacity utilization:D')

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
    log_h
    log_p_I
    log_util
    log_util_ND
    log_util_D
    log_W
    log_tech

    C_obs
    I_obs
    Y_obs
    SR_obs
    Y_N_obs
    p_I_obs
    N_obs
    NC_obs
    NI_obs

    util_ND_obs
    util_D_obs
    util_obs
    tech_obs

    w_obs
    D_obs
    h_obs
    K_obs
  
    ;

varexo e_g ${e_g}$ (long_name= 'Labor-augmenting-technology growth shock')
       e_Z ${e_Z}$ (long_name= 'TFP shock')
       e_ZI ${e_{ZI}}$ (long_name= 'Investment-specific tech shock')
       
       e_N ${e_N}$ (long_name= 'Labor supply shock')

       e_D ${e_D}$ (long_name = 'Shopping disutility shock')
       e_DI ${e_DI}$ (long_name = 'Relative investment shopping disutility shock')

       e_b ${e_b}$ (long_name = 'Discount factor shock')

       e_muC ${e_{muC}}$ (long_name = 'Wage markup shock: C')
       e_muI ${e_{muI}}$ (long_name = 'Wage markup shock: I')

   
   
    ;
    
parameters 
    sigma    ${\sigma}$   (long_name= 'Risk aversion')
    beta  ${\beta}$    (long_name='Discount factor')
    g_bar  ${\overline{g}}$ (long_name = 'Quarterly trend growth rate')
    nu     $\nu$       (long_name = 'Frisch elasticity')

    xi  $\xi$    (long_name = 'elasticity of substitution between non-durables and services')
    omega_sc $\omega_{sc}$ (long_name = 'Weight of services in aggregator')

    mu_ss    $\mu_{ss}$ (long_name = 'steady-state wage markup')

    sigma_ac ${\sigma_{ac}}$ (long_name = 'Inverse elasticity of marginal utilization cost wrt rental rate:C')
    sigma_ai ${\sigma_{ai}}$ (long_name = 'Inverse elasticity of marginal utilization cost wrt rental rate:I')
    Psi_K ${\Psi_{K}}$ (long_name = 'Investment adjustment cost parameter')
   
    I_Y    ${I_Y}$   (long_name = 'Investment-output ratio')
    K_Y    ${K_Y}$   (long_name = 'Capital-output ratio (quarterly)')
    labor_share    $(labor share)$   (long_name = 'Labor share')
    nu_R   ${\nu_R}$ (long_name = 'Fixed cost share')
    ha     ${ha}$ (long_name = 'Habit persistence')

    phi  ${\phi}$ (long_name = 'Shopping matching function elasticity')
    //m    ${m}$    (long_name = 'Ratio of price dispersion to consumption dispersion')
    eta  ${\eta}$ (long_name = 'Shopping disutility')
    Psi  ${\Psi}$ (long_name = 'Matching utilization')

    theta ${\theta}$ (long_name = 'Inverse intersectoral elasticity of labor supply')

    rho_g    ${\rho_g}$  (long_name='persistence TFP growth shock')
    rho_Z   ${\rho_Z}$  (long_name='persistence TFP shock')
    rho_ZI    ${\rho_{ZI}}$  (long_name='persistence I-specific shock')
    rho_N    ${\rho_N}$  (long_name='persistence labor supply shock')
    rho_D    ${\rho_D}$  (long_name='persistence shopping effort shock')
    rho_DI   ${\rho_{DI}}$ (long_name='persistence relative shopping effort shock')
    rho_b    ${\rho_b}$  (long_name='persistence discount factor shock')
    rho_muC  ${\rho_{muC}}$ (long_name='persistence wage markup shock:C')
    rho_muI  ${\rho_{muI}}$ (long_name='persistence wage markup shock:I')

    p_I_ss
    N_ss
    ;

%----------------------------------------------------------------
% set parameter values 
%----------------------------------------------------------------
sigma = 2.0; % risk aversion
beta = 0.99; % discount factor
//r_ann = 0.04; % annual interest rate 
g_bar = 0.0045; % quarterly growth rate
//sigma_max = (1/4)*log(1+r_ann)/g_bar;
nu = 0.72; % Frisch
ha = 0.0;
mu_ss = 1.15; % steady-state wage markup

xi = 0.85; % elasticity of substitution between non-durables and services
omega_sc = 0.65;

sigma_ac = 0.32; % inverse of elasticity of capital utilization wrt rental rate
sigma_ai = 0.32;
Psi_K = 1.5;

I_Y = 0.20;
K_Y = 11;
labor_share = 0.67;
nu_R = 0.0; % share of fixed costs in output

//m = 0.286;
eta = 0.20;
phi = 0.32;
Psi = 0.81;

theta = 0.5;

p_I_ss = 1.0;
N_ss = 0.30;

rho_g = 0.1;
rho_Z = 0.9;
rho_ZI = 0.9;
rho_N = 0.9;
rho_D = 0.9;
rho_DI = 0.9;
rho_b = 0.9;
rho_muC = 0.9;
rho_muI = 0.9;

%----------------------------------------------------------------
% enter model equations
%----------------------------------------------------------------

model;
% Dependent parameters
#omega_mc = 1-omega_sc;

#I_K = I_Y/K_Y;
#delta = I_K + 1 - exp(g_bar);
//#r = (1+r_ann)^(1/4) - 1.0;
//#beta=(1/(1+r))*(exp(g_bar))^(gam);
#r = exp(g_bar)^(sigma)/beta - 1;

# sigma_b = r + delta;
//#phi = (eta+1)*m/(1+eta*m);

#rho = (xi-1)/xi;

#alpha_K = (r+delta)*K_Y/(1+nu_R);
#alpha_N = (1-phi)*labor_share/(1+nu_R);


#D_ss = phi^(eta/(1+eta));
#D_sc_ss = (1-I_Y)*omega_sc*D_ss;
#D_mc_ss = (1-I_Y)*(1-omega_sc)*D_ss;
#D_I_ss = I_Y*D_ss;

#A_mc = Psi/D_mc_ss^phi;
#A_sc = Psi/D_sc_ss^phi;
#A_I = Psi/D_I_ss^phi;

#I_ss = I_Y;
#C_ss = 1 - I_ss;
#Y_mc_ss = (1-omega_sc)*C_ss;
#Y_sc_ss = omega_sc*C_ss;

#K_ss = K_Y*exp(g_bar);
#K_I_ss = I_Y*K_ss;
#K_mc_ss = (1-I_Y)*(1-omega_sc)*K_ss;
#K_sc_ss = (1-I_Y)*omega_sc*K_ss;

#N_I_ss = I_Y*N_ss;
#N_C_ss = (1-I_Y)*N_ss;
#N_mc_ss = (1-I_Y)*(1-omega_sc)*N_ss;
#N_sc_ss = (1-I_Y)*omega_sc*N_ss;
#omega = N_C_ss/N_ss;

#W_ss = labor_share/N_ss;

#nu_mc = nu_R*Y_mc_ss/Psi;
#nu_sc = nu_R*Y_sc_ss/Psi;
#nu_I = nu_R*I_ss/Psi;

#Z_mc_ss = (Y_mc_ss/(Psi) + nu_mc)/(exp(g_bar)^(-alpha_K)*K_mc_ss^(alpha_K)*N_mc_ss^(alpha_N));
#Z_sc_ss = (Y_sc_ss/(Psi) + nu_sc)/(exp(g_bar)^(-alpha_K)*K_sc_ss^(alpha_K)*N_sc_ss^(alpha_N));
#Z_I_ss = (I_ss/Psi+nu_I)/(exp(g_bar)^(-alpha_K)*K_I_ss^(alpha_K)*N_I_ss^(alpha_N));

#theta_N_ss = (1-phi)*W_ss/(N_ss^(1/nu)*mu_ss);

[name = 'Labor composite']
N_comp = (omega^(-theta)*N_C^(1+theta) + (1-omega)^(-theta)*N_I^(1+theta))^(1/(1+theta));

[name='Labor leisure:C']
theta_N_ss*exp(theta_N)*(N_comp)^(1/nu)*(N_C/N_comp)^theta*omega^(-theta) = (1-phi)*W_C/(mu_ss*exp(mu_C));

[name='Labor leisure:I']
theta_N_ss*exp(theta_N)*(N_comp)^(1/nu)*(N_I/N_comp)^theta*(1-omega)^(-theta)  = (1-phi)*W_I/(mu_ss*exp(mu_I));


[name='Marginal utility of wealth']
lam = Gam^(-sigma)*(1-phi);

[name='Demand curve: mc']
Y_mc = p_mc^(-xi)*omega_mc*C;

[name='Demand curve: sc']
Y_sc = p_sc^(-xi)*omega_sc*C;

[name='Shopping:mc']
exp(theta_D)*D^(1/eta) = phi*p_mc*Y_mc/D_mc;

[name='Shopping:sc']
exp(theta_D)*D^(1/eta) = phi*p_sc*Y_sc/D_sc;

[name = 'Shopping:I']
exp(theta_D)*D^(1/eta)*exp(theta_I) = phi*p_I*I/D_I;

[name = 'Composite utility term']
Gam = C-ha*C(-1) - exp(theta_D)*D^(1+1/eta)/(1+1/eta) - theta_N_ss*exp(theta_N)*N_comp^(1+1/nu)/(1+1/nu);

[name = 'Consumption CES aggregator']
C = (omega_sc^(1-rho)*Y_sc^rho + (1-omega_sc)^(1-rho)*Y_mc^rho)^(1/rho);

//[name = 'Consumption expenditures']
//C = p_mc*Y_mc + p_sc*Y_sc;

[name = 'Investment adjustment cost function:mc']
Smc =Psi_K/2*(x_mc-exp(g_bar))^2;

[name = 'Investment adjustment cost function:mc']
Ssc =Psi_K/2*(x_sc-exp(g_bar))^2;

[name = 'Investment adjustment cost function:I']
Si =Psi_K/2*(x_I-exp(g_bar))^2;

[name = 'Investment adjustment cost function: derivative mc']
Smc_pr = Psi_K*(x_mc-exp(g_bar));

[name = 'Investment adjustment cost function: derivative mc']
Ssc_pr = Psi_K*(x_sc-exp(g_bar));

[name = 'Investment adjustment cost function: derivative I']
Si_pr = Psi_K*(x_I-exp(g_bar));

[name = 'Investment growth:mc']
x_mc = I_mc/I_mc(-1)*exp(g);

[name = 'Investment growth:mc']
x_sc = I_sc/I_sc(-1)*exp(g);

[name = 'Investment growth:I']
x_I = I_I/I_I(-1)*exp(g);

[name = 'Depreciation rate: mc']
delta_mc = delta + sigma_b*(h_mc-1) + sigma_ac*sigma_b/2*(h_mc-1)^2;

[name = 'Depreciation rate: sc']
delta_sc = delta + sigma_b*(h_sc-1) + sigma_ac*sigma_b/2*(h_sc-1)^2;

[name = 'Depreciation rate: I']
delta_I = delta + sigma_b*(h_I-1) + sigma_ai*sigma_b/2*(h_I-1)^2;

[name = 'Depreciation rate derivative: mc']
delta_mc_pr = sigma_b + sigma_ac*sigma_b*(h_mc-1);

[name = 'Depreciation rate derivative: sc']
delta_sc_pr = sigma_b + sigma_ac*sigma_b*(h_sc-1);

[name = 'Depreciation rate derivative: I']
delta_I_pr = sigma_b + sigma_ai*sigma_b*(h_I-1);

[name = 'Tobins Q: mc']
p_I/(1-phi) = Q_mc*(1-Smc_pr*x_mc-Smc) + 
    beta*exp(theta_b)*(lam(+1)/lam)*exp(g(+1))^(-sigma)*Q_mc(+1)*Smc_pr(+1)*x_mc(+1)^2;

[name = 'Tobins Q: sc']
p_I/(1-phi) = Q_sc*(1-Ssc_pr*x_sc-Ssc) + 
    beta*exp(theta_b)*(lam(+1)/lam)*exp(g(+1))^(-sigma)*Q_sc(+1)*Ssc_pr(+1)*x_sc(+1)^2;

[name = 'Tobins Q: I']
p_I/(1-phi) = Q_I*(1-Si_pr*x_I-Si) + 
    beta*exp(theta_b)*(lam(+1)/lam)*exp(g(+1))^(-sigma)*Q_I(+1)*Si_pr(+1)*x_I(+1)^2;

[name= 'Euler equation: mc']
Q_mc = beta*exp(theta_b)*(lam(+1)/lam)*exp(g(+1))^(-sigma)*(R_mc(+1)*h_mc(+1) + (1-delta_mc(+1))*Q_mc(+1));

[name= 'Euler equation: sc']
Q_sc = beta*exp(theta_b)*(lam(+1)/lam)*exp(g(+1))^(-sigma)*(R_sc(+1)*h_sc(+1) + (1-delta_sc(+1))*Q_sc(+1));

[name = 'Euler equation: I']
Q_I = beta*exp(theta_b)*(lam(+1)/lam)*exp(g(+1))^(-sigma)*(R_I(+1)*h_I(+1) + (1-delta_I(+1))*Q_I(+1));


[name = 'Utilization: mc']
delta_mc_pr*Q_mc = R_mc;

[name = 'Utilization: sc']
delta_sc_pr*Q_sc = R_sc;

[name = 'Utilization: I']
delta_I_pr*Q_I = R_I;


[name = 'Non-durable goods production']
Y_mc = A_mc*(D_mc)^phi*(Z_mc_ss*exp(g)^(-alpha_K)*exp(Z_C)*(h_mc*K_mc(-1))^alpha_K*(N_mc)^alpha_N-nu_mc);

[name = 'Services production']
Y_sc = A_sc*(D_sc)^phi*(Z_sc_ss*exp(g)^(-alpha_K)*exp(Z_C)*(h_sc*K_sc(-1))^alpha_K*(N_sc)^alpha_N-nu_sc);

[name = 'Investment production']
I = A_I*(D_I)^phi*(Z_I_ss*exp(g)^(-alpha_K)*exp(Z_I)*(h_I*K_I(-1))^alpha_K*(N_I)^alpha_N-nu_I);

[name = 'Capital law of motion:mc']
K_mc*exp(g) = (1-Smc)*I_mc*exp(g) + (1-delta_mc)*K_mc(-1);

[name = 'Capital law of motion:sc']
K_sc*exp(g) = (1-Ssc)*I_sc*exp(g) + (1-delta_sc)*K_sc(-1);

[name = 'Capital law of motion:I']
K_I*exp(g) = (1-Si)*I_I*exp(g) + (1-delta_I)*K_I(-1);


[name = 'Labor demand:mc']
(1-phi)*W_C/p_mc = alpha_N*(Y_mc+A_mc*D_mc^phi*nu_mc)/N_mc;

[name = 'Labor demand:sc']
(1-phi)*W_C/p_sc = alpha_N*(Y_sc+A_sc*D_sc^phi*nu_sc)/N_sc;

[name = 'Labor demand:I']
(1-phi)*W_I/p_I = alpha_N*(I+A_I*D_I^phi*nu_I)/N_I;

[name = 'Capital demand:mc']
(1-phi)*R_mc/p_mc = exp(g)*alpha_K*(Y_mc+A_mc*D_mc^phi*nu_mc)/(h_mc*K_mc(-1));

[name = 'Capital demand:sc']
(1-phi)*R_sc/p_sc = exp(g)*alpha_K*(Y_sc+A_sc*D_sc^phi*nu_sc)/(h_sc*K_sc(-1));

[name = 'Capital demand:I']
(1-phi)*R_I/p_I = exp(g)*alpha_K*(I+A_I*D_I^phi*nu_I)/(h_I*K_I(-1));

[name = 'Labor composition']
N = N_mc + N_sc + N_I;

[name = 'Labor composition: C']
N_C = N_mc + N_sc;

[name = 'Capital composition']
K = K_mc + K_sc + K_I;

[name = 'Investment composition']
I = I_mc + I_sc + I_I;

[name = 'Shopping composition']
D = D_mc + D_sc + exp(theta_I)*D_I;

[name = 'Capital utilization composition']
h = (Y_mc/Y)*h_mc + (Y_sc/Y)*h_sc + (I/Y)*h_I;

[name = 'Aggregate wage']
W = (N_C/N)*W_C + (N_I/N)*W_I;

[name = 'Output (base-year prices)']
Y = C + p_I_ss*I;

[name = 'Solow residual']
SR = exp(g)^(1-labor_share)*((Y_mc/Y)*Y_mc/(K_mc(-1)^(1-labor_share)*N_mc^(labor_share)) + (Y_sc/Y)*Y_sc/(K_sc(-1)^(1-labor_share)*N_sc^(labor_share)) +(I/Y)*I/(K_I(-1)^(1-labor_share)*N_I^(labor_share)));

[name = 'Capacity utilization']
util_ND = A_mc*D_mc^phi*(Z_mc_ss*exp(g)^(-alpha_K)*exp(Z_C)*(h_mc*K_mc(-1))^alpha_K*N_mc^alpha_N-nu_mc)/(Z_mc_ss*exp(g)^(-alpha_K)*exp(Z_C)*K_mc(-1)^alpha_K*N_mc^alpha_N-nu_mc);

util_sc = A_sc*D_sc^phi*(Z_sc_ss*exp(g)^(-alpha_K)*exp(Z_C)*(h_sc*K_sc(-1))^alpha_K*N_sc^alpha_N-nu_sc)/(Z_sc_ss*exp(g)^(-alpha_K)*exp(Z_C)*K_sc(-1)^alpha_K*N_sc^alpha_N-nu_sc);

util_D = A_I*D_I^phi*(Z_I_ss*exp(g)^(-alpha_K)*exp(Z_I)*(h_I*K_I(-1))^alpha_K*N_I^alpha_N-nu_I)/(Z_I_ss*exp(g)^(-alpha_K)*exp(Z_I)*K_I(-1)^alpha_K*N_I^alpha_N-nu_I);

//util = (Y_mc/(Y_mc+I))*util_ND + (I/(Y_mc+I))*util_D;
util = (Y_mc*util_ND + Y_sc*util_sc + I*util_D)/Y;

[name = 'General technology measure']
tech = (C/Y)*exp(Z_C) + (I/Y)*exp(Z_I);
 
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
theta_b = rho_b*theta_b(-1) + e_b;

[name = 'Wage-markup process: C']
mu_C = rho_muC*mu_C(-1) + e_muC;

[name = 'Wage-markup process: I']
mu_I = rho_muI*mu_I(-1) + e_muI;


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

[name = 'Definition log capital utilization']
log_h = log(h) - steady_state(log(h));

[name = 'Definition of log relative investment  price']
log_p_I = log(p_I) - steady_state(log(p_I));

[name = 'Definition of log capacity utilization']
log_util = log(util) - steady_state(log(util));
log_util_ND = log(util_ND) - steady_state(log(util_ND));
log_util_D = log(util_D) - steady_state(log(util_D));

[name = 'Definition of log wages']
log_W = log(W) - steady_state(log(W));

[name = 'Definition of log Solow residual']
log_SR = log(SR) - steady_state(log(SR));

[name = 'Definition of log technology']
log_tech = log(tech) - steady_state(log(tech));

% Observation variables: first differences (demeaned) -> link to data in first differences (p. 58 of Pfeifer's Observation Equations)
C_obs = log_C - log_C(-1) + g - g_bar ;
I_obs = log_I - log_I(-1) + g - g_bar ;
Y_obs = log_Y - log_Y(-1) + g - g_bar ;
Y_N_obs = log_Y_N - log_Y_N(-1) + g - g_bar ;
K_obs = log_K - log_K(-1) + g - g_bar;
w_obs = log_W - log_W(-1) +g - g_bar;
SR_obs = log_SR - log_SR(-1) + labor_share*(g - g_bar);
tech_obs = log_tech - log_tech(-1) + g - g_bar;

% Stationary variables
p_I_obs = log_p_I - log_p_I(-1);
N_obs = log_N - log_N(-1);
NC_obs = log_NC - log_NC(-1);
NI_obs = log_NI - log_NI(-1);
util_ND_obs = log_util_ND - log_util_ND(-1);
util_D_obs = log_util_D - log_util_D(-1);
util_obs = log_util - log_util(-1);

D_obs = log_D - log_D(-1);
h_obs = log_h - log_h(-1);


end;

steady_state_model;
    //Do Calibration
    //Calibrate the model to N=0.3, annual interest rate, and normalizations
    N = N_ss;
    Y = 1.0;
    p_I = 1.0;
    p_mc = 1.0;
    p_sc = 1.0;
 

    I = I_Y;
    C = 1-I_Y;
    Y_mc = (1-omega_sc)*C;
    Y_sc = omega_sc*C;


    D = phi^(eta/(1+eta));
    D_mc = (1-I_Y)*(1-omega_sc)*D;
    D_sc = (1-I_Y)*omega_sc*D;
    D_I = I_Y*D;

    I_mc = I*C*(1-omega_sc);
    I_sc = I*C*(omega_sc);
    I_I = I*I_Y;
    
    A_mc_ss = Psi/D_mc^phi;
    A_sc_ss = Psi/D_sc^phi;
    A_I_ss = Psi/D_I^phi;

    //K = K_Y;
    K = K_Y*exp(g_bar);
    K_I = I_Y*K;
    K_mc = (1-I_Y)*(1-omega_sc)*K;
    K_sc = (1-I_Y)*omega_sc*K;
    N_I = I_Y*N;
    N_C = (1-I_Y)*N;
    N_mc = (1-omega_sc)*N_C;
    N_sc = (omega_sc)*N_C;
    N_comp = N;

    SR = exp(g_bar)^(1-labor_share)*((Y_mc/Y)*Y_mc/(K_mc^(1-labor_share)*N_mc^(labor_share)) + (Y_sc/Y)*Y_sc/(K_sc^(1-labor_share)*N_sc^(labor_share)) +(I/Y)*I/(K_I^(1-labor_share)*N_I^(labor_share)));

    nu_mc_ss = nu_R*Y_mc/Psi;
    nu_sc_ss = nu_R*Y_sc/Psi;
    nu_I_ss = nu_R*I/Psi;
   

    alpha_N_ss = (1-phi)*labor_share/(1+nu_R);
    W_C = labor_share*Y/N;
    W_I = W_C;
    W = W_C;

    rho_ss = (xi-1)/xi;
    
    //zeta = C*(1-ha) - D^(1+1/eta)/(1+1/eta);
    theta_N_s = (1-phi)*W_C/(N^(1/nu)*mu_ss);
    //Gam^(-sigma)*theta_N_ss*exp(theta_N)*(N_comp)^(1/nu)*(N_C/N_comp)^theta*omega^(-theta) = lam*W_C/(mu_ss*exp(mu_C)*zeta);
    Gam = (C*(1-ha) - D^(1+1/eta)/(1+1/eta) - theta_N_s*N_comp^(1+1/nu)/(1+1/nu));

    lam = Gam^(-sigma)*(1-phi);
   
   
    //r_ss = (1+r_ann)^(1/4) - 1.0;
    //beta_ss = (1/(1+r_ss))*exp(g_bar)^(sigma);
    //delta_ss = I_Y/K_Y*(1+g_bar) - g_bar;
    r_ss = exp(g_bar)^sigma/beta - 1.0;
    delta_ss = I_Y/K_Y + 1 - exp(g_bar);
    sigma_b_ss = r_ss + delta_ss;
    alpha_K_ss = (r_ss+delta_ss)*K_Y/(1+nu_R);

    tech = 1;

    g = g_bar;

    % Utilization variables
    h_mc = 1;
    h_sc = 1;
    h_I = 1;
    h = 1;
    delta_mc = delta_ss;
    delta_sc = delta_ss;
    delta_I = delta_ss;

    delta_mc_pr = sigma_b_ss;
    delta_sc_pr = sigma_b_ss;
    delta_I_pr = sigma_b_ss;

    Q_mc = p_I/(1-phi);
    Q_sc = Q_mc;
    Q_I = Q_mc;
    x_mc = exp(g_bar);
    x_sc = x_mc;
    x_I = x_mc;
    Smc = 0;
    Ssc = 0;
    Si = 0;
    Smc_pr = 0;
    Ssc_pr = 0;
    Si_pr = 0;

    util_ND = Psi;
    util_D = Psi;
    util_sc = Psi;
    util = Psi;

    Z_C = 0;
    Z_I = 0;
    u_ZI = 0;
    theta_N = 0;
    theta_D = 0;
    theta_b = 0;
    theta_I = 0;
    mu_C = 0;
    mu_I = 0;

   
    R_mc = W_C*exp(g)*(alpha_K_ss/alpha_N_ss)*N_mc/K_mc;
    R_sc = W_C*exp(g)*(alpha_K_ss/alpha_N_ss)*N_sc/K_sc;
    R_I = R_mc;
    
   
    
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
    log_util_ND = 0;
    log_util_D = 0;
    log_W = 0;
    
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
    util_ND_obs = 0;
    util_D_obs = 0;
    w_obs = 0;
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
    var e_b = 0.0072^2;
    var e_DI = 0.0072^2;
end;

// local identification
//identification(ar=1);
//check the starting values for the steady state
resid;

// compute steady state given the starting values
steady;
// check Blanchard-Kahn-conditions
check;


estimated_params;
//x, init_value, lower bound, upper bound, prior shape, prior mean, prior std

//sigma, 1.5, 1.0, gam_max,       BETA_PDF, 1.5, 0.25, 1.0, gam_max;
sigma, 1.5, 1.0, 4.0,             BETA_PDF, 1.5, 0.25, 1.0, 4.0;
ha, 0.5, 0.0, 0.95,           BETA_PDF, 0.5, 0.2;
nu, 0.72, 0.05, 2.0,           GAMMA_PDF, 0.72, 0.25;

phi, 0.8, 0.00, 0.999,        BETA_PDF, 0.32, 0.2;
eta, 0.567, 0.00, 10.0,          GAMMA_PDF, 0.2, 0.15;
//m, 0.286, 0.0, 0.95,          GAMMA_PDF, 0.286, 0.2;

xi, 0.85, 0.5, 2.0,        GAMMA_PDF, 0.85, 0.1;


sigma_ac, 0.32, 0.0, 10,       INV_GAMMA_PDF, 1, 1; % Schmitt-Grohe and Uribe (2010), Katayama and Kim (2018)
sigma_ai, 0.32, 0.0, 10,       INV_GAMMA_PDF, 1, 1; % Schmitt-Grohe and Uribe (2010), Katayama and Kim (2018)
Psi_K, 1.5, 0.0, 50,           GAMMA_PDF, 4, 1.0; % Schmitt-Grohe and Uribe (2010), Katayama and Kim (2018)

theta, 0.5, .00, 10,   GAMMA_PDF, 1, 0.5; %Katayama and Kim 2018, based on Horvath (2000)


% Persistence parameters
rho_g,  0.1, 0.0001, 0.9,        BETA_PDF, 0.1, 0.05;
rho_Z, 0.95, 0.01, 0.999999,     BETA_PDF, 0.6, 0.2;
rho_ZI,  0.95, 0.01, 0.999999,    BETA_PDF, 0.6, 0.2;
rho_N,  0.6, 0.01, 0.9999,        BETA_PDF, 0.6, 0.2;
rho_D,  0.9, 0.01, 0.9999,        BETA_PDF, 0.6, 0.2;
rho_DI, 0.9, 0.01, 0.9999,          BETA_PDF, 0.6, 0.2;
rho_b,  0.95, 0.01, 0.99999999,        BETA_PDF, 0.6, 0.2;
rho_muC,  0.95, 0.01, 0.99999999,        BETA_PDF, 0.6, 0.2;
rho_muI,  0.95, 0.01, 0.99999999,        BETA_PDF, 0.6, 0.2;

% Standard errors
stderr e_g, 0.01, 0.0000001, 0.2,  GAMMA_PDF, 0.01, 0.01;
stderr e_Z, 0.01, 0.00001, 0.2,  GAMMA_PDF, 0.01, 0.01;
stderr e_ZI, 0.01, 0.0001, 0.2,  GAMMA_PDF, 0.01, 0.01;

stderr e_N, 0.01, 0.0001, 0.2,  GAMMA_PDF, 0.01, 0.01;
stderr e_D, 0.01, 0.00001, 0.4,  GAMMA_PDF, 0.01, 0.01;
stderr e_DI, 0.01, 0.0001, 0.2,  GAMMA_PDF, 0.01, 0.01;

stderr e_b, 0.01, 0.0001, 0.4,  GAMMA_PDF, 0.01, 0.01;

stderr e_muC, 0.01, 0.0001, 0.2,  GAMMA_PDF, 0.01, 0.01;
stderr e_muI, 0.01, 0.0001, 0.2,  GAMMA_PDF, 0.01, 0.01;

//stderr w_obs, 0.01, 0.0001, 0.05,  GAMMA_PDF, 0.01, 0.01;

% news



end;

options_.TeX=1;

varobs NC_obs, NI_obs, C_obs, I_obs, p_I_obs, util_ND_obs, util_D_obs;


estimation(tex, optim=('MaxIter', 200), 
datafile=observables_sectoral, 
mode_file=BRS_sectoral_wo_fixed_cost_mh_mode, %With _mh option uses mode after MCM run
//nograph,
load_mh_file, 
//mh_recover,
mcmc_jumping_covariance=prior_variance,

mode_compute=0,
presample=0, 
lik_init=2,
mh_jscale=0.006, 
mh_init_scale =0.0001,
//mh_jscale=0.1,
mode_check, 
//mh_replic=200000, 
mh_replic=0,
mh_nblocks=2, 
//bayesian_irf,
//irf=100,
mh_drop=0.3, 
//moments_varendo,
prior_trunc=0)
Y_obs, Y_N_obs, I_obs, p_I_obs, C_obs, NC_obs, NI_obs, util_ND_obs, util_D_obs, SR_obs, util_obs, D_obs, h_obs;
//log_Y, log_Y_N, log_I, log_p_I, log_C, log_N, log_NC, log_NI, util;



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


% Stochastic simulation -> for conditional FEVD and IRF
stoch_simul (order=1, nofunctions, irf=20, periods=0)
//conditional_variance_decomposition=[1 4 8 40])
Y_obs, Y_N_obs, SR_obs, I_obs, p_I_obs, C_obs, NC_obs, NI_obs, util_ND_obs, util_D_obs, util_obs, D_obs, h_obs, tech_obs;
//log_Y, log_Y_N, log_SR, log_I, log_p_I, log_C, log_N, log_NC, log_NI, log_util_ND, log_util_D, log_util, log_D, log_h, log_tech;

% Save artificial data 
//save('artificial_data.mat', 'NC_obs', 'NI_obs', 'C_obs', 'I_obs', 'p_I_obs', 'util_ND_obs', 'util_D_obs', 'w_obs');
