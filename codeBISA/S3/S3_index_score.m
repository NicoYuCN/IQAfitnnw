function [score, map_s1, map_s2, map_s3] = S3_index_score( img )

if size(img, 3) > 1
    img = rgb2gray(img);
end

img = double(img);

% [map_s1, map_s2, map_s3] = s3_map(img, 1);
[map_s1, map_s2, map_s3] = s3_map(img, 0); % not showing the processing bar

[m,n]=size(map_s3);

sort_s3=sort(map_s3(:),'descend');

N=floor(m*n/100);

b=sum(sort_s3(1:N,:));

score=b/N;

end

