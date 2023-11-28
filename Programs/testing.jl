wL_Y = 0.667
phi_I = 0.22
var_share = 0.5 #share of labor in consumption sector which is variable
A = 0.78; # steady-state occupancy rate
delta_K = 0.173/4

# Key elasticities for estimation
Psi = 0.25
gam = 0.42
Gamma_bar = 1.3

sigma_a = 0.32

alpha_ratio = phi_I*(r+delta_K)/(delta_K*wL_Y);
alpha = alpha_ratio/(1+alpha_ratio);
alpha_2 = var_share*(1-alpha);
alpha_1 = 1-alpha-alpha_2;

#2) Fixed cost share
nu_R = Gamma_bar*wL_Y/(1-alpha) - 1

#3) Solve for phi and rho
Psi_inv = 1/Psi
A_c = alpha_2*(1+nu_R)+Psi_inv - 1
B_c = - (Psi_inv+Gamma_bar/A^alpha_2)
C_c = 1.0;

phi = - (B_c-sqrt(B_c^2-4*A_c*C_c))/(2*A_c)
rho = 1-Psi_inv + 1/phi


#Variable labor

# Great ratios
phi_C = 1-phi_I;
r_KK_Y = alpha/(1-alpha)*wL_Y;
D_Y = 1 - wL_Y - r_KK_Y;


## no fixed costs
alpha = 1 - Gamma_bar*wL_Y
phi_I = alpha/(Gamma_bar)*delta_K/(r+delta_K)
#delta_K_ratio = (r+delta_K)/delta_K
#delta_K = r/(delta_K_ratio-1)