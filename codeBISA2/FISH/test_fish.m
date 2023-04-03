% Test FISH and FISH_bb with image 'lena.png'

clc;
clear;
close all;

img=imread('lena.png');
sh1 = fish(img);

[sh2, map] = fish_bb(img);

figure, imshow(map,[]);