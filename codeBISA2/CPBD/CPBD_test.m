clear all;clc;

I=imread('img1.bmp');
img=rgb2gray(I);
Q = CPBD_compute(img);
