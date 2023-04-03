function [arismc, features ] = ARISMC_index_score(im)
%==========================================================================
% 1) Please cite the paper (K. Gu, G. Zhai, W. Lin, X. Yang, and W. Zhang, 
% "No-reference image sharpness assessment in autoregressive parameter space,"
% IEEE Trans. Image Process., vol. 24, no. 10, pp. 3218-3231, 2015.)
% 2) If any question, please contact me through guke.doctor@gmail.com; 
% gukesjtuee@gmail.com. 
% 3) Welcome to cooperation, and I am very willing to share my experience.
%==========================================================================
%   Shaode Yu
%               User friendly
%-------------------------------------------------------------------------------------------------------
im = double(im);
Y1 = uint8(0.299*im(:,:,1)+0.587*im(:,:,2)+0.114*im(:,:,3)); %figure; imshow(Y1, []);
I1 = uint8(0.596*im(:,:,1)-0.274*im(:,:,2)-0.322*im(:,:,3)); %figure; imshow(I1, []);
Q1 = uint8(0.211*im(:,:,1)-0.523*im(:,:,2)+0.312*im(:,:,3)); %figure; imshow(Q1, []);
ww = [0.93,0.14,0.03];
[arism(1), feaY] = arism_index_func(Y1);
[arism(2), feaL] = arism_index_func(I1);
[arism(3), feaQ] = arism_index_func(Q1);
arismc = [arism(1), ww*arism']; % Y1-score, Y1-I1-Q1-score
features = [feaY, feaL, feaQ];

%=======================================================
function [arism, features] = arism_index_func(im)
im = double(im);
[m,n] = size(im);
w = zeros(m-2,n-2,8);
tol = 1e-3;
for i = 2:m-1
for j = 2:n-1
tmp = im(i-1:i+1,j-1:j+1);
z = [tmp(1:4) tmp(6:9)]-tmp(5);
if ~max(abs(z))
continue
end
C = z'*z;
C = C + eye(8,8)*tol*trace(C);
w(i-1,j-1,:) = C\ones(8,1);
w(i-1,j-1,:) = w(i-1,j-1,:)/sum(w(i-1,j-1,:));
end
end
% Parameter Setting
ccc = [0.1,0.3,1];
thr = [0.001,0.3,0.00005];
www = 0.5;
blk = 36;
vvv = 1e-6;
% Distortion Map
Vmax = max(w,[],3);
Vmin = min(w,[],3);
tmp1 = Vmax-Vmin;
tmp2 = 1-(2*Vmax.*Vmin+vvv)./(Vmax.^2+Vmin.^2+vvv);
% Global Measure
tmp1 = sort(tmp1(:),'descend');
num(1) = mean2(tmp1(1:round(thr(1)*end)).^2);
tmp3 = sort(tmp2(:),'descend');
num(3) = mean2(tmp3(1:round(thr(3)*end)));
% Local Measure
[m n] = size(tmp2);
tmp2 = tmp2(1:floor(m/blk)*blk,1:floor(n/blk)*blk);
tmp2 = blkproc(tmp2,[blk blk],@mean2);
tmp2 = sort(tmp2(:),'descend');
num(2) = mean2(tmp2(1:round(thr(2)*end)).^www);
% Pooling
arism = ccc*num';
features = num;