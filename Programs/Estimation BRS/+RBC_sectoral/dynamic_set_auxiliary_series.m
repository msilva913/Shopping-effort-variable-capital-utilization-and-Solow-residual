function ds = dynamic_set_auxiliary_series(ds, params)
%
% Status : Computes Auxiliary variables of the dynamic model and returns a dseries
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

ds.AUX_EXO_LAG_74_0=ds.e_g_news;
ds.AUX_EXO_LAG_74_1=ds.AUX_EXO_LAG_74_0(-1);
ds.AUX_EXO_LAG_74_2=ds.AUX_EXO_LAG_74_1(-1);
ds.AUX_EXO_LAG_74_3=ds.AUX_EXO_LAG_74_2(-1);
ds.AUX_EXO_LAG_76_0=ds.e_Z_news;
ds.AUX_EXO_LAG_76_1=ds.AUX_EXO_LAG_76_0(-1);
ds.AUX_EXO_LAG_76_2=ds.AUX_EXO_LAG_76_1(-1);
ds.AUX_EXO_LAG_76_3=ds.AUX_EXO_LAG_76_2(-1);
ds.AUX_EXO_LAG_78_0=ds.e_ZI_news;
ds.AUX_EXO_LAG_78_1=ds.AUX_EXO_LAG_78_0(-1);
ds.AUX_EXO_LAG_78_2=ds.AUX_EXO_LAG_78_1(-1);
ds.AUX_EXO_LAG_78_3=ds.AUX_EXO_LAG_78_2(-1);
ds.AUX_EXO_LAG_81_0=ds.e_b_news;
ds.AUX_EXO_LAG_81_1=ds.AUX_EXO_LAG_81_0(-1);
ds.AUX_EXO_LAG_81_2=ds.AUX_EXO_LAG_81_1(-1);
ds.AUX_EXO_LAG_81_3=ds.AUX_EXO_LAG_81_2(-1);
ds.AUX_EXO_LAG_83_0=ds.e_muC_news;
ds.AUX_EXO_LAG_83_1=ds.AUX_EXO_LAG_83_0(-1);
ds.AUX_EXO_LAG_83_2=ds.AUX_EXO_LAG_83_1(-1);
ds.AUX_EXO_LAG_83_3=ds.AUX_EXO_LAG_83_2(-1);
ds.AUX_EXO_LAG_85_0=ds.e_muI_news;
ds.AUX_EXO_LAG_85_1=ds.AUX_EXO_LAG_85_0(-1);
ds.AUX_EXO_LAG_85_2=ds.AUX_EXO_LAG_85_1(-1);
ds.AUX_EXO_LAG_85_3=ds.AUX_EXO_LAG_85_2(-1);
end
