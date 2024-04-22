function ds = dynamic_set_auxiliary_series(ds, params)
%
% Status : Computes Auxiliary variables of the dynamic model and returns a dseries
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

ds.AUX_EXO_LAG_90_0=ds.e_g_news;
ds.AUX_EXO_LAG_90_1=ds.AUX_EXO_LAG_90_0(-1);
ds.AUX_EXO_LAG_90_2=ds.AUX_EXO_LAG_90_1(-1);
ds.AUX_EXO_LAG_90_3=ds.AUX_EXO_LAG_90_2(-1);
ds.AUX_EXO_LAG_92_0=ds.e_Z_news;
ds.AUX_EXO_LAG_92_1=ds.AUX_EXO_LAG_92_0(-1);
ds.AUX_EXO_LAG_92_2=ds.AUX_EXO_LAG_92_1(-1);
ds.AUX_EXO_LAG_92_3=ds.AUX_EXO_LAG_92_2(-1);
ds.AUX_EXO_LAG_94_0=ds.e_ZI_news;
ds.AUX_EXO_LAG_94_1=ds.AUX_EXO_LAG_94_0(-1);
ds.AUX_EXO_LAG_94_2=ds.AUX_EXO_LAG_94_1(-1);
ds.AUX_EXO_LAG_94_3=ds.AUX_EXO_LAG_94_2(-1);
ds.AUX_EXO_LAG_97_0=ds.e_D_news;
ds.AUX_EXO_LAG_97_1=ds.AUX_EXO_LAG_97_0(-1);
ds.AUX_EXO_LAG_97_2=ds.AUX_EXO_LAG_97_1(-1);
ds.AUX_EXO_LAG_97_3=ds.AUX_EXO_LAG_97_2(-1);
ds.AUX_EXO_LAG_99_0=ds.e_DI_news;
ds.AUX_EXO_LAG_99_1=ds.AUX_EXO_LAG_99_0(-1);
ds.AUX_EXO_LAG_99_2=ds.AUX_EXO_LAG_99_1(-1);
ds.AUX_EXO_LAG_99_3=ds.AUX_EXO_LAG_99_2(-1);
ds.AUX_EXO_LAG_101_0=ds.e_b_news;
ds.AUX_EXO_LAG_101_1=ds.AUX_EXO_LAG_101_0(-1);
ds.AUX_EXO_LAG_101_2=ds.AUX_EXO_LAG_101_1(-1);
ds.AUX_EXO_LAG_101_3=ds.AUX_EXO_LAG_101_2(-1);
ds.AUX_EXO_LAG_103_0=ds.e_muC_news;
ds.AUX_EXO_LAG_103_1=ds.AUX_EXO_LAG_103_0(-1);
ds.AUX_EXO_LAG_103_2=ds.AUX_EXO_LAG_103_1(-1);
ds.AUX_EXO_LAG_103_3=ds.AUX_EXO_LAG_103_2(-1);
ds.AUX_EXO_LAG_105_0=ds.e_muI_news;
ds.AUX_EXO_LAG_105_1=ds.AUX_EXO_LAG_105_0(-1);
ds.AUX_EXO_LAG_105_2=ds.AUX_EXO_LAG_105_1(-1);
ds.AUX_EXO_LAG_105_3=ds.AUX_EXO_LAG_105_2(-1);
end
