function score = RISE(img,scale)

%% Multi-scale Gradient Similarity and Multi-scale Singular Value Similarity
img1 = double( rgb2gray(img) );
[U,S1,V] = svd(img1);                                         %��ԭʼͼ���������ֵ�ֽ�
X1 = diag(S1) ;                                               %ԭʼͼ�������ֵ

[Gx ,Gy] = gradient(img1);
GM1 = abs(Gx) + abs(Gy);
GM1=GM1/2;                                                    %�����й�ʽ��3����ԭʼͼ������ݶ�

for i=1:4
    u=[2 4 6 8];
    k=[3 9 15 21];
    u=u(i);                                                   %��˹ģ�͵ı�׼��
    k=k(i);                                                   %��˹��ͨ�˲����ĳ߶�
    window = fspecial('gaussian',k,u);
    mu = imfilter(img,window,'replicate');                    %�����й�ʽ��1��ԭʼͼ��ͨ����˹��ͨ�˲��õ���߶ȿռ�ͼ��

    img2 = double( rgb2gray(mu) ); 
    [U,S2,V] = svd(img2);                                     %�Զ�߶�ͼ���������ֵ�ֽ�
    X2 = diag(S2) ;                                           %��߶�ͼ�������ֵ
    
    c1 = 0.001;                                               %fixed
    [Gx ,Gy] = gradient(img2);
    GM2 = abs(Gx) + abs(Gy); 
    GM2=GM2/2;                                                %�����й�ʽ��3���Զ�߶�ͼ������ݶ�
    GMSimMatrix = (2*GM1.*GM2 + c1) ./(GM1.^2 + GM2.^2 + c1); %�����й�ʽ��5������ԭʼͼ��ֱ���ÿһ���߶�ͼ����ݶ����ƶ� 
    GMfeature(i)= mean(GMSimMatrix(:));                       %�����й�ʽ��6���õ��ݶ����ƶ�����
    
    c2 = 0.001;                                               %fixed
    SVDSimMatrix = (2*X1.*X2 + c2) ./(X1.^2 + X2.^2 + c2);    %�����й�ʽ��8������ԭʼͼ��ֱ���ÿһ���߶�ͼ�������ֵ���ƶ� 
    SVDfeature(i) = mean(SVDSimMatrix);                       %����ƽ��ֵ�õ�����ֵ���ƶ�����

end

%% Multi-resolution Entropy in DCT Domain
Efeature=[];
imdist=rgb2gray(img);
weight=[0.6 1];
for i=1:scale
    im=imdist;
    fun=@(x)fecal(x);
    im=double(im);
    femat=blkproc(im,[8 8],fun);                              %��ԭʼͼ�����ֱ���ͼ����зֿ�

    sort_t = sort(femat(:),'ascend');                         %��ͼ�����ؽ��н�������
    len = length(sort_t);
    t=sort_t(ceil(len*weight(1)):ceil(len*weight(2)));        %ѡȡǰ40%ͼ������
    m(i)= mean(t);                                            %����ͼ������ƽ��ֵ��Ϊ��������
    Efeature=m ;
    imdist = imresize(imdist,0.5);                            %��ԭʼͼ����н���������
end
    
feature = [SVDfeature GMfeature Efeature];                    %�ܹ�11�������������ĸ���߶�����ֵ���ƶ��������ĸ���߶��ݶ����ƶ�������������ֱ���ͼ��������

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
system('svm-scale  -r range test_ind.txt >> test_ind_scaled');          %��һ��
system('svm-predict  -b 1  test_ind_scaled model output.txt>dump');     %Ԥ�����
load output.txt;
Score_proposed= output;
score=Score_proposed';