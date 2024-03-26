function ds = dynamic_set_auxiliary_series(ds, params)
%
% Status : Computes Auxiliary variables of the dynamic model and returns a dseries
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

ds.AUX_EXO_LAG_89_0=ds.e_g_news;
ds.AUX_EXO_LAG_89_1=ds.AUX_EXO_LAG_89_0(-1);
ds.AUX_EXO_LAG_89_2=ds.AUX_EXO_LAG_89_1(-1);
ds.AUX_EXO_LAG_89_3=ds.AUX_EXO_LAG_89_2(-1);
ds.AUX_EXO_LAG_90_0=ds.e_Z_news;
ds.AUX_EXO_LAG_90_1=ds.AUX_EXO_LAG_90_0(-1);
ds.AUX_EXO_LAG_90_2=ds.AUX_EXO_LAG_90_1(-1);
ds.AUX_EXO_LAG_90_3=ds.AUX_EXO_LAG_90_2(-1);
ds.AUX_EXO_LAG_91_0=ds.e_ZI_news;
ds.AUX_EXO_LAG_91_1=ds.AUX_EXO_LAG_91_0(-1);
ds.AUX_EXO_LAG_91_2=ds.AUX_EXO_LAG_91_1(-1);
ds.AUX_EXO_LAG_91_3=ds.AUX_EXO_LAG_91_2(-1);
ds.AUX_EXO_LAG_92_0=ds.e_D_news;
ds.AUX_EXO_LAG_92_1=ds.AUX_EXO_LAG_92_0(-1);
ds.AUX_EXO_LAG_92_2=ds.AUX_EXO_LAG_92_1(-1);
ds.AUX_EXO_LAG_92_3=ds.AUX_EXO_LAG_92_2(-1);
ds.AUX_EXO_LAG_93_0=ds.e_DI_news;
ds.AUX_EXO_LAG_93_1=ds.AUX_EXO_LAG_93_0(-1);
ds.AUX_EXO_LAG_93_2=ds.AUX_EXO_LAG_93_1(-1);
ds.AUX_EXO_LAG_93_3=ds.AUX_EXO_LAG_93_2(-1);
ds.AUX_EXO_LAG_94_0=ds.e_muC_news;
ds.AUX_EXO_LAG_94_1=ds.AUX_EXO_LAG_94_0(-1);
ds.AUX_EXO_LAG_94_2=ds.AUX_EXO_LAG_94_1(-1);
ds.AUX_EXO_LAG_94_3=ds.AUX_EXO_LAG_94_2(-1);
ds.AUX_EXO_LAG_95_0=ds.e_muI_news;
ds.AUX_EXO_LAG_95_1=ds.AUX_EXO_LAG_95_0(-1);
ds.AUX_EXO_LAG_95_2=ds.AUX_EXO_LAG_95_1(-1);
ds.AUX_EXO_LAG_95_3=ds.AUX_EXO_LAG_95_2(-1);
end
