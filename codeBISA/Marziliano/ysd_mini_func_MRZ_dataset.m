function [score_dataset, time_dataset] = ysd_mini_func_MRZ_dataset(src_folder, img_files, flag_dataset)

%--------------------------------------------------------------------------------------------------------------------------------------
% Simulated blurring images
%--------------------------------------------------------------------------------------------------------------------------------------
% CIDIQ
if strcmp(flag_dataset, 'CIDIQ')
    tic;    num_img = length(img_files);
    score_dataset = zeros(1, num_img);
    parfor ii_img = 1 : num_img
        % form the image name
        tmp_img_file = strcat([src_folder,  img_files(ii_img).name]); 
        % give out a cue
        fprintf('sim CIDIQ \t (%6d)/(%6d) \t file name (%s) \n', ii_img, num_img, tmp_img_file);
        % read in an image
        tmp_img_data = imread(tmp_img_file);
        % do MRZ prediction
        tmp_score = MRZ_index_score(tmp_img_data);
        % save the prediction score
        score_dataset(1, ii_img) = tmp_score;
    end
    % compute the mean time cost
    time_dataset = toc/num_img;
end

%--------------------------------------------------------------------------------------------------------------------------------------
% CSIQ
if strcmp(flag_dataset, 'CSIQ')
    tic;    num_img = length(img_files);
    score_dataset = zeros(1, num_img);
    parfor ii_img = 1 : num_img
        % form the image name
        tmp_img_file = strcat([src_folder, num2str(ii_img), '.png']);
        % give out a cue
        fprintf('sim CSIQ \t (%6d)/(%6d) \t file name (%s) \n', ii_img, num_img, tmp_img_file);
        % read in an image
        tmp_img_data = imread(tmp_img_file);
        % do MRZ prediction
        tmp_score = MRZ_index_score(tmp_img_data);
        % save the prediction score
        score_dataset(1, ii_img) = tmp_score;
    end
    % compute the mean time cost
    time_dataset = toc/num_img;    
end

%--------------------------------------------------------------------------------------------------------------------------------------
% LIVE
if strcmp(flag_dataset, 'LIVE')
    tic;    num_img = length(img_files);
    score_dataset = zeros(1, num_img);
    parfor ii_img = 1 : num_img
        % form the image name
        tmp_img_file = strcat([src_folder, num2str(ii_img), '.bmp']);
        % give out a cue
        fprintf('sim LIVE \t (%6d)/(%6d) \t file name (%s) \n', ii_img, num_img, tmp_img_file);
        % read in an image
        tmp_img_data = imread(tmp_img_file);
        % do MRZ prediction
        tmp_score = MRZ_index_score(tmp_img_data);
        % save the prediction score
        score_dataset(1, ii_img) = tmp_score;
    end
    % compute the mean time cost
    time_dataset = toc/num_img;
end

%--------------------------------------------------------------------------------------------------------------------------------------
% TID08
if strcmp(flag_dataset, 'TID08')
    tic;    num_img = length(img_files);
    score_dataset = zeros(1, num_img);
    parfor ii_img = 1 : num_img
        % form the image name
        tmp_img_file = strcat([src_folder, num2str(ii_img), '.bmp']);
        % give out a cue
        fprintf('sim TID08 \t (%6d)/(%6d) \t file name (%s) \n', ii_img, num_img, tmp_img_file);
        % read in an image
        tmp_img_data = imread(tmp_img_file);
        % do MRZ prediction
        tmp_score = MRZ_index_score(tmp_img_data);
        % save the prediction score
        score_dataset(1, ii_img) = tmp_score;
    end
    % compute the mean time cost
    time_dataset = toc/num_img;
end

%--------------------------------------------------------------------------------------------------------------------------------------
% TID13
if strcmp(flag_dataset, 'TID13')
    tic;   num_img = length(img_files);
    score_dataset = zeros(1, num_img);
    parfor ii_img = 1 : num_img
        % form the image name
        tmp_img_file = strcat([src_folder, num2str(ii_img), '.bmp']);
        % give out a cue
        fprintf('sim TID13 \t (%6d)/(%6d) \t file name (%s) \n', ii_img, num_img, tmp_img_file);
        % read in an image
        tmp_img_data = imread(tmp_img_file);
        % do MRZ prediction
        tmp_score = MRZ_index_score(tmp_img_data);
        % save the prediction score
        score_dataset(1, ii_img) = tmp_score;
    end
    % compute the mean time cost
    time_dataset = toc/num_img;
end

%--------------------------------------------------------------------------------------------------------------------------------------
% Realistic blurred images
%--------------------------------------------------------------------------------------------------------------------------------------
% BID11
if strcmp(flag_dataset, 'BID11')
    tic;    num_img = length(img_files);
    score_dataset = zeros(1, num_img);
    parfor ii_img = 1 : num_img
        % form the image name
        tmp_img_file = strcat([src_folder, img_files(ii_img).name]);
        % give out a cue
        fprintf('real BID11 \t (%6d)/(%6d) \t file name (%s) \n', ii_img, num_img, tmp_img_file);
        % read in an image
        tmp_img_data = imread(tmp_img_file);
        % do MRZ prediction
        tmp_score = MRZ_index_score(tmp_img_data);
        % save the prediction score
        score_dataset(1, ii_img) = tmp_score;
    end
    % compute the mean time cost
    time_dataset = toc/num_img;
end

%--------------------------------------------------------------------------------------------------------------------------------------
% CID2013
if strcmp(flag_dataset, 'CID2013')
    load([src_folder, 'img_name_CID2013.mat']) % image names
    tic;    num_img = length(img_name_CID2013);
    score_dataset = zeros(1, num_img);
    parfor ii_img = 1 : num_img
        % form the image name
        tmp_img_file = strcat([src_folder, 'CID2013_images\', img_name_CID2013{ii_img}, '.jpg']);
        % give out a cue
        fprintf('real CID2013 \t (%6d)/(%6d) \t file name (%s) \n', ii_img, num_img, tmp_img_file);
        % read in an image
        tmp_img_data = imread(tmp_img_file);
        % do MRZ prediction
        tmp_score = MRZ_index_score(tmp_img_data);
        % save the prediction score
        score_dataset(1, ii_img) = tmp_score;
    end
    % compute the mean time cost
    time_dataset = toc/num_img;
end

%--------------------------------------------------------------------------------------------------------------------------------------
% FocusPath
if strcmp(flag_dataset, 'FocusPath')
    tic;    num_img = length(img_files);
    score_dataset = zeros(1, num_img);
    parfor ii_img = 1 : num_img
        % form the image name
        tmp_img_file = strcat([src_folder,  img_files(ii_img).name]); %
        % give out a cue
        fprintf('real FocusPath \t (%6d)/(%6d) \t file name (%s) \n', ii_img, num_img, tmp_img_file);
        % read in an image
        tmp_img_data = imread(tmp_img_file);
        % do MRZ prediction
        tmp_score = MRZ_index_score(tmp_img_data);
        % save the prediction score
        score_dataset(1, ii_img) = tmp_score;
    end
    % compute the mean time cost
    time_dataset = toc/num_img;
end

%--------------------------------------------------------------------------------------------------------------------------------------
% CLIVE
if strcmp(flag_dataset, 'CLIVE')
    tic;    num_img = length(img_files);
    score_dataset = zeros(1, num_img);
    parfor ii_img = 1 : num_img
        % form the image name
        tmp_img_file = strcat([src_folder,  img_files(ii_img).name]); %
        % give out a cue
        fprintf('real CLIVE \t (%6d)/(%6d) \t file name (%s) \n', ii_img, num_img, tmp_img_file);
        % read in an image
        tmp_img_data = imread(tmp_img_file);
        % do MRZ prediction
        tmp_score = MRZ_index_score(tmp_img_data);
        % save the prediction score
        score_dataset(1, ii_img) = tmp_score;
    end
    % compute the mean time cost
    time_dataset = toc/num_img;
end

%--------------------------------------------------------------------------------------------------------------------------------------
% KONIQ
if strcmp(flag_dataset, 'KONIQ')
    tic;    num_img = length(img_files);
    score_dataset = zeros(1, num_img);
    parfor ii_img = 1 : num_img
        % form the image name
        tmp_img_file = strcat([src_folder,  img_files(ii_img).name]); %
        % give out a cue
        fprintf('real KONIQ \t (%6d)/(%6d) \t file name (%s) \n', ii_img, num_img, tmp_img_file);
        % read in an image
        tmp_img_data = imread(tmp_img_file);
        % do MRZ prediction
        tmp_score = MRZ_index_score(tmp_img_data);
        % save the prediction score
        score_dataset(1, ii_img) = tmp_score;
    end
    % compute the mean time cost
    time_dataset = toc/num_img;
end

end

