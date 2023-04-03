function [blur] = DMLI_Index(img,N1,N2,step)

%This is the Matlab code of a simple algorithm for calculating the sharpness for an input image.

%Please refer to the following paper if you use this code for your research:

%reference paper: Chen, J., Li, S., Lin, L.: A no-reference blurred colourful 
%                 image quality assessment method based on dual maximum local information. 
%                 IET Signal Process. 1¨C15 (2021). https://doi.org/10.1049/sil2.12064

%Kindly report any suggestions or corrections to jianchen@fjut.edu.cn

%Input :  img - the input image (gray image).
%         N1,N2 - window size.
%         step - step size.
%Output:  the sharpness evaluation

[m,n,p] = size(img);
img1 = img;
img = rgb2gray(img);
LineNum = floor((m-N1)/step)+1;
ColNum = floor((n-N2)/step)+1;
[Line,Col] = entropy_calculation(LineNum,ColNum,img,N1,N2,step); 
if Line > 0
    blur = local_selection(img1,Line,Col,N1,N2,step);
else
    blur = 0; % Shaode Yu
end
end