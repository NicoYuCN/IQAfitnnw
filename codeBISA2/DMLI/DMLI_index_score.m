function score = DMLI_index_score( img )
step_size = 8;
window_size = 280; % 
% window_size = 416; % source
score = DMLI_Index(img,window_size,window_size,step_size);
end

% Window_size differs with different databases.
% img = imread('img92.png');% Images tested here are from CSIQ database and LIVE database.
% If you use databases of LIVE, TID2013 and IVC, please transform image
% into color space of YCbCr here, using the function below.
% img = rgb2YCbCr(img);