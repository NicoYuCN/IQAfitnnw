%--------------------------------------------------------------------------------------
%   Shaode Yu, yushaodemia@163.com
%           Using BIBLE to predict image blur scores
%--------------------------------------------------------------------------------------

clear; close all; clc; warning('off')

%-------------------------------------------------------------------------------------------------------------------------------------------
%   Simulated blurring images
%-------------------------------------------------------------------------------------------------------------------------------------------
% %% CIDIQ_gblur
% src_folder = 'D:\code4graduate\bisaFusion\dataBLUR\sim_CIDIQ_gblur\';
% img_files = dir([src_folder, '*.bmp']);
% flag_dataset = 'CIDIQ';
% [sim_CIDIQ_score_BIBLE, sim_CIDIQ_time_BIBLE] = ysd_mini_func_BIBLE_dataset(src_folder, img_files, flag_dataset);
% clear src_folder img_files flag_dataset
% save('D:\code4graduate\bisaFusion\scoreTIME\sim_CIDIQ_score_BIBLE.mat', 'sim_CIDIQ_score_BIBLE')
% save('D:\code4graduate\bisaFusion\scoreTIME\sim_CIDIQ_time_BIBLE.mat', 'sim_CIDIQ_time_BIBLE')
% 
% %% CSIQ_gblur
% src_folder = 'D:\code4graduate\bisaFusion\dataBLUR\sim_CSIQ_gblur\';
% img_files = dir([src_folder, '*.png']);
% flag_dataset = 'CSIQ';
% [sim_CSIQ_score_BIBLE, sim_CSIQ_time_BIBLE] = ysd_mini_func_BIBLE_dataset(src_folder, img_files, flag_dataset);
% clear src_folder img_files flag_dataset
% save('D:\code4graduate\bisaFusion\scoreTIME\sim_CSIQ_score_BIBLE.mat', 'sim_CSIQ_score_BIBLE')
% save('D:\code4graduate\bisaFusion\scoreTIME\sim_CSIQ_time_BIBLE.mat', 'sim_CSIQ_time_BIBLE')
% 
% %% LIVE_gblur
% src_folder = 'D:\code4graduate\bisaFusion\dataBLUR\sim_LIVE_gblur\';
% img_files = dir([src_folder, '*.bmp']);
% flag_dataset = 'LIVE';
% [sim_LIVE_score_BIBLE, sim_LIVE_time_BIBLE] = ysd_mini_func_BIBLE_dataset(src_folder, img_files, flag_dataset);
% clear src_folder img_files flag_dataset
% save('D:\code4graduate\bisaFusion\scoreTIME\sim_LIVE_score_BIBLE.mat', 'sim_LIVE_score_BIBLE')
% save('D:\code4graduate\bisaFusion\scoreTIME\sim_LIVE_time_BIBLE.mat', 'sim_LIVE_time_BIBLE')
% 
% %% TID08_gblur
% src_folder = 'D:\code4graduate\bisaFusion\dataBLUR\sim_TID2008_gblur\';
% img_files = dir([src_folder, '*.bmp']);
% flag_dataset = 'TID08';
% [sim_TID08_score_BIBLE, sim_TID08_time_BIBLE] = ysd_mini_func_BIBLE_dataset(src_folder, img_files, flag_dataset);
% clear src_folder img_files flag_dataset
% save('D:\code4graduate\bisaFusion\scoreTIME\sim_TID08_score_BIBLE.mat', 'sim_TID08_score_BIBLE')
% save('D:\code4graduate\bisaFusion\scoreTIME\sim_TID08_time_BIBLE.mat', 'sim_TID08_time_BIBLE')
% 
% %% TID13_gblur
% src_folder = 'D:\code4graduate\bisaFusion\dataBLUR\sim_TID2013_gblur\';
% img_files = dir([src_folder, '*.bmp']);
% flag_dataset = 'TID13';
% [sim_TID13_score_BIBLE, sim_TID13_time_BIBLE] = ysd_mini_func_BIBLE_dataset(src_folder, img_files, flag_dataset);
% clear src_folder img_files flag_dataset
% save('D:\code4graduate\bisaFusion\scoreTIME\sim_TID13_score_BIBLE.mat', 'sim_TID13_score_BIBLE')
% save('D:\code4graduate\bisaFusion\scoreTIME\sim_TID13_time_BIBLE.mat', 'sim_TID13_time_BIBLE')
% 
% %-------------------------------------------------------------------------------------------------------------------------------------------
% %   Realistic blurring images
% %-------------------------------------------------------------------------------------------------------------------------------------------
% %% BID2011
% src_folder = 'D:\code4graduate\bisaFusion\dataBLUR\real_BID2011\BID11_586_Scores\';
% img_files = dir([src_folder, '*.jpg']);
% flag_dataset = 'BID11';
% [real_BID11_score_BIBLE, real_BID11_time_BIBLE] = ysd_mini_func_BIBLE_dataset(src_folder, img_files, flag_dataset);
% clear src_folder img_files flag_dataset
% save('D:\code4graduate\bisaFusion\scoreTIME\real_BID11_score_BIBLE.mat', 'real_BID11_score_BIBLE')
% save('D:\code4graduate\bisaFusion\scoreTIME\real_BID11_time_BIBLE.mat', 'real_BID11_time_BIBLE')
% 
% %% CID2013
% src_folder = 'D:\code4graduate\bisaFusion\dataBLUR\real_CID2013\';
% img_files = dir([src_folder, '*.jpg']);
% flag_dataset = 'CID2013';
% [real_CID2013_score_BIBLE, real_CID2013_time_BIBLE] = ysd_mini_func_BIBLE_dataset(src_folder, img_files, flag_dataset);
% clear src_folder img_files flag_dataset
% save('D:\code4graduate\bisaFusion\scoreTIME\real_CID2013_score_BIBLE.mat', 'real_CID2013_score_BIBLE')
% save('D:\code4graduate\bisaFusion\scoreTIME\real_CID2013_time_BIBLE.mat', 'real_CID2013_time_BIBLE')
% 
% %% FocusPath
% src_folder = 'D:\code4graduate\bisaFusion\dataBLUR\real_FocusPath\';
% img_files = dir([src_folder, '*.png']);
% flag_dataset = 'FocusPath';
% [real_FocusPath_score_BIBLE, real_FocusPath_time_BIBLE] = ysd_mini_func_BIBLE_dataset(src_folder, img_files, flag_dataset);
% clear src_folder img_files flag_dataset
% save('D:\code4graduate\bisaFusion\scoreTIME\real_FocusPath_score_BIBLE.mat', 'real_FocusPath_score_BIBLE')
% save('D:\code4graduate\bisaFusion\scoreTIME\real_FocusPath_time_BIBLE.mat', 'real_FocusPath_time_BIBLE')

% %% CLIVE
% src_folder = 'F:\code4graduate\bisaFusion\dataBLUR\real_CLIVE\Images\';
% img_files = dir([src_folder, '*p*']);
% flag_dataset = 'CLIVE';
% [real_CLIVE_score_BIBLE, real_CLIVE_time_BIBLE] = ysd_mini_func_BIBLE_dataset(src_folder, img_files, flag_dataset);
% clear src_folder img_files flag_dataset
% save('F:\code4graduate\bisaFusion\scoreTIME\real_CLIVE_score_BIBLE.mat', 'real_CLIVE_score_BIBLE')
% save('F:\code4graduate\bisaFusion\scoreTIME\real_CLIVE_time_BIBLE.mat', 'real_CLIVE_time_BIBLE')

%% KONIQ
src_folder = 'F:\code4graduate\bisaFusion\dataBLUR\real_KONIQ\Images\';
% img_files = dir([src_folder, '*.bmp']);
img_files = dir([src_folder, '*p*']);
flag_dataset = 'KONIQ';
[real_KONIQ_score_BIBLE, real_KONIQ_time_BIBLE] = ysd_mini_func_BIBLE_dataset(src_folder, img_files, flag_dataset);
clear src_folder img_files flag_dataset
save('F:\code4graduate\bisaFusion\scoreTIME\real_KONIQ_score_BIBLE.mat', 'real_KONIQ_score_BIBLE')
save('F:\code4graduate\bisaFusion\scoreTIME\real_KONIQ_time_BIBLE.mat', 'real_KONIQ_time_BIBLE')

