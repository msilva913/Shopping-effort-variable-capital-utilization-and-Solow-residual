function ds = dynamic_set_auxiliary_series(ds, params)
%
% Status : Computes Auxiliary variables of the dynamic model and returns a dseries
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

ds.AUX_EXO_LAG_102_0=ds.e_g_news;
ds.AUX_EXO_LAG_102_1=ds.AUX_EXO_LAG_102_0(-1);
ds.AUX_EXO_LAG_102_2=ds.AUX_EXO_LAG_102_1(-1);
ds.AUX_EXO_LAG_102_3=ds.AUX_EXO_LAG_102_2(-1);
ds.AUX_EXO_LAG_104_0=ds.e_Z_news;
ds.AUX_EXO_LAG_104_1=ds.AUX_EXO_LAG_104_0(-1);
ds.AUX_EXO_LAG_104_2=ds.AUX_EXO_LAG_104_1(-1);
ds.AUX_EXO_LAG_104_3=ds.AUX_EXO_LAG_104_2(-1);
ds.AUX_EXO_LAG_106_0=ds.e_ZI_news;
ds.AUX_EXO_LAG_106_1=ds.AUX_EXO_LAG_106_0(-1);
ds.AUX_EXO_LAG_106_2=ds.AUX_EXO_LAG_106_1(-1);
ds.AUX_EXO_LAG_106_3=ds.AUX_EXO_LAG_106_2(-1);
ds.AUX_EXO_LAG_109_0=ds.e_b_news;
ds.AUX_EXO_LAG_109_1=ds.AUX_EXO_LAG_109_0(-1);
ds.AUX_EXO_LAG_109_2=ds.AUX_EXO_LAG_109_1(-1);
ds.AUX_EXO_LAG_109_3=ds.AUX_EXO_LAG_109_2(-1);
ds.AUX_EXO_LAG_111_0=ds.e_muC_news;
ds.AUX_EXO_LAG_111_1=ds.AUX_EXO_LAG_111_0(-1);
ds.AUX_EXO_LAG_111_2=ds.AUX_EXO_LAG_111_1(-1);
ds.AUX_EXO_LAG_111_3=ds.AUX_EXO_LAG_111_2(-1);
ds.AUX_EXO_LAG_113_0=ds.e_muI_news;
ds.AUX_EXO_LAG_113_1=ds.AUX_EXO_LAG_113_0(-1);
ds.AUX_EXO_LAG_113_2=ds.AUX_EXO_LAG_113_1(-1);
ds.AUX_EXO_LAG_113_3=ds.AUX_EXO_LAG_113_2(-1);
end
