function SPARISH = SPARISH_index_score(img,Dic,L,x)

if nargin < 4,  x=0.6; end

if nargin < 3, L=6; end

% load Dic.mat; %trained dictionary

if size(img,3) > 1
    img = rgb2gray(img);
end

img = double(img);

[img_block,var_gray]=blocks(img);
 
%% �Ҷ���Ϣϡ���ʾϵ��
A_gray=OMP(Dic,img_block,L);  
A_gray=full(A_gray);
% A_gray=sum(abs(A_gray));
A_gray=sum(A_gray.*A_gray);

  
%% ��|A|���еݼ����У����Ӧ��std_blockҲ��|A|�仯
n=size(A_gray,2);
temp_gray=zeros(2,n);
temp_gray(1,:)=A_gray;
temp_gray(2,:)=var_gray;
% temp_gray(2,:)=A_gray;
% temp_gray(1,:)=var_gray;
  
temp_gray=temp_gray';
sort_temp_gray=sortrows(temp_gray,-2);

 m=floor(x*n); %ȡ |A|����x%����
 
SPARISH=sum(sort_temp_gray(1:m,1))/sum(sort_temp_gray(1:m,2));
% SHARISH=sum(sort_temp_gray(1:m,2))/sum(sort_temp_gray(1:m,1));

end
