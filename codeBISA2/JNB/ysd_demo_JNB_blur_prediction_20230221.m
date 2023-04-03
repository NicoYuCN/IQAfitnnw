%--------------------------------------------------------------------------------------
%   Shaode Yu, yushaodemia@163.com
%           Using JNB to predict image blur scores
%--------------------------------------------------------------------------------------

clear; close all; clc; warning('off')

%-------------------------------------------------------------------------------------------------------------------------------------------
%   Simulated blurring images
%-------------------------------------------------------------------------------------------------------------------------------------------
% %% CIDIQ_gblur
% src_folder = 'D:\code4graduate\bisaFusion\dataBLUR\sim_CIDIQ_gblur\';
% img_files = dir([src_folder, '*.bmp']);
% flag_dataset = 'CIDIQ';
% [sim_CIDIQ_score_JNB, sim_CIDIQ_time_JNB] = ysd_mini_func_JNB_dataset(src_folder, img_files, flag_dataset);
% clear src_folder img_files flag_dataset
% save('D:\code4graduate\bisaFusion\scoreTIME\sim_CIDIQ_score_JNB.mat', 'sim_CIDIQ_score_JNB')
% save('D:\code4graduate\bisaFusion\scoreTIME\sim_CIDIQ_time_JNB.mat', 'sim_CIDIQ_time_JNB')
% 
% %% CSIQ_gblur
% src_folder = 'D:\code4graduate\bisaFusion\dataBLUR\sim_CSIQ_gblur\';
% img_files = dir([src_folder, '*.png']);
% flag_dataset = 'CSIQ';
% [sim_CSIQ_score_JNB, sim_CSIQ_time_JNB] = ysd_mini_func_JNB_dataset(src_folder, img_files, flag_dataset);
% clear src_folder img_files flag_dataset
% save('D:\code4graduate\bisaFusion\scoreTIME\sim_CSIQ_score_JNB.mat', 'sim_CSIQ_score_JNB')
% save('D:\code4graduate\bisaFusion\scoreTIME\sim_CSIQ_time_JNB.mat', 'sim_CSIQ_time_JNB')
% 
% %% LIVE_gblur
% src_folder = 'D:\code4graduate\bisaFusion\dataBLUR\sim_LIVE_gblur\';
% img_files = dir([src_folder, '*.bmp']);
% flag_dataset = 'LIVE';
% [sim_LIVE_score_JNB, sim_LIVE_time_JNB] = ysd_mini_func_JNB_dataset(src_folder, img_files, flag_dataset);
% clear src_folder img_files flag_dataset
% save('D:\code4graduate\bisaFusion\scoreTIME\sim_LIVE_score_JNB.mat', 'sim_LIVE_score_JNB')
% save('D:\code4graduate\bisaFusion\scoreTIME\sim_LIVE_time_JNB.mat', 'sim_LIVE_time_JNB')
% 
% %% TID08_gblur
% src_folder = 'D:\code4graduate\bisaFusion\dataBLUR\sim_TID2008_gblur\';
% img_files = dir([src_folder, '*.bmp']);
% flag_dataset = 'TID08';
% [sim_TID08_score_JNB, sim_TID08_time_JNB] = ysd_mini_func_JNB_dataset(src_folder, img_files, flag_dataset);
% clear src_folder img_files flag_dataset
% save('D:\code4graduate\bisaFusion\scoreTIME\sim_TID08_score_JNB.mat', 'sim_TID08_score_JNB')
% save('D:\code4graduate\bisaFusion\scoreTIME\sim_TID08_time_JNB.mat', 'sim_TID08_time_JNB')
% 
% %% TID13_gblur
% src_folder = 'D:\code4graduate\bisaFusion\dataBLUR\sim_TID2013_gblur\';
% img_files = dir([src_folder, '*.bmp']);
% flag_dataset = 'TID13';
% [sim_TID13_score_JNB, sim_TID13_time_JNB] = ysd_mini_func_JNB_dataset(src_folder, img_files, flag_dataset);
% clear src_folder img_files flag_dataset
% save('D:\code4graduate\bisaFusion\scoreTIME\sim_TID13_score_JNB.mat', 'sim_TID13_score_JNB')
% save('D:\code4graduate\bisaFusion\scoreTIME\sim_TID13_time_JNB.mat', 'sim_TID13_time_JNB')
% 
% %-------------------------------------------------------------------------------------------------------------------------------------------
% %   Realistic blurring images
% %-------------------------------------------------------------------------------------------------------------------------------------------
% %% BID2011
% src_folder = 'D:\code4graduate\bisaFusion\dataBLUR\real_BID2011\BID11_586_Scores\';
% img_files = dir([src_folder, '*.jpg']);
% flag_dataset = 'BID11';
% [real_BID11_score_JNB, real_BID11_time_JNB] = ysd_mini_func_JNB_dataset(src_folder, img_files, flag_dataset);
% clear src_folder img_files flag_dataset
% save('D:\code4graduate\bisaFusion\scoreTIME\real_BID11_score_JNB.mat', 'real_BID11_score_JNB')
% save('D:\code4graduate\bisaFusion\scoreTIME\real_BID11_time_JNB.mat', 'real_BID11_time_JNB')
% 
% %% CID2013
% src_folder = 'D:\code4graduate\bisaFusion\dataBLUR\real_CID2013\';
% img_files = dir([src_folder, '*.jpg']);
% flag_dataset = 'CID2013';
% [real_CID2013_score_JNB, real_CID2013_time_JNB] = ysd_mini_func_JNB_dataset(src_folder, img_files, flag_dataset);
% clear src_folder img_files flag_dataset
% save('D:\code4graduate\bisaFusion\scoreTIME\real_CID2013_score_JNB.mat', 'real_CID2013_score_JNB')
% save('D:\code4graduate\bisaFusion\scoreTIME\real_CID2013_time_JNB.mat', 'real_CID2013_time_JNB')
% 
% %% FocusPath
% src_folder = 'D:\code4graduate\bisaFusion\dataBLUR\real_FocusPath\';
% img_files = dir([src_folder, '*.png']);
% flag_dataset = 'FocusPath';
% [real_FocusPath_score_JNB, real_FocusPath_time_JNB] = ysd_mini_func_JNB_dataset(src_folder, img_files, flag_dataset);
% clear src_folder img_files flag_dataset
% save('D:\code4graduate\bisaFusion\scoreTIME\real_FocusPath_score_JNB.mat', 'real_FocusPath_score_JNB')
% save('D:\code4graduate\bisaFusion\scoreTIME\real_FocusPath_time_JNB.mat', 'real_FocusPath_time_JNB')

%% CLIVE
src_folder = 'F:\code4graduate\bisaFusion\dataBLUR\real_CLIVE\Images\';
% img_files = dir([src_folder, '*.bmp']);
img_files = dir([src_folder, '*p*']);
flag_dataset = 'CLIVE';
[real_CLIVE_score_JNB, real_CLIVE_time_JNB] = ysd_mini_func_JNB_dataset(src_folder, img_files, flag_dataset);
clear src_folder img_files flag_dataset
save('F:\code4graduate\bisaFusion\scoreTIME\real_CLIVE_score_JNB.mat', 'real_CLIVE_score_JNB')
save('F:\code4graduate\bisaFusion\scoreTIME\real_CLIVE_time_JNB.mat', 'real_CLIVE_time_JNB')

%% KONIQ
src_folder = 'F:\code4graduate\bisaFusion\dataBLUR\real_KONIQ\Images\';
% img_files = dir([src_folder, '*.bmp']);
img_files = dir([src_folder, '*p*']);
flag_dataset = 'KONIQ';
[real_KONIQ_score_JNB, real_KONIQ_time_JNB] = ysd_mini_func_JNB_dataset(src_folder, img_files, flag_dataset);
clear src_folder img_files flag_dataset
save('F:\code4graduate\bisaFusion\scoreTIME\real_KONIQ_score_JNB.mat', 'real_KONIQ_score_JNB')
save('F:\code4graduate\bisaFusion\scoreTIME\real_KONIQ_time_JNB.mat', 'real_KONIQ_time_JNB')

