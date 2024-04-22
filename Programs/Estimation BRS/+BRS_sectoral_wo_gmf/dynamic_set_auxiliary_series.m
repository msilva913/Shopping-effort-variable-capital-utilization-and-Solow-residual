function ds = dynamic_set_auxiliary_series(ds, params)
%
% Status : Computes Auxiliary variables of the dynamic model and returns a dseries
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

ds.AUX_EXO_LAG_91_0=ds.e_g_news;
ds.AUX_EXO_LAG_91_1=ds.AUX_EXO_LAG_91_0(-1);
ds.AUX_EXO_LAG_91_2=ds.AUX_EXO_LAG_91_1(-1);
ds.AUX_EXO_LAG_91_3=ds.AUX_EXO_LAG_91_2(-1);
ds.AUX_EXO_LAG_93_0=ds.e_Z_news;
ds.AUX_EXO_LAG_93_1=ds.AUX_EXO_LAG_93_0(-1);
ds.AUX_EXO_LAG_93_2=ds.AUX_EXO_LAG_93_1(-1);
ds.AUX_EXO_LAG_93_3=ds.AUX_EXO_LAG_93_2(-1);
ds.AUX_EXO_LAG_95_0=ds.e_ZI_news;
ds.AUX_EXO_LAG_95_1=ds.AUX_EXO_LAG_95_0(-1);
ds.AUX_EXO_LAG_95_2=ds.AUX_EXO_LAG_95_1(-1);
ds.AUX_EXO_LAG_95_3=ds.AUX_EXO_LAG_95_2(-1);
ds.AUX_EXO_LAG_98_0=ds.e_b_news;
ds.AUX_EXO_LAG_98_1=ds.AUX_EXO_LAG_98_0(-1);
ds.AUX_EXO_LAG_98_2=ds.AUX_EXO_LAG_98_1(-1);
ds.AUX_EXO_LAG_98_3=ds.AUX_EXO_LAG_98_2(-1);
ds.AUX_EXO_LAG_100_0=ds.e_muC_news;
ds.AUX_EXO_LAG_100_1=ds.AUX_EXO_LAG_100_0(-1);
ds.AUX_EXO_LAG_100_2=ds.AUX_EXO_LAG_100_1(-1);
ds.AUX_EXO_LAG_100_3=ds.AUX_EXO_LAG_100_2(-1);
ds.AUX_EXO_LAG_102_0=ds.e_muI_news;
ds.AUX_EXO_LAG_102_1=ds.AUX_EXO_LAG_102_0(-1);
ds.AUX_EXO_LAG_102_2=ds.AUX_EXO_LAG_102_1(-1);
ds.AUX_EXO_LAG_102_3=ds.AUX_EXO_LAG_102_2(-1);
end
