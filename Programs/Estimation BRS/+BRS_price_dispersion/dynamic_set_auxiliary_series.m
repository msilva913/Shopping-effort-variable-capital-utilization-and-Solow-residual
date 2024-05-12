function ds = dynamic_set_auxiliary_series(ds, params)
%
% Status : Computes Auxiliary variables of the dynamic model and returns a dseries
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

ds.AUX_EXO_LAG_107_0=ds.e_g_news;
ds.AUX_EXO_LAG_107_1=ds.AUX_EXO_LAG_107_0(-1);
ds.AUX_EXO_LAG_107_2=ds.AUX_EXO_LAG_107_1(-1);
ds.AUX_EXO_LAG_107_3=ds.AUX_EXO_LAG_107_2(-1);
ds.AUX_EXO_LAG_109_0=ds.e_Z_news;
ds.AUX_EXO_LAG_109_1=ds.AUX_EXO_LAG_109_0(-1);
ds.AUX_EXO_LAG_109_2=ds.AUX_EXO_LAG_109_1(-1);
ds.AUX_EXO_LAG_109_3=ds.AUX_EXO_LAG_109_2(-1);
ds.AUX_EXO_LAG_111_0=ds.e_ZI_news;
ds.AUX_EXO_LAG_111_1=ds.AUX_EXO_LAG_111_0(-1);
ds.AUX_EXO_LAG_111_2=ds.AUX_EXO_LAG_111_1(-1);
ds.AUX_EXO_LAG_111_3=ds.AUX_EXO_LAG_111_2(-1);
ds.AUX_EXO_LAG_114_0=ds.e_D_news;
ds.AUX_EXO_LAG_114_1=ds.AUX_EXO_LAG_114_0(-1);
ds.AUX_EXO_LAG_114_2=ds.AUX_EXO_LAG_114_1(-1);
ds.AUX_EXO_LAG_114_3=ds.AUX_EXO_LAG_114_2(-1);
ds.AUX_EXO_LAG_116_0=ds.e_DI_news;
ds.AUX_EXO_LAG_116_1=ds.AUX_EXO_LAG_116_0(-1);
ds.AUX_EXO_LAG_116_2=ds.AUX_EXO_LAG_116_1(-1);
ds.AUX_EXO_LAG_116_3=ds.AUX_EXO_LAG_116_2(-1);
ds.AUX_EXO_LAG_118_0=ds.e_b_news;
ds.AUX_EXO_LAG_118_1=ds.AUX_EXO_LAG_118_0(-1);
ds.AUX_EXO_LAG_118_2=ds.AUX_EXO_LAG_118_1(-1);
ds.AUX_EXO_LAG_118_3=ds.AUX_EXO_LAG_118_2(-1);
ds.AUX_EXO_LAG_120_0=ds.e_muC_news;
ds.AUX_EXO_LAG_120_1=ds.AUX_EXO_LAG_120_0(-1);
ds.AUX_EXO_LAG_120_2=ds.AUX_EXO_LAG_120_1(-1);
ds.AUX_EXO_LAG_120_3=ds.AUX_EXO_LAG_120_2(-1);
ds.AUX_EXO_LAG_122_0=ds.e_muI_news;
ds.AUX_EXO_LAG_122_1=ds.AUX_EXO_LAG_122_0(-1);
ds.AUX_EXO_LAG_122_2=ds.AUX_EXO_LAG_122_1(-1);
ds.AUX_EXO_LAG_122_3=ds.AUX_EXO_LAG_122_2(-1);
end
