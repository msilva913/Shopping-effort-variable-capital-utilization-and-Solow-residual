function ds = dynamic_set_auxiliary_series(ds, params)
%
% Status : Computes Auxiliary variables of the dynamic model and returns a dseries
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

ds.AUX_EXO_LAG_104_0=ds.e_g_news;
ds.AUX_EXO_LAG_104_1=ds.AUX_EXO_LAG_104_0(-1);
ds.AUX_EXO_LAG_104_2=ds.AUX_EXO_LAG_104_1(-1);
ds.AUX_EXO_LAG_104_3=ds.AUX_EXO_LAG_104_2(-1);
ds.AUX_EXO_LAG_106_0=ds.e_Z_news;
ds.AUX_EXO_LAG_106_1=ds.AUX_EXO_LAG_106_0(-1);
ds.AUX_EXO_LAG_106_2=ds.AUX_EXO_LAG_106_1(-1);
ds.AUX_EXO_LAG_106_3=ds.AUX_EXO_LAG_106_2(-1);
ds.AUX_EXO_LAG_108_0=ds.e_ZI_news;
ds.AUX_EXO_LAG_108_1=ds.AUX_EXO_LAG_108_0(-1);
ds.AUX_EXO_LAG_108_2=ds.AUX_EXO_LAG_108_1(-1);
ds.AUX_EXO_LAG_108_3=ds.AUX_EXO_LAG_108_2(-1);
ds.AUX_EXO_LAG_111_0=ds.e_D_news;
ds.AUX_EXO_LAG_111_1=ds.AUX_EXO_LAG_111_0(-1);
ds.AUX_EXO_LAG_111_2=ds.AUX_EXO_LAG_111_1(-1);
ds.AUX_EXO_LAG_111_3=ds.AUX_EXO_LAG_111_2(-1);
ds.AUX_EXO_LAG_113_0=ds.e_DI_news;
ds.AUX_EXO_LAG_113_1=ds.AUX_EXO_LAG_113_0(-1);
ds.AUX_EXO_LAG_113_2=ds.AUX_EXO_LAG_113_1(-1);
ds.AUX_EXO_LAG_113_3=ds.AUX_EXO_LAG_113_2(-1);
ds.AUX_EXO_LAG_115_0=ds.e_b_news;
ds.AUX_EXO_LAG_115_1=ds.AUX_EXO_LAG_115_0(-1);
ds.AUX_EXO_LAG_115_2=ds.AUX_EXO_LAG_115_1(-1);
ds.AUX_EXO_LAG_115_3=ds.AUX_EXO_LAG_115_2(-1);
ds.AUX_EXO_LAG_117_0=ds.e_muC_news;
ds.AUX_EXO_LAG_117_1=ds.AUX_EXO_LAG_117_0(-1);
ds.AUX_EXO_LAG_117_2=ds.AUX_EXO_LAG_117_1(-1);
ds.AUX_EXO_LAG_117_3=ds.AUX_EXO_LAG_117_2(-1);
ds.AUX_EXO_LAG_119_0=ds.e_muI_news;
ds.AUX_EXO_LAG_119_1=ds.AUX_EXO_LAG_119_0(-1);
ds.AUX_EXO_LAG_119_2=ds.AUX_EXO_LAG_119_1(-1);
ds.AUX_EXO_LAG_119_3=ds.AUX_EXO_LAG_119_2(-1);
end
