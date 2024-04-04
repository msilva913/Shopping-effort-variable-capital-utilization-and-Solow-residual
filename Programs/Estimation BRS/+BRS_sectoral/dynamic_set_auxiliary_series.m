function ds = dynamic_set_auxiliary_series(ds, params)
%
% Status : Computes Auxiliary variables of the dynamic model and returns a dseries
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

ds.AUX_EXO_LAG_96_0=ds.e_g_news;
ds.AUX_EXO_LAG_96_1=ds.AUX_EXO_LAG_96_0(-1);
ds.AUX_EXO_LAG_96_2=ds.AUX_EXO_LAG_96_1(-1);
ds.AUX_EXO_LAG_96_3=ds.AUX_EXO_LAG_96_2(-1);
ds.AUX_EXO_LAG_98_0=ds.e_Z_news;
ds.AUX_EXO_LAG_98_1=ds.AUX_EXO_LAG_98_0(-1);
ds.AUX_EXO_LAG_98_2=ds.AUX_EXO_LAG_98_1(-1);
ds.AUX_EXO_LAG_98_3=ds.AUX_EXO_LAG_98_2(-1);
ds.AUX_EXO_LAG_100_0=ds.e_ZI_news;
ds.AUX_EXO_LAG_100_1=ds.AUX_EXO_LAG_100_0(-1);
ds.AUX_EXO_LAG_100_2=ds.AUX_EXO_LAG_100_1(-1);
ds.AUX_EXO_LAG_100_3=ds.AUX_EXO_LAG_100_2(-1);
ds.AUX_EXO_LAG_103_0=ds.e_D_news;
ds.AUX_EXO_LAG_103_1=ds.AUX_EXO_LAG_103_0(-1);
ds.AUX_EXO_LAG_103_2=ds.AUX_EXO_LAG_103_1(-1);
ds.AUX_EXO_LAG_103_3=ds.AUX_EXO_LAG_103_2(-1);
ds.AUX_EXO_LAG_105_0=ds.e_DI_news;
ds.AUX_EXO_LAG_105_1=ds.AUX_EXO_LAG_105_0(-1);
ds.AUX_EXO_LAG_105_2=ds.AUX_EXO_LAG_105_1(-1);
ds.AUX_EXO_LAG_105_3=ds.AUX_EXO_LAG_105_2(-1);
ds.AUX_EXO_LAG_107_0=ds.e_b_news;
ds.AUX_EXO_LAG_107_1=ds.AUX_EXO_LAG_107_0(-1);
ds.AUX_EXO_LAG_107_2=ds.AUX_EXO_LAG_107_1(-1);
ds.AUX_EXO_LAG_107_3=ds.AUX_EXO_LAG_107_2(-1);
ds.AUX_EXO_LAG_109_0=ds.e_muC_news;
ds.AUX_EXO_LAG_109_1=ds.AUX_EXO_LAG_109_0(-1);
ds.AUX_EXO_LAG_109_2=ds.AUX_EXO_LAG_109_1(-1);
ds.AUX_EXO_LAG_109_3=ds.AUX_EXO_LAG_109_2(-1);
ds.AUX_EXO_LAG_111_0=ds.e_muI_news;
ds.AUX_EXO_LAG_111_1=ds.AUX_EXO_LAG_111_0(-1);
ds.AUX_EXO_LAG_111_2=ds.AUX_EXO_LAG_111_1(-1);
ds.AUX_EXO_LAG_111_3=ds.AUX_EXO_LAG_111_2(-1);
end
