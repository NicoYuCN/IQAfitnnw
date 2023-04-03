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
clear real_KONIQ_score_ARISMC real_KONIQ_score_BIBLE real_KONIQ_score_CPBD
clear real_KONIQ_score_DMLI real_KONIQ_score_EMBM real_KONIQ_score_FISH
clear real_KONIQ_score_JNB real_KONIQ_score_LPC real_KONIQ_score_MLV
clear real_KONIQ_score_MRZ real_KONIQ_score_RISE real_KONIQ_score_S3
clear real_KONIQ_score_SPARISH real_KONIQ_score_SVC real_KONIQ_score_SyMP       

% do normalization ?
%  features = utsw_data_normalization( features, 'zscore' );
 bid = bid';    features = features';
 
 %% using selected features
 load('D:\code4graduate\bisaFusion\第3步_特征选择LASSO\real_KONIQ_x_CF.mat')
 load('D:\code4graduate\bisaFusion\第3步_特征选择LASSO\real_KONIQ_y_CF.mat')
 valid_KONIQ_feature_indx = real_KONIQ_y_CF( find(real_KONIQ_x_CF>79) );
 save('valid_KONIQ_feature_indx.mat', 'valid_KONIQ_feature_indx');
 %
 features = features(:, valid_KONIQ_feature_indx);
 
% do multiple times of machine learning regression
num_iteration = 100;
%
metrics_real_KONIQ_fitnn  = zeros(num_iteration, 4); 
metrics_real_KONIQ_grnn  = zeros(num_iteration, 4); 
metrics_real_KONIQ_lasso = zeros(num_iteration, 4);
metrics_real_KONIQ_svr    = zeros(num_iteration, 4);
%
num = length(bid);
stx = round(num*0.8);
n_para_fit = 5;

%% fit NN
parfor ii = 1 : num_iteration     
    indx = randperm(num);   
    %
    y_train = bid( indx(1:stx), 1);             y_ttest = bid( indx(stx+1:end), 1);
    x_train = features(indx(1:stx), : );      x_ttest = features( indx(stx+1:end), : );

    %----------------------------------------------------------------------------------------------------------------------
    % fit NN
    net = fitnet(10, 'trainbr');
    net = train(net, x_train', y_train');
    %
    y_hat = net(x_ttest')';                     y_hat( find(isnan(y_hat)) ) = 0;
    %
    metrics_real_KONIQ_fitnn(ii, :) = utsw_biqa_score_logistic_fitting( y_hat, y_ttest, n_para_fit );
    %----------------------------------------------------------------------------------------------------------------------
        
    close all; clc;
    fprintf('iter \t (%d)/(%d) \n', ii, num_iteration);
end
% post-analysis
fprintf('fitnn_w, \t %.4f, \t %.4f, \t %.4f, \t %.4f \n', mean(metrics_real_KONIQ_fitnn( sum( isnan(metrics_real_KONIQ_fitnn), 2)<1, : ))); % NaN
% save datasets
save('metrics_real_KONIQ_fitnn.mat', 'metrics_real_KONIQ_fitnn');

%% GRNN
parfor ii = 1 : num_iteration 
    %
    indx = randperm(num);   
    %
    y_train = bid( indx(1:stx), 1);             y_ttest = bid( indx(stx+1:end), 1);
    x_train = features(indx(1:stx), : );      x_ttest = features( indx(stx+1:end), : );

    %----------------------------------------------------------------------------------------------------------------------
    % GRNN
    grnn = newgrnn(x_train', y_train'); % spread using default 1.0
    %
    y_hat = sim(grnn, x_ttest')';               y_hat( find(isnan(y_hat)) ) = 0;
    %
    metrics_real_KONIQ_grnn(ii, :) = utsw_biqa_score_logistic_fitting( y_hat, y_ttest, n_para_fit );
    %----------------------------------------------------------------------------------------------------------------------
        
    close all; clc;
    fprintf('iter \t (%d)/(%d) \n', ii, num_iteration);
end
% post-analysis
fprintf('grnn_w, \t %.4f, \t %.4f, \t %.4f, \t %.4f \n', mean(metrics_real_KONIQ_grnn( sum( isnan(metrics_real_KONIQ_grnn), 2)<1, : ))); % NaN
% save datasets
save('metrics_real_KONIQ_grnn.mat', 'metrics_real_KONIQ_grnn');


%% LASSO
parfor ii = 1 : num_iteration 
    %
    indx = randperm(num);   
    %
    y_train = bid( indx(1:stx), 1);             y_ttest = bid( indx(stx+1:end), 1);
    x_train = features(indx(1:stx), : );      x_ttest = features( indx(stx+1:end), : );
    
    %----------------------------------------------------------------------------------------------------------------------
    % LASSO
    [B, FitInfo] = lasso(x_train,y_train,'Alpha',0.6, 'CV', 5);
    idxLambda1SE = FitInfo.Index1SE;
    coef = B(:,idxLambda1SE);
    coef0 = FitInfo.Intercept(idxLambda1SE);
    %
    y_hat = x_ttest*coef + coef0;       y_hat( find(isnan(y_hat)) ) = 0;
    %
    metrics_real_KONIQ_lasso(ii, :) = utsw_biqa_score_logistic_fitting( y_hat, y_ttest, n_para_fit );
    %----------------------------------------------------------------------------------------------------------------------
    
    close all; clc;
    fprintf('iter \t (%d)/(%d) \n', ii, num_iteration);
end
% post-analysis
fprintf('lasso_w, \t %.4f, \t %.4f, \t %.4f, \t %.4f \n', mean(metrics_real_KONIQ_lasso( sum( isnan(metrics_real_KONIQ_lasso), 2)<1, : ))); % NaN
% save datasets
save('metrics_real_KONIQ_lasso.mat', 'metrics_real_KONIQ_lasso');

%% SVR
parfor ii = 1 : num_iteration    
    %
    indx = randperm(num);   
    %
    y_train = bid( indx(1:stx), 1);             y_ttest = bid( indx(stx+1:end), 1);
    x_train = features(indx(1:stx), : );      x_ttest = features( indx(stx+1:end), : );

    %----------------------------------------------------------------------------------------------------------------------
    % SVR
    mdl = fitrsvm( x_train, y_train, 'OptimizeHyperparameters','auto', 'HyperparameterOptimizationOptions',struct('AcquisitionFunctionName', 'expected-improvement-plus'));
    %
    y_hat = predict(mdl, x_ttest);      y_hat( find(isnan(y_hat)) ) = 0;
    %
    metrics_real_KONIQ_svr(ii, :) = utsw_biqa_score_logistic_fitting( y_hat, y_ttest, n_para_fit );
    %----------------------------------------------------------------------------------------------------------------------
    
    close all; clc;
    fprintf('iter \t (%d)/(%d) \n', ii, num_iteration);
end
% post-analysis
fprintf('svr_w, \t \t %.4f, \t %.4f, \t %.4f, \t %.4f \n', mean(metrics_real_KONIQ_svr( sum( isnan(metrics_real_KONIQ_svr), 2)<1, : ))); % NaN
% save datasets
save('metrics_real_KONIQ_svr.mat',     'metrics_real_KONIQ_svr');

%
clear ii ans 
clear x_train x_ttest y_train y_ttest y_hat
clear mdl indx
clear bid features n_para_fit
clear num stx num_iteration
clear B coef coef0 FitInfo idxLambda1SE
