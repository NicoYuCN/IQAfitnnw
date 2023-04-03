function score = RISE(img,scale)

%% Multi-scale Gradient Similarity and Multi-scale Singular Value Similarity
img1 = double( rgb2gray(img) );
[U,S1,V] = svd(img1);                                         %对原始图像进行奇异值分解
X1 = diag(S1) ;                                               %原始图像的奇异值

[Gx ,Gy] = gradient(img1);
GM1 = abs(Gx) + abs(Gy);
GM1=GM1/2;                                                    %论文中公式（3）对原始图像计算梯度

for i=1:4
    u=[2 4 6 8];
    k=[3 9 15 21];
    u=u(i);                                                   %高斯模型的标准差
    k=k(i);                                                   %高斯低通滤波器的尺度
    window = fspecial('gaussian',k,u);
    mu = imfilter(img,window,'replicate');                    %论文中公式（1）原始图像通过高斯低通滤波得到多尺度空间图像

    img2 = double( rgb2gray(mu) ); 
    [U,S2,V] = svd(img2);                                     %对多尺度图像进行奇异值分解
    X2 = diag(S2) ;                                           %多尺度图像的奇异值
    
    c1 = 0.001;                                               %fixed
    [Gx ,Gy] = gradient(img2);
    GM2 = abs(Gx) + abs(Gy); 
    GM2=GM2/2;                                                %论文中公式（3）对多尺度图像计算梯度
    GMSimMatrix = (2*GM1.*GM2 + c1) ./(GM1.^2 + GM2.^2 + c1); %论文中公式（5）计算原始图像分别与每一个尺度图像的梯度相似度 
    GMfeature(i)= mean(GMSimMatrix(:));                       %论文中公式（6）得到梯度相似度特征
    
    c2 = 0.001;                                               %fixed
    SVDSimMatrix = (2*X1.*X2 + c2) ./(X1.^2 + X2.^2 + c2);    %论文中公式（8）计算原始图像分别与每一个尺度图像的奇异值相似度 
    SVDfeature(i) = mean(SVDSimMatrix);                       %计算平均值得到奇异值相似度特征

end

%% Multi-resolution Entropy in DCT Domain
Efeature=[];
imdist=rgb2gray(img);
weight=[0.6 1];
for i=1:scale
    im=imdist;
    fun=@(x)fecal(x);
    im=double(im);
    femat=blkproc(im,[8 8],fun);                              %对原始图像及其多分辨率图像进行分块

    sort_t = sort(femat(:),'ascend');                         %将图像块的熵进行降序排列
    len = length(sort_t);
    t=sort_t(ceil(len*weight(1)):ceil(len*weight(2)));        %选取前40%图像块的熵
    m(i)= mean(t);                                            %计算图像块的熵平均值作为最后的特征
    Efeature=m ;
    imdist = imresize(imdist,0.5);                            %对原始图像进行降采样处理
end
    
feature = [SVDfeature GMfeature Efeature];                    %总共11个特征，包括四个多尺度奇异值相似度特征，四个多尺度梯度相似度特征和三个多分辨率图像熵特征

%% Support Vector Regression 
feat = feature;
fid = fopen('test_ind.txt','w');
for jj = 1:size(feat,1)
fprintf(fid,'1 ');
for kk = 1:size(feat,2)
fprintf(fid,'%d:%f ',kk,feat(jj,kk));
end
fprintf(fid,'\n');
end
fclose(fid);
warning off all
delete output test_ind_scaled dump
system('svm-scale  -r range test_ind.txt >> test_ind_scaled');          %归一化
system('svm-predict  -b 1  test_ind_scaled model output.txt>dump');     %预测分数
load output.txt;
Score_proposed= output;
score=Score_proposed';