function [delta, r, sigma_b, alpha_K, alpha_N] = dependent_parameters(parameters, targets)


beta = targets(1); %0.99
K_Y = targets(2); %11
I_Y = targets(3); %0.20
labor_share = targets(4); %0.67
g_bar = targets(5); %0.0045

phi = parameters.phi;
sigma = parameters.sigma;
nu_R = parameters.nu_R;

delta = I_Y/K_Y + 1 - exp(g_bar);
r = exp(g_bar)^(sigma)/beta - 1;
sigma_b = r + delta;
alpha_K = (r+delta)*K_Y/(1+nu_R);
alpha_N = (1-phi)*labor_share/(1+nu_R);
end