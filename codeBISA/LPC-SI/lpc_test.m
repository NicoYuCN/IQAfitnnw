tic

clear all;clc;

img=imread('monkey.bmp');
% img=rgb2gray(img);
[si, lpc_map] = LPC_index_score(img);
% scales   = [1 3/2 2];
% w = [1 -3 2];
% norient  = 8;
% C = 2;
% Beta_k = 1e-4;
% 
% [row col]= size(img);
% B = round(min(row, col)/16);
% 
% [lpc_si lpc_map] = lpc_si(img, scales, w, C, Beta_k, norient, B);
% lpc_si
% figure, imshow(lpc_map)
% figure,  imshow(mat2gray(lpc_map)*1)
% imwrite(lpc_map,'squirrel.bmp')

% for x=1:4
%     imageName1=strcat(num2str(x),'.png');
%     imageName2=strcat('E:\�о���ѧϰ����\ģ������\ģ���㷨�ں�\Data\',imageName1);
%     
%     I=imread(imageName2);
%     I=rgb2gray(I);
%     [si lpc_map] = lpc_si(I);
%     Q(x)=si;
%     q=Q'
% end


toc