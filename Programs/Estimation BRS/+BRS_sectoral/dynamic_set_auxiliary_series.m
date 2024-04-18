function ds = dynamic_set_auxiliary_series(ds, params)
%
% Status : Computes Auxiliary variables of the dynamic model and returns a dseries
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

ds.AUX_EXO_LAG_101_0=ds.e_g_news;
ds.AUX_EXO_LAG_101_1=ds.AUX_EXO_LAG_101_0(-1);
ds.AUX_EXO_LAG_101_2=ds.AUX_EXO_LAG_101_1(-1);
ds.AUX_EXO_LAG_101_3=ds.AUX_EXO_LAG_101_2(-1);
ds.AUX_EXO_LAG_103_0=ds.e_Z_news;
ds.AUX_EXO_LAG_103_1=ds.AUX_EXO_LAG_103_0(-1);
ds.AUX_EXO_LAG_103_2=ds.AUX_EXO_LAG_103_1(-1);
ds.AUX_EXO_LAG_103_3=ds.AUX_EXO_LAG_103_2(-1);
ds.AUX_EXO_LAG_105_0=ds.e_ZI_news;
ds.AUX_EXO_LAG_105_1=ds.AUX_EXO_LAG_105_0(-1);
ds.AUX_EXO_LAG_105_2=ds.AUX_EXO_LAG_105_1(-1);
ds.AUX_EXO_LAG_105_3=ds.AUX_EXO_LAG_105_2(-1);
ds.AUX_EXO_LAG_108_0=ds.e_D_news;
ds.AUX_EXO_LAG_108_1=ds.AUX_EXO_LAG_108_0(-1);
ds.AUX_EXO_LAG_108_2=ds.AUX_EXO_LAG_108_1(-1);
ds.AUX_EXO_LAG_108_3=ds.AUX_EXO_LAG_108_2(-1);
ds.AUX_EXO_LAG_110_0=ds.e_DI_news;
ds.AUX_EXO_LAG_110_1=ds.AUX_EXO_LAG_110_0(-1);
ds.AUX_EXO_LAG_110_2=ds.AUX_EXO_LAG_110_1(-1);
ds.AUX_EXO_LAG_110_3=ds.AUX_EXO_LAG_110_2(-1);
ds.AUX_EXO_LAG_112_0=ds.e_b_news;
ds.AUX_EXO_LAG_112_1=ds.AUX_EXO_LAG_112_0(-1);
ds.AUX_EXO_LAG_112_2=ds.AUX_EXO_LAG_112_1(-1);
ds.AUX_EXO_LAG_112_3=ds.AUX_EXO_LAG_112_2(-1);
ds.AUX_EXO_LAG_114_0=ds.e_muC_news;
ds.AUX_EXO_LAG_114_1=ds.AUX_EXO_LAG_114_0(-1);
ds.AUX_EXO_LAG_114_2=ds.AUX_EXO_LAG_114_1(-1);
ds.AUX_EXO_LAG_114_3=ds.AUX_EXO_LAG_114_2(-1);
ds.AUX_EXO_LAG_116_0=ds.e_muI_news;
ds.AUX_EXO_LAG_116_1=ds.AUX_EXO_LAG_116_0(-1);
ds.AUX_EXO_LAG_116_2=ds.AUX_EXO_LAG_116_1(-1);
ds.AUX_EXO_LAG_116_3=ds.AUX_EXO_LAG_116_2(-1);
end
