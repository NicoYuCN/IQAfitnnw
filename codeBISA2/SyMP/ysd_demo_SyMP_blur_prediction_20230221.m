%--------------------------------------------------------------------------------------
%   Shaode Yu, yushaodemia@163.com
%           Using SyMP to predict image blur scores
%--------------------------------------------------------------------------------------

clear; close all; clc; warning('off')

%-------------------------------------------------------------------------------------------------------------------------------------------
%   Simulated blurring images
%-------------------------------------------------------------------------------------------------------------------------------------------
% %% CIDIQ_gblur
% src_folder = 'D:\code4graduate\bisaFusion\dataBLUR\sim_CIDIQ_gblur\';
% img_files = dir([src_folder, '*.bmp']);
% flag_dataset = 'CIDIQ';
% [sim_CIDIQ_score_SyMP, sim_CIDIQ_time_SyMP] = ysd_mini_func_SyMP_dataset(src_folder, img_files, flag_dataset);
% clear src_folder img_files flag_dataset
% save('D:\code4graduate\bisaFusion\scoreTIME\sim_CIDIQ_score_SyMP.mat', 'sim_CIDIQ_score_SyMP')
% save('D:\code4graduate\bisaFusion\scoreTIME\sim_CIDIQ_time_SyMP.mat', 'sim_CIDIQ_time_SyMP')
% 
% %% CSIQ_gblur
% src_folder = 'D:\code4graduate\bisaFusion\dataBLUR\sim_CSIQ_gblur\';
% img_files = dir([src_folder, '*.png']);
% flag_dataset = 'CSIQ';
% [sim_CSIQ_score_SyMP, sim_CSIQ_time_SyMP] = ysd_mini_func_SyMP_dataset(src_folder, img_files, flag_dataset);
% clear src_folder img_files flag_dataset
% save('D:\code4graduate\bisaFusion\scoreTIME\sim_CSIQ_score_SyMP.mat', 'sim_CSIQ_score_SyMP')
% save('D:\code4graduate\bisaFusion\scoreTIME\sim_CSIQ_time_SyMP.mat', 'sim_CSIQ_time_SyMP')
% 
% %% LIVE_gblur
% src_folder = 'D:\code4graduate\bisaFusion\dataBLUR\sim_LIVE_gblur\';
% img_files = dir([src_folder, '*.bmp']);
% flag_dataset = 'LIVE';
% [sim_LIVE_score_SyMP, sim_LIVE_time_SyMP] = ysd_mini_func_SyMP_dataset(src_folder, img_files, flag_dataset);
% clear src_folder img_files flag_dataset
% save('D:\code4graduate\bisaFusion\scoreTIME\sim_LIVE_score_SyMP.mat', 'sim_LIVE_score_SyMP')
% save('D:\code4graduate\bisaFusion\scoreTIME\sim_LIVE_time_SyMP.mat', 'sim_LIVE_time_SyMP')
% 
% %% TID08_gblur
% src_folder = 'D:\code4graduate\bisaFusion\dataBLUR\sim_TID2008_gblur\';
% img_files = dir([src_folder, '*.bmp']);
% flag_dataset = 'TID08';
% [sim_TID08_score_SyMP, sim_TID08_time_SyMP] = ysd_mini_func_SyMP_dataset(src_folder, img_files, flag_dataset);
% clear src_folder img_files flag_dataset
% save('D:\code4graduate\bisaFusion\scoreTIME\sim_TID08_score_SyMP.mat', 'sim_TID08_score_SyMP')
% save('D:\code4graduate\bisaFusion\scoreTIME\sim_TID08_time_SyMP.mat', 'sim_TID08_time_SyMP')
% 
% %% TID13_gblur
% src_folder = 'D:\code4graduate\bisaFusion\dataBLUR\sim_TID2013_gblur\';
% img_files = dir([src_folder, '*.bmp']);
% flag_dataset = 'TID13';
% [sim_TID13_score_SyMP, sim_TID13_time_SyMP] = ysd_mini_func_SyMP_dataset(src_folder, img_files, flag_dataset);
% clear src_folder img_files flag_dataset
% save('D:\code4graduate\bisaFusion\scoreTIME\sim_TID13_score_SyMP.mat', 'sim_TID13_score_SyMP')
% save('D:\code4graduate\bisaFusion\scoreTIME\sim_TID13_time_SyMP.mat', 'sim_TID13_time_SyMP')
% 
% %-------------------------------------------------------------------------------------------------------------------------------------------
% %   Realistic blurring images
% %-------------------------------------------------------------------------------------------------------------------------------------------
% %% BID2011
% src_folder = 'D:\code4graduate\bisaFusion\dataBLUR\real_BID2011\BID11_586_Scores\';
% img_files = dir([src_folder, '*.jpg']);
% flag_dataset = 'BID11';
% [real_BID11_score_SyMP, real_BID11_time_SyMP] = ysd_mini_func_SyMP_dataset(src_folder, img_files, flag_dataset);
% clear src_folder img_files flag_dataset
% save('D:\code4graduate\bisaFusion\scoreTIME\real_BID11_score_SyMP.mat', 'real_BID11_score_SyMP')
% save('D:\code4graduate\bisaFusion\scoreTIME\real_BID11_time_SyMP.mat', 'real_BID11_time_SyMP')
% 
% %% CID2013
% src_folder = 'D:\code4graduate\bisaFusion\dataBLUR\real_CID2013\';
% img_files = dir([src_folder, '*.jpg']);
% flag_dataset = 'CID2013';
% [real_CID2013_score_SyMP, real_CID2013_time_SyMP] = ysd_mini_func_SyMP_dataset(src_folder, img_files, flag_dataset);
% clear src_folder img_files flag_dataset
% save('D:\code4graduate\bisaFusion\scoreTIME\real_CID2013_score_SyMP.mat', 'real_CID2013_score_SyMP')
% save('D:\code4graduate\bisaFusion\scoreTIME\real_CID2013_time_SyMP.mat', 'real_CID2013_time_SyMP')
% 
% %% FocusPath
% src_folder = 'D:\code4graduate\bisaFusion\dataBLUR\real_FocusPath\';
% img_files = dir([src_folder, '*.png']);
% flag_dataset = 'FocusPath';
% [real_FocusPath_score_SyMP, real_FocusPath_time_SyMP] = ysd_mini_func_SyMP_dataset(src_folder, img_files, flag_dataset);
% clear src_folder img_files flag_dataset
% save('D:\code4graduate\bisaFusion\scoreTIME\real_FocusPath_score_SyMP.mat', 'real_FocusPath_score_SyMP')
% save('D:\code4graduate\bisaFusion\scoreTIME\real_FocusPath_time_SyMP.mat', 'real_FocusPath_time_SyMP')

load('MaxPol_kernel.mat');

%% CLIVE
src_folder = 'F:\code4graduate\bisaFusion\dataBLUR\real_CLIVE\Images\';
% img_files = dir([src_folder, '*.bmp']);
img_files = dir([src_folder, '*p*']);
flag_dataset = 'CLIVE';
[real_CLIVE_score_SyMP, real_CLIVE_time_SyMP] = ysd_mini_func_SyMP_dataset(src_folder, img_files, flag_dataset, MaxPol_kernel);
clear src_folder img_files flag_dataset
save('F:\code4graduate\bisaFusion\scoreTIME\real_CLIVE_score_SyMP.mat', 'real_CLIVE_score_SyMP')
save('F:\code4graduate\bisaFusion\scoreTIME\real_CLIVE_time_SyMP.mat', 'real_CLIVE_time_SyMP')

%% KONIQ
src_folder = 'F:\code4graduate\bisaFusion\dataBLUR\real_KONIQ\Images\';
% img_files = dir([src_folder, '*.bmp']);
img_files = dir([src_folder, '*p*']);
flag_dataset = 'KONIQ';
[real_KONIQ_score_SyMP, real_KONIQ_time_SyMP] = ysd_mini_func_SyMP_dataset(src_folder, img_files, flag_dataset, MaxPol_kernel);
clear src_folder img_files flag_dataset
save('F:\code4graduate\bisaFusion\scoreTIME\real_KONIQ_score_SyMP.mat', 'real_KONIQ_score_SyMP')
save('F:\code4graduate\bisaFusion\scoreTIME\real_KONIQ_time_SyMP.mat', 'real_KONIQ_time_SyMP')

