%--------------------------------------------------------------------------------------
%   Shaode Yu, yushaodemia@163.com
%           Using MLV to predict image blur scores
%--------------------------------------------------------------------------------------

clear; close all; clc; warning('off')

%-------------------------------------------------------------------------------------------------------------------------------------------
%   Simulated blurring images
%-------------------------------------------------------------------------------------------------------------------------------------------
%% CIDIQ_gblur
src_folder = 'D:\code4graduate\bisaFusion\dataBLUR\sim_CIDIQ_gblur\';
img_files = dir([src_folder, '*.bmp']);
flag_dataset = 'CIDIQ';
[sim_CIDIQ_score_MLV, sim_CIDIQ_time_MLV] = ysd_mini_func_MLV_dataset(src_folder, img_files, flag_dataset);
clear src_folder img_files flag_dataset
save('D:\code4graduate\bisaFusion\scoreTIME\sim_CIDIQ_score_MLV.mat', 'sim_CIDIQ_score_MLV')
save('D:\code4graduate\bisaFusion\scoreTIME\sim_CIDIQ_time_MLV.mat', 'sim_CIDIQ_time_MLV')

%% CSIQ_gblur
src_folder = 'D:\code4graduate\bisaFusion\dataBLUR\sim_CSIQ_gblur\';
img_files = dir([src_folder, '*.png']);
flag_dataset = 'CSIQ';
[sim_CSIQ_score_MLV, sim_CSIQ_time_MLV] = ysd_mini_func_MLV_dataset(src_folder, img_files, flag_dataset);
clear src_folder img_files flag_dataset
save('D:\code4graduate\bisaFusion\scoreTIME\sim_CSIQ_score_MLV.mat', 'sim_CSIQ_score_MLV')
save('D:\code4graduate\bisaFusion\scoreTIME\sim_CSIQ_time_MLV.mat', 'sim_CSIQ_time_MLV')

%% LIVE_gblur
src_folder = 'D:\code4graduate\bisaFusion\dataBLUR\sim_LIVE_gblur\';
img_files = dir([src_folder, '*.bmp']);
flag_dataset = 'LIVE';
[sim_LIVE_score_MLV, sim_LIVE_time_MLV] = ysd_mini_func_MLV_dataset(src_folder, img_files, flag_dataset);
clear src_folder img_files flag_dataset
save('D:\code4graduate\bisaFusion\scoreTIME\sim_LIVE_score_MLV.mat', 'sim_LIVE_score_MLV')
save('D:\code4graduate\bisaFusion\scoreTIME\sim_LIVE_time_MLV.mat', 'sim_LIVE_time_MLV')

%% TID08_gblur
src_folder = 'D:\code4graduate\bisaFusion\dataBLUR\sim_TID2008_gblur\';
img_files = dir([src_folder, '*.bmp']);
flag_dataset = 'TID08';
[sim_TID08_score_MLV, sim_TID08_time_MLV] = ysd_mini_func_MLV_dataset(src_folder, img_files, flag_dataset);
clear src_folder img_files flag_dataset
save('D:\code4graduate\bisaFusion\scoreTIME\sim_TID08_score_MLV.mat', 'sim_TID08_score_MLV')
save('D:\code4graduate\bisaFusion\scoreTIME\sim_TID08_time_MLV.mat', 'sim_TID08_time_MLV')

%% TID13_gblur
src_folder = 'D:\code4graduate\bisaFusion\dataBLUR\sim_TID2013_gblur\';
img_files = dir([src_folder, '*.bmp']);
flag_dataset = 'TID13';
[sim_TID13_score_MLV, sim_TID13_time_MLV] = ysd_mini_func_MLV_dataset(src_folder, img_files, flag_dataset);
clear src_folder img_files flag_dataset
save('D:\code4graduate\bisaFusion\scoreTIME\sim_TID13_score_MLV.mat', 'sim_TID13_score_MLV')
save('D:\code4graduate\bisaFusion\scoreTIME\sim_TID13_time_MLV.mat', 'sim_TID13_time_MLV')

%-------------------------------------------------------------------------------------------------------------------------------------------
%   Realistic blurring images
%-------------------------------------------------------------------------------------------------------------------------------------------
%% BID2011
src_folder = 'D:\code4graduate\bisaFusion\dataBLUR\real_BID2011\BID11_586_Scores\';
img_files = dir([src_folder, '*.jpg']);
flag_dataset = 'BID11';
[real_BID11_score_MLV, real_BID11_time_MLV] = ysd_mini_func_MLV_dataset(src_folder, img_files, flag_dataset);
clear src_folder img_files flag_dataset
save('D:\code4graduate\bisaFusion\scoreTIME\real_BID11_score_MLV.mat', 'real_BID11_score_MLV')
save('D:\code4graduate\bisaFusion\scoreTIME\real_BID11_time_MLV.mat', 'real_BID11_time_MLV')

%% CID2013
src_folder = 'D:\code4graduate\bisaFusion\dataBLUR\real_CID2013\';
img_files = dir([src_folder, '*.jpg']);
flag_dataset = 'CID2013';
[real_CID2013_score_MLV, real_CID2013_time_MLV] = ysd_mini_func_MLV_dataset(src_folder, img_files, flag_dataset);
clear src_folder img_files flag_dataset
save('D:\code4graduate\bisaFusion\scoreTIME\real_CID2013_score_MLV.mat', 'real_CID2013_score_MLV')
save('D:\code4graduate\bisaFusion\scoreTIME\real_CID2013_time_MLV.mat', 'real_CID2013_time_MLV')

%% FocusPath
src_folder = 'D:\code4graduate\bisaFusion\dataBLUR\real_FocusPath\';
img_files = dir([src_folder, '*.png']);
flag_dataset = 'FocusPath';
[real_FocusPath_score_MLV, real_FocusPath_time_MLV] = ysd_mini_func_MLV_dataset(src_folder, img_files, flag_dataset);
clear src_folder img_files flag_dataset
save('D:\code4graduate\bisaFusion\scoreTIME\real_FocusPath_score_MLV.mat', 'real_FocusPath_score_MLV')
save('D:\code4graduate\bisaFusion\scoreTIME\real_FocusPath_time_MLV.mat', 'real_FocusPath_time_MLV')

