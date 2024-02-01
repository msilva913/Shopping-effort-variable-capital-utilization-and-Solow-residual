//
// Replication of BCF
 
//---------------------------------------------------------------------
// 1. Variable declaration
//---------------------------------------------------------------------
var yt, kt, ct, Ht, it, lambdat, zt;
	
predetermined_variables Ht;
varexo x_e_z_t;

//---------------------------------------------------------------------
// 2. Parameter declaration and calibration
//---------------------------------------------------------------------
parameters beta, b, alpha, xbar, sigma2, delta, zss;

beta = 0.99999;
delta = 0.021;
alpha = 0.36;
xbar = 0.004;
sigma = 0.018 ;
b = 0.9;
	
zss = exp(xbar);

model;
    //1. Equation 
	zt = exp((xbar+x_e_z_t)); //Zt/Zt(-1);

	zt /( zt*ct - b*ct(-1)) = lambdat + b*beta/( zt(+1)*ct(+1) - b*ct );
	
	(1-alpha)*(yt/Ht) = 1/lambdat;
	
	# A = lambdat(+1)/zt(+1);
	# B = alpha*yt(+1)*zt(+1)/kt + (1-delta);
	beta*( A*B ) = lambdat;	
	
	(1-delta)*kt(-1)/zt  +  it - kt  =  0;
	
	yt = (zt^(-alpha))*(kt(-1)^alpha)*(Ht^(1-alpha));
	
	yt = ct + it;
	
end;

initval;

yt = 4.93396 ;
kt = 84.4132 ;
ct = 3.16128 ;
Ht = 0.998877 ;
it = 1.77268 ;
lambdat = 0.316327 ;

zt = zss;
end;
 
resid(1);

steady;

check;

shocks;
var x_e_z_t; stderr sigma;
end;

stoch_simul;

% Initialize Level of Technology
Z_0=1

% Level of Tech. after shock in period 1
Z(1)=oo_.irfs.zt_x_e_z_t(1)+Z_0;

% reaccumulate the level series
//for ii=2:length(oo_.irfs.yt_x_e_z_t)
//Z(ii)=oo_.irfs.zt_x_e_z_t(ii)+Z(ii-1);
//yt(ii)=oo_.irfs.yt_x_e_z_t(ii)+Z(ii);
//end;

% plot output IRF
//plot(yt(2:end))


