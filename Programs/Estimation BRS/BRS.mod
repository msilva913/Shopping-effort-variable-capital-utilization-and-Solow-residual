

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
    Z_C         ${Z_C}$ (long_name='Tech:C')
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
    
    ;

varexo e_Z ${e_Z}$ (long_name= 'TFP shock')
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

    phi  $(\phi)$ (long_name = 'Shopping matching function elasticity');
    eta  $(\eta)$ (long_name = 'Shopping disutility');
    Psi  $(\Psi)$ (long_name = 'Matching utilization');

    rho_Z    ${\rho_Z}$  (long_name='persistence TFP shock')
    rho_ZI    ${\rho_ZI}$  (long_name='persistence I-specific shock')
    rho_N    ${\rho_N}$  (long_name='persistence labor supply shock')
    rho_D    ${\rho_D}$  (long_name='persistence shopping effort shock')

    p_I_ss
    ;

%----------------------------------------------------------------
% set parameter values 
%----------------------------------------------------------------
gam = 2.0; % risk aversion
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

%----------------------------------------------------------------
% enter model equations
%----------------------------------------------------------------

model;
% Dependent parameters
#r = (1+r_ann)^(1/4) - 1.0;
#beta = (1/(1+r))*(1+g_bar)^(gam);
#delta = I_Y/K_Y - g_bar;
#alpha_N = (1-phi)*labor_share;
#R_pi = (1-β*(1+g_bar)^(-gam)*(1-delta))/(beta*(1+g_bar)^(-gam));
#alpha_K = R_pi *K_Y;

#D_ss = phi^(eta/((1+eta));
#D_C_ss = (1-I_Y)*D_ss
#D_I_ss = I_Y*D_ss
#A_C = Psi/D_C_ss^phi;
#A_I = Psi/D_I_ss^phi;

#I_ss = I_Y;
#C_ss = 1 - I;
#K_ss = K_Y;
#K_I_ss = I_Y*K_ss;
#K_C_ss = (1-I_Y)*K_ss;
#N_I_ss = I_Y*N_ss;
#N_C_ss = (1-I_Y)*N_ss;

#W_ss = (p_I_ss/(1-phi))*alpha_N*I_ss/N_I_ss;

#Z_C_ss = (1-I_Y)/(Psi*K_C_ss^(alpha_K)*N_C_ss^(alpha_N));
#Z_I_ss = (1-I_Y)/(Psi*K_I_ss^(alpha_K)*N_I_ss^(alpha_N));

#theta_n_ss = (1-phi)*W_ss/(N_ss^(1/nu));


[name='Labor leisure']
theta_n_ss*exp(theta_n)*n^(1/nu) = (1-phi)*W;

[name='Shopping:C']
exp(theta_d)*D^(1/eta) = phi*C/D_C;

[name = 'Shopping:I']
exp(theta_d)*D^(1/eta) = phi*p_I*I/D_I;

[name = 'Composite utility term']
Gam = (C - exp(theta_D)*D^(1+1/eta)/(1+1/eta) - theta_n_ss*exp(theta_n)*n^(1+1/nu)/(1+1/nu))

[name= = 'Euler equation']
Gam^(-gam)*p_I = beta*((1-phi)*R_C(+1) + p_I(+1)*(1-delta))*Gam(+1)^(-gam));

[name = 'Consumption production']
C = A_C*(D_C)^phi*Z_C_ss*exp(Z_C)*(K_C(-1))^alpha_K*(N_C)^alpha_N;

[name = 'Investment production']
I = A_I*(D_I)^phi*Z_I_ss*exp(Z_I)*(K_I(-1))^alpha_K*(N_I)^alpha_N;

[name = 'Capital law of motion']
I = K_C + K_I - (1-delta)*(K_C(-1)+K_I(-1));

[name = 'Labor demand:C']
(1-phi)*W = alpha_N*C/N_C;

[name = 'Capital demand:C']
W/R_C = (alpha_N/alpha_K)*K_C(-1)/N_C;

[name = 'Labor demand:I']
(1-phi)*W/p_I = alpha_N*I/N_I;

[name = 'Capital demand:I']
W/R_I = (alpha_N/alpha_K)*K_I(-1)/N_I;

[name = 'Labor composition']
N = N_C + N_I;

[name = 'Capital composition']
K = K_C + K_I;

[name = 'Output (base-year prices)']
Y = C + p_I_ss*I;


[name='Definition log output']
log_Y = log(Y);
[name='Definition log consumption']
log_C = log(C);
[name = 'Definition log investment']
log_I = log(I);
[name='Definition log hours']
log_N = log(N);
[name='Definition log labor productivity']
log_Y_N = log_Y - log_N;
[name = 'Definition log shopping effort']
log_D = log(D);


[name='exogenous TFP process']
Z = rho_Z*Z(-1)+e_Z;

u_ZI = rho_ZI*Z_I(-1) + e_ZI;
[name ='investment-specific TFP process']
Z_I = Z + u_ZI;

[name ='Labor supply process']
theta_N = rho_N*theta_N(-1) - e_N;

[name ='Shopping effort process']
theta_D = rho_D*theta_D(-1) - e_D;

end;

steady_state_model;
    //Do Calibration
    //calibrate the model to steady state labor of 0.33,i.e. compute the corresponding steady state values
    // and the labor disutility parameter by hand;

    N = N_ss;
    Y = 1.0;
    p_I = 1.0;
    I = I_Y;
    C = 1-I_Y;
    D = phi^(eta/(1+eta));
    D_C = (1-I_Y)*D;
    D_I = I_Y*D;
    K = K_Y;
    K_I = I_Y*K;
    K_C = (1-I_Y)*K;
    N_I = I_Y*N;
    N_C = (1-I_Y)*N;
    Z_C = Z_C_ss;
    Z_I = Z_I_ss;
    Gam = C - D^(1+1/eta)/(1+1/eta) - theta_n_ss*N^(1+1/nu)/(1+1/nu);
    
    % Logged versions of variables
    log_Y = log(Y);
    log_C = log(C);
    log_I = log(I);
    log_N = log(N);
    log_Y_N = log_Y - log_N;
    log_D = log(D);

end;

//set shock variances
shocks;
    var e_Z=0.0072^2;
    var e_ZI=0.0072^2;
    var e_N = 0.0072^2;
    var e_D = 0.0072^2;
end;

//check the starting values for the steady state
resid;

// compute steady state given the starting values
steady;
// check Blanchard-Kahn-conditions
check;

//simulate data for estimation
stoch_simul(order=1,periods=200)  g_obs c_obs;
datatomfile('first_diff_data',[]);


estimated_params;
rhog, beta_pdf,0.7,0.1;
rhoz, beta_pdf,0.7,0.1;
stderr eps_z, inv_gamma_pdf, 0.01, 0.1;
stderr eps_g, inv_gamma_pdf, 0.01, 0.1;
end;

options_.TeX=1;

varobs g_obs c_obs;

estimation(datafile=first_diff_data,mh_jscale=1.5,mode_check,
mh_replic=4000,mh_nblocks=1,bayesian_irf,smoother,conditional_variance_decomposition=[1 2 4]) log_y log_k log_c log_l log_w r z ghat g_obs c_obs;


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
