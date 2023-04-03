
clear;
clc;

load result
abs(corr(LIVE_arism,LIVE_dmos,'type','spearman'))'
abs(corr(CSIQ_arism,CSIQ_dmos,'type','spearman'))'
abs(corr(TID2008_arism,TID2008_mos,'type','spearman'))'
abs(corr(TID2013_arism,TID2013_mos,'type','spearman'))'
