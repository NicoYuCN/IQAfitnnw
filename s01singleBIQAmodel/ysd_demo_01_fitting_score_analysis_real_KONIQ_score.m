%----------------------------------------------------------------------------
%       Shaode Yu, yushaodemia@163.com
%               
%                   BISA performance analysis using PLCC, SRCC
%            
%----------------------------------------------------------------------------

clear; close all; clc; warning off

addpath('D:\code4graduate221020\bisaFusion\scoreTIME\');
addpath('D:\code4graduate221020\bisaFusion\scoreBISAground\');
addpath('D:\code4graduate221020\bisaFusion\');

%------------------------------------------------------------------------------
% metrics_wo_fitting_bid11 = zeros(15, 3); % 15 methods x 3 metrics
metrics_w_fitting_real_koniq = zeros(15, 4); % 15 methods x 4 metrics
%
n_para_fit = 5;
%
% BID2011
load('y_real_KONIQ.mat'); 
bid = y_real_KONIQ; 
clear y_real_KONIQ

%
load real_KONIQ_score_ARISMC
metrics_w_fitting_real_koniq(1, :) = utsw_biqa_score_logistic_fitting( real_KONIQ_score_ARISMC', bid, n_para_fit );
%
load real_KONIQ_score_BIBLE
idx = find( isnan(real_KONIQ_score_BIBLE) );
real_KONIQ_score_BIBLE(idx) = 0;
metrics_w_fitting_real_koniq(2, :) = utsw_biqa_score_logistic_fitting( real_KONIQ_score_BIBLE', bid, n_para_fit );
%
load real_KONIQ_score_CPBD
metrics_w_fitting_real_koniq(3, :) = utsw_biqa_score_logistic_fitting( real_KONIQ_score_CPBD', bid, n_para_fit );
%
load real_KONIQ_score_DMLI
metrics_w_fitting_real_koniq(4, :) = utsw_biqa_score_logistic_fitting( real_KONIQ_score_DMLI', bid, n_para_fit );
%
load real_KONIQ_score_EMBM
metrics_w_fitting_real_koniq(5, :) = utsw_biqa_score_logistic_fitting( real_KONIQ_score_EMBM', bid, n_para_fit );
%
load real_KONIQ_score_FISH
metrics_w_fitting_real_koniq(6, :) = utsw_biqa_score_logistic_fitting( real_KONIQ_score_FISH', bid, n_para_fit );
%
load real_KONIQ_score_JNB
metrics_w_fitting_real_koniq(7, :) = utsw_biqa_score_logistic_fitting( real_KONIQ_score_JNB', bid, n_para_fit );
%
load real_KONIQ_score_LPC
idx = find( isnan(real_KONIQ_score_LPC) );
real_KONIQ_score_LPC(idx) = 0;
metrics_w_fitting_real_koniq(8, :) = utsw_biqa_score_logistic_fitting( real_KONIQ_score_LPC', bid, n_para_fit );
%
load real_KONIQ_score_MLV
metrics_w_fitting_real_koniq(9, :) = utsw_biqa_score_logistic_fitting( real_KONIQ_score_MLV', bid, n_para_fit );
%
load real_KONIQ_score_MRZ
idx = find( isnan(real_KONIQ_score_MRZ) );
real_KONIQ_score_MRZ(idx) = 0;
metrics_w_fitting_real_koniq(10, :) = utsw_biqa_score_logistic_fitting( real_KONIQ_score_MRZ', bid, n_para_fit );
%
load real_KONIQ_score_RISE
metrics_w_fitting_real_koniq(11, :) = utsw_biqa_score_logistic_fitting( real_KONIQ_score_RISE', bid, n_para_fit );
%
load real_KONIQ_score_S3
metrics_w_fitting_real_koniq(12, :) = utsw_biqa_score_logistic_fitting( real_KONIQ_score_S3', bid, n_para_fit );
%
load real_KONIQ_score_SPARISH
idx = find( isnan(real_KONIQ_score_SPARISH) );
real_KONIQ_score_SPARISH(idx) = 0;
metrics_w_fitting_real_koniq(13, :) = utsw_biqa_score_logistic_fitting( real_KONIQ_score_SPARISH', bid, n_para_fit );
%
load real_KONIQ_score_SVC
idx = find( isnan(real_KONIQ_score_SVC) );
real_KONIQ_score_SVC(idx) = 0;
metrics_w_fitting_real_koniq(14, :) = utsw_biqa_score_logistic_fitting( real_KONIQ_score_SVC', bid, n_para_fit );
%
load real_KONIQ_score_SyMP
metrics_w_fitting_real_koniq(15, :) = utsw_biqa_score_logistic_fitting( real_KONIQ_score_SyMP', bid, n_para_fit );
%
%------------------------------------------------------------------------------
clear real_KONIQ* bid n_para_fit idx
%
save('metrics_w_fitting_real_koniq.mat', 'metrics_w_fitting_real_koniq')
%
%
