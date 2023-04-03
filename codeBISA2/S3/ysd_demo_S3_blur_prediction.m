%--------------------------------------------------------------------------------------
%   Shaode Yu, yushaodemia@163.com
%           Using S3 to predict image blur scores
%--------------------------------------------------------------------------------------

clear; close all; clc; warning('off')

%-------------------------------------------------------------------------------------------------------------------------------------------
%   Simulated blurring images
%-------------------------------------------------------------------------------------------------------------------------------------------
%% CIDIQ_gblur
src_folder = 'D:\code4graduate\bisaFusion\dataBLUR\sim_CIDIQ_gblur\';
img_files = dir([src_folder, '*.bmp']);
flag_dataset = 'CIDIQ';
[sim_CIDIQ_score_S3, sim_CIDIQ_time_S3] = ysd_mini_func_S3_dataset(src_folder, img_files, flag_dataset);
clear src_folder img_files flag_dataset
save('D:\code4graduate\bisaFusion\scoreTIME\sim_CIDIQ_score_S3.mat', 'sim_CIDIQ_score_S3')
save('D:\code4graduate\bisaFusion\scoreTIME\sim_CIDIQ_time_S3.mat', 'sim_CIDIQ_time_S3')

%% CSIQ_gblur
src_folder = 'D:\code4graduate\bisaFusion\dataBLUR\sim_CSIQ_gblur\';
img_files = dir([src_folder, '*.png']);
flag_dataset = 'CSIQ';
[sim_CSIQ_score_S3, sim_CSIQ_time_S3] = ysd_mini_func_S3_dataset(src_folder, img_files, flag_dataset);
clear src_folder img_files flag_dataset
save('D:\code4graduate\bisaFusion\scoreTIME\sim_CSIQ_score_S3.mat', 'sim_CSIQ_score_S3')
save('D:\code4graduate\bisaFusion\scoreTIME\sim_CSIQ_time_S3.mat', 'sim_CSIQ_time_S3')

%% LIVE_gblur
src_folder = 'D:\code4graduate\bisaFusion\dataBLUR\sim_LIVE_gblur\';
img_files = dir([src_folder, '*.bmp']);
flag_dataset = 'LIVE';
[sim_LIVE_score_S3, sim_LIVE_time_S3] = ysd_mini_func_S3_dataset(src_folder, img_files, flag_dataset);
clear src_folder img_files flag_dataset
save('D:\code4graduate\bisaFusion\scoreTIME\sim_LIVE_score_S3.mat', 'sim_LIVE_score_S3')
save('D:\code4graduate\bisaFusion\scoreTIME\sim_LIVE_time_S3.mat', 'sim_LIVE_time_S3')

%% TID08_gblur
src_folder = 'D:\code4graduate\bisaFusion\dataBLUR\sim_TID2008_gblur\';
img_files = dir([src_folder, '*.bmp']);
flag_dataset = 'TID08';
[sim_TID08_score_S3, sim_TID08_time_S3] = ysd_mini_func_S3_dataset(src_folder, img_files, flag_dataset);
clear src_folder img_files flag_dataset
save('D:\code4graduate\bisaFusion\scoreTIME\sim_TID08_score_S3.mat', 'sim_TID08_score_S3')
save('D:\code4graduate\bisaFusion\scoreTIME\sim_TID08_time_S3.mat', 'sim_TID08_time_S3')

%% TID13_gblur
src_folder = 'D:\code4graduate\bisaFusion\dataBLUR\sim_TID2013_gblur\';
img_files = dir([src_folder, '*.bmp']);
flag_dataset = 'TID13';
[sim_TID13_score_S3, sim_TID13_time_S3] = ysd_mini_func_S3_dataset(src_folder, img_files, flag_dataset);
clear src_folder img_files flag_dataset
save('D:\code4graduate\bisaFusion\scoreTIME\sim_TID13_score_S3.mat', 'sim_TID13_score_S3')
save('D:\code4graduate\bisaFusion\scoreTIME\sim_TID13_time_S3.mat', 'sim_TID13_time_S3')

%-------------------------------------------------------------------------------------------------------------------------------------------
%   Realistic blurring images
%-------------------------------------------------------------------------------------------------------------------------------------------
%% BID2011
src_folder = 'D:\code4graduate\bisaFusion\dataBLUR\real_BID2011\BID11_586_Scores\';
img_files = dir([src_folder, '*.jpg']);
flag_dataset = 'BID11';
[real_BID11_score_S3, real_BID11_time_S3] = ysd_mini_func_S3_dataset(src_folder, img_files, flag_dataset);
clear src_folder img_files flag_dataset
save('D:\code4graduate\bisaFusion\scoreTIME\real_BID11_score_S3.mat', 'real_BID11_score_S3')
save('D:\code4graduate\bisaFusion\scoreTIME\real_BID11_time_S3.mat', 'real_BID11_time_S3')

%% CID2013
src_folder = 'D:\code4graduate\bisaFusion\dataBLUR\real_CID2013\';
img_files = dir([src_folder, '*.jpg']);
flag_dataset = 'CID2013';
[real_CID2013_score_S3, real_CID2013_time_S3] = ysd_mini_func_S3_dataset(src_folder, img_files, flag_dataset);
clear src_folder img_files flag_dataset
save('D:\code4graduate\bisaFusion\scoreTIME\real_CID2013_score_S3.mat', 'real_CID2013_score_S3')
save('D:\code4graduate\bisaFusion\scoreTIME\real_CID2013_time_S3.mat', 'real_CID2013_time_S3')

%% FocusPath
src_folder = 'D:\code4graduate\bisaFusion\dataBLUR\real_FocusPath\';
img_files = dir([src_folder, '*.png']);
flag_dataset = 'FocusPath';
[real_FocusPath_score_S3, real_FocusPath_time_S3] = ysd_mini_func_S3_dataset(src_folder, img_files, flag_dataset);
clear src_folder img_files flag_dataset
save('D:\code4graduate\bisaFusion\scoreTIME\real_FocusPath_score_S3.mat', 'real_FocusPath_score_S3')
save('D:\code4graduate\bisaFusion\scoreTIME\real_FocusPath_time_S3.mat', 'real_FocusPath_time_S3')

