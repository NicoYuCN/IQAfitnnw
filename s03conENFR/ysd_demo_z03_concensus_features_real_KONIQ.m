%--------------------------------------------------------------------------------------
%       Shaode Yu,  yushaodemia@163.com
%
%               Fusion of predictors for improved score prediction
%
%--------------------------------------------------------------------------------------

clear; close all; clc; warning off

%--------------------------------------------------------------------------------------
% (1) fitrsvm
%
addpath('D:\code4graduate\bisaFusion\scoreTIME\');
addpath('D:\code4graduate\bisaFusion\scoreBISAground\');
addpath('D:\code4graduate\bisaFusion\');

% load ground truth
load y_real_KONIQ
bid = y_real_KONIQ';
clear y_real_KONIQ
%
addpath('scoreTIME');
% load features
load real_KONIQ_score_ARISMC
load real_KONIQ_score_BIBLE
load real_KONIQ_score_CPBD
load real_KONIQ_score_DMLI
load real_KONIQ_score_EMBM
load real_KONIQ_score_FISH
load real_KONIQ_score_JNB
load real_KONIQ_score_LPC
load real_KONIQ_score_MLV
load real_KONIQ_score_MRZ
load real_KONIQ_score_RISE
load real_KONIQ_score_S3
load real_KONIQ_score_SPARISH
load real_KONIQ_score_SVC
load real_KONIQ_score_SyMP
features = [real_KONIQ_score_ARISMC; real_KONIQ_score_BIBLE; real_KONIQ_score_CPBD; ...
    real_KONIQ_score_DMLI; real_KONIQ_score_EMBM; real_KONIQ_score_FISH; ...
    real_KONIQ_score_JNB; real_KONIQ_score_LPC; real_KONIQ_score_MLV; ...
    real_KONIQ_score_MRZ; real_KONIQ_score_RISE; real_KONIQ_score_S3; ...
    real_KONIQ_score_SPARISH; real_KONIQ_score_SVC; real_KONIQ_score_SyMP];
clear  real_KONIQ_score_ARISMC real_KONIQ_score_BIBLE real_KONIQ_score_CPBD
clear real_KONIQ_score_DMLI real_KONIQ_score_EMBM real_KONIQ_score_FISH
clear real_KONIQ_score_JNB real_KONIQ_score_LPC real_KONIQ_score_MLV
clear real_KONIQ_score_MRZ real_KONIQ_score_RISE real_KONIQ_score_S3
clear real_KONIQ_score_SPARISH real_KONIQ_score_SVC real_KONIQ_score_SyMP

% do normalization ?
%  features = utsw_data_normalization( features, 'zscore' );
bid = bid';
features = features';

% do multiple times of machine learning regression
num_iteration = 100;
metrics_w_fitting_real_KONIQ_lasso = zeros(num_iteration, 4);  %metrics_wo_fitting_KONIQ_lasso = zeros(num_iteration, 3);
metrics_w_fitting_real_KONIQ_lasso_features = zeros( num_iteration, size(features,2));
%
num = length(bid);
stx = 9033;
n_para_fit = 5;
parfor ii = 1 : num_iteration
    indx = randperm(num);
    %
    y_train = bid( indx(1:stx), 1);
    y_ttest = bid( indx(stx+1:end), 1);
    x_train = features(indx(1:stx), : );
    x_ttest = features( indx(stx+1:end), : );
    %
  
        %----------------------------------------------------------------------------------------------------------------------
        % LASSO
        [B, FitInfo] = lasso(x_train,y_train,'Alpha',0.6, 'CV', 5);
        idxLambda1SE = FitInfo.Index1SE;
        coef = B(:,idxLambda1SE);
        coef0 = FitInfo.Intercept(idxLambda1SE);
        %
        y_hat = x_ttest*coef + coef0; % lasso regression
        y_hat( find(isnan(y_hat)) ) = 0;
        %
        metrics_w_fitting_real_KONIQ_lasso(ii, :) = utsw_biqa_score_logistic_fitting( y_hat, y_ttest, n_para_fit );
        %
        metrics_w_fitting_real_KONIQ_lasso_features(ii, :) = coef';
        %----------------------------------------------------------------------------------------------------------------------

    
    close all; clc;
    fprintf('iter \t (%d)/(%d) \n', ii, num_iteration);
end
%
clear ii ans
clear x_train x_ttest y_train y_ttest y_hat
clear mdl indx
clear bid features n_para_fit
clear num stx num_iteration
clear B coef coef0 FitInfo idxLambda1SE

% post-analysis
fprintf('lasso_w, \t %.4f, \t %.4f, \t %.4f, \t %.4f \n', mean(metrics_w_fitting_real_KONIQ_lasso( sum( isnan(metrics_w_fitting_real_KONIQ_lasso), 2)<1, : ))); % NaN

%
[real_KONIQ_x_CF, real_KONIQ_y_CF] = sort( sum(abs(metrics_w_fitting_real_KONIQ_lasso_features)>0), 'descend');
valid_index = real_KONIQ_y_CF( find(real_KONIQ_x_CF>50) )
%
save('real_KONIQ_x_CF.mat', 'real_KONIQ_x_CF');
save('real_KONIQ_y_CF.mat', 'real_KONIQ_y_CF');
%





