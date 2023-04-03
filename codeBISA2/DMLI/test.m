clc;clear all;close all;
step_size = 8;
window_size = 416;        % Window_size differs with different databases.
img = imread('D:\code4graduate\bisaFusion\dataBLUR\real_CID2013\CID2013_images\IS_VI_C01_D14.jpg');% Images tested here are from CSIQ database and LIVE database.
% If you use databases of LIVE, TID2013 and IVC, please transform image
% into color space of YCbCr here, using the function below.
% img = rgb2YCbCr(img);
result = DMLI_Index(img,window_size,window_size,step_size);