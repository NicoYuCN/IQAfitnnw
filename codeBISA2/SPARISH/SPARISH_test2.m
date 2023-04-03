tic

clear all;clc;
load Dic_pre.mat; %trained dictionary

% img=imread('1.bmp');
% L=6;
% [img_block,var_gray]=blocks(img);
% img_block=img_block(:,1:100);
% A_gray=OMP(Dic,img_block,L);  
for x=1:150
    imageName1=strcat('img',num2str(x),'.bmp');
    imageName2=strcat('E:\iqa-db\live\gblur\',imageName1);
    img=imread(imageName2);
    
    [SPARISH] = SPARISH_compute2(img,Dic);
    Q(x) = SPARISH;
    q=Q'    
end

toc
    