%---------The RBC with investment-specific technology shock----------------
%-------------Greenwood,Hercowitz and Krusell(2000EER)---------------------
%-------------------------Enkai Zhang--------------------------------------
%--------------------------------------------------------------------------
%1. Definitions of variables
%--------------------------------------------------------------------------
var y,c,w,l,ie,is,re,rs,q,z,lb,ke,ks,h;
% ae and as are setted as zero in the balanced growth model.
% Each variables are the abbreviations of the elements except h(the utilization rate, y(the output)
% The static variables only enter FOCs at time t are: y c w l ie is re rs q z 
% The purely predetermined variables only enter FOCs at time t and t-1,t are: lb
% The predetermined and forward-looking variable only enter FOCs at time t-1,t, t+1 is: h

varexo ze,xi;
%ze represents zeta,is the total factor productivity(TFP)shock,
%e represents eta,is the specific investment-equipment productivity shock,

parameters beta,% the stochastic discount factor
theta, % the preference parameter
alphae,alphas,% alphae: the share of equipment capital in output
% alphas: the share of structure capital in output
deltas,% deltas: the depreciation rate of structures 
bhomega,b,omega,% bhomega=b*hs^omega;b and omega: the parameters affecting the utilization rate
gammaq,gammaz,% the gross growth rates of z and q
g,% g:the balanced growth rate for output,consumption,wage,structures capital and investments
tauk,taul, % tauk taul: the tax rates of capital and individual income
sigma,rho,% sigma rho: the parameter affecting the investment techonology shock 
iesy,issy,ys,ies,iss,kes,kss; %since they appear in model block, it is necessary to define SS as parameters

%--------------------------------------------------------------------------
% 2.Calibration
%--------------------------------------------------------------------------
beta = 0.97;
theta = 0.40;
alphae = 0.18;
alphas = 0.12;
deltas = 0.056;
bhomega= 0.2;  
omega = 1.59;% 1/(bhomega/omega)*bhomega=1.6129;
gammaq = 1.032;
gammaz = 1.0030; % Based gammaq,alphas and alphae.
g = 1.0124;
tauk = 0.53;
taul = 0.4;
sigma = 0.035;
rho =0.64;
iesys = 0.073;
issys = 0.041;
% The above data is based on the original paper----------------------------
%--------------------------------------------------------------------------
% 3.Steady state
%--------------------------------------------------------------------------
ls = 0.24;
qs=gammaq*exp(1/1-rho);
kesys = (1-tauk)*qs*alphae/(gammaq*g/beta-(1-bhomega));
ys = bhomega /((1-tauk)*alphae*qs*(kesys*ys*gammaq)^(-1));
kssys= (1-tauk)*alphas/(g/beta-(1-deltas));
kss = issys*ys/(g-(1-deltas));
kes = kesys*ys;
ies = iesys*ys;
iss = issys*ys;
cs = ys-ies-iss;
iesys = (gammaq/qs)*(kes/ys)*(gammaq*g-(1-bhomega));
ls=(theta/(1-theta))*(1-taul)*(1-alphae-alphas)*(1-ls)*(ys/cs);
ws = (1-alphas-alphae)*ys/ls;
%--------------------------------------------------------------------------
% 4.Model
%--------------------------------------------------------------------------
model;
theta/c=lb; % Consumption
w=(1-theta)/((1-taul)*(1-l)*lb); % Labor and wage
re= b*h^(omega-1)/(q*(1-tauk));% Equipment rate
lb(-1)=beta/g*lb*((1-tauk)*h*q(-1)*re+(1-b*h^(omega))*(q(-1)/q));
lb(-1)=beta/g*lb*((1-tauk)*rs+(1-deltas));
re=alphae*z*h*ke^(alphae-1)*ks^alphas*gammaq^(alphae-1)*g^(alphae+alphas-1)*l^(1-alphas-alphae);
rs=alphas*z*(h*ke)^(alphae)*ks^(alphas-1)*gammaq^(alphae)*g^(alphae+alphas-1)*l^(1-alphas-alphae);
w=(1-alphae-alphas)*z*(h*ke)^(alphae)*ks^alphas*gammaq^(alphae)*g^(alphae+alphas-1)*l^(-alphas-alphae);
y=z*(h*ke)^(alphae)*ks^(alphas)*gammaq^(alphae)*g^(alphae+alphas-1)*l^(1-alphas-alphae);
y=c+ie+is;
ke*gammaq*g=(1-b*h(-1)^(omega))*ke(-1)+ie*q*gammaq^(-1);
ks*g=(1-deltas)*ks(-1)+is;

log(z)=log(gammaz)+ze;
log(q)=log(gammaq)+xi/(1-rho);

end;

%--------------------------------------------------------------------------
% 4.Computation
%--------------------------------------------------------------------------
initval;
ze= 0;
y = log(ys);
c = log(cs);
ie = log(ies);
is = log(iss);
ke = log(kes);
ks = log(kss);
w = log(ws);
l = log(ls);
q = log(qs);
lb = 1;
rs = 0;
re = 0;
end;

steady;
check;
%--------------------------------------------------------------------------
%5. Shocks
%--------------------------------------------------------------------------
shocks;
var ze=1;
var xi=1;
end;
%--------------------------------------------------------------------------
%6.Lauch solving procedure
%--------------------------------------------------------------------------
stoch_simul(order=1,irf=20)
y,c,ie,is,ke,ks,l,g;