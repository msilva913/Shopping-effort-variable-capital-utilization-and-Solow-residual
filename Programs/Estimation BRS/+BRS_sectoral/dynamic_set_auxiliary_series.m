function ds = dynamic_set_auxiliary_series(ds, params)
%
% Status : Computes Auxiliary variables of the dynamic model and returns a dseries
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

ds.AUX_EXO_LAG_81_0=ds.e_g_news;
ds.AUX_EXO_LAG_81_1=ds.AUX_EXO_LAG_81_0(-1);
ds.AUX_EXO_LAG_81_2=ds.AUX_EXO_LAG_81_1(-1);
ds.AUX_EXO_LAG_81_3=ds.AUX_EXO_LAG_81_2(-1);
ds.AUX_EXO_LAG_83_0=ds.e_Z_news;
ds.AUX_EXO_LAG_83_1=ds.AUX_EXO_LAG_83_0(-1);
ds.AUX_EXO_LAG_83_2=ds.AUX_EXO_LAG_83_1(-1);
ds.AUX_EXO_LAG_83_3=ds.AUX_EXO_LAG_83_2(-1);
ds.AUX_EXO_LAG_85_0=ds.e_ZI_news;
ds.AUX_EXO_LAG_85_1=ds.AUX_EXO_LAG_85_0(-1);
ds.AUX_EXO_LAG_85_2=ds.AUX_EXO_LAG_85_1(-1);
ds.AUX_EXO_LAG_85_3=ds.AUX_EXO_LAG_85_2(-1);
ds.AUX_EXO_LAG_88_0=ds.e_D_news;
ds.AUX_EXO_LAG_88_1=ds.AUX_EXO_LAG_88_0(-1);
ds.AUX_EXO_LAG_88_2=ds.AUX_EXO_LAG_88_1(-1);
ds.AUX_EXO_LAG_88_3=ds.AUX_EXO_LAG_88_2(-1);
ds.AUX_EXO_LAG_90_0=ds.e_DI_news;
ds.AUX_EXO_LAG_90_1=ds.AUX_EXO_LAG_90_0(-1);
ds.AUX_EXO_LAG_90_2=ds.AUX_EXO_LAG_90_1(-1);
ds.AUX_EXO_LAG_90_3=ds.AUX_EXO_LAG_90_2(-1);
ds.AUX_EXO_LAG_92_0=ds.e_b_news;
ds.AUX_EXO_LAG_92_1=ds.AUX_EXO_LAG_92_0(-1);
ds.AUX_EXO_LAG_92_2=ds.AUX_EXO_LAG_92_1(-1);
ds.AUX_EXO_LAG_92_3=ds.AUX_EXO_LAG_92_2(-1);
ds.AUX_EXO_LAG_94_0=ds.e_muC_news;
ds.AUX_EXO_LAG_94_1=ds.AUX_EXO_LAG_94_0(-1);
ds.AUX_EXO_LAG_94_2=ds.AUX_EXO_LAG_94_1(-1);
ds.AUX_EXO_LAG_94_3=ds.AUX_EXO_LAG_94_2(-1);
ds.AUX_EXO_LAG_96_0=ds.e_muI_news;
ds.AUX_EXO_LAG_96_1=ds.AUX_EXO_LAG_96_0(-1);
ds.AUX_EXO_LAG_96_2=ds.AUX_EXO_LAG_96_1(-1);
ds.AUX_EXO_LAG_96_3=ds.AUX_EXO_LAG_96_2(-1);
end
