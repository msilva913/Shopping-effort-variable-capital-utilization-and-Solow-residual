function ds = dynamic_set_auxiliary_series(ds, params)
%
% Status : Computes Auxiliary variables of the dynamic model and returns a dseries
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

ds.AUX_EXO_LAG_70_0=ds.e_g_news_1;
ds.AUX_EXO_LAG_71_0=ds.e_g_news_4;
ds.AUX_EXO_LAG_71_1=ds.AUX_EXO_LAG_71_0(-1);
ds.AUX_EXO_LAG_71_2=ds.AUX_EXO_LAG_71_1(-1);
ds.AUX_EXO_LAG_71_3=ds.AUX_EXO_LAG_71_2(-1);
ds.AUX_EXO_LAG_73_0=ds.e_Z_news_1;
ds.AUX_EXO_LAG_74_0=ds.e_Z_news_4;
ds.AUX_EXO_LAG_74_1=ds.AUX_EXO_LAG_74_0(-1);
ds.AUX_EXO_LAG_74_2=ds.AUX_EXO_LAG_74_1(-1);
ds.AUX_EXO_LAG_74_3=ds.AUX_EXO_LAG_74_2(-1);
ds.AUX_EXO_LAG_76_0=ds.e_ZI_news_1;
ds.AUX_EXO_LAG_77_0=ds.e_ZI_news_4;
ds.AUX_EXO_LAG_77_1=ds.AUX_EXO_LAG_77_0(-1);
ds.AUX_EXO_LAG_77_2=ds.AUX_EXO_LAG_77_1(-1);
ds.AUX_EXO_LAG_77_3=ds.AUX_EXO_LAG_77_2(-1);
ds.AUX_EXO_LAG_80_0=ds.e_D_news_1;
ds.AUX_EXO_LAG_81_0=ds.e_D_news_4;
ds.AUX_EXO_LAG_81_1=ds.AUX_EXO_LAG_81_0(-1);
ds.AUX_EXO_LAG_81_2=ds.AUX_EXO_LAG_81_1(-1);
ds.AUX_EXO_LAG_81_3=ds.AUX_EXO_LAG_81_2(-1);
end
