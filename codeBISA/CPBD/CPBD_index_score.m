function [score] = CPBD_index_score(img)

if (size(img, 3) > 1)
    img = rgb2gray(img);
end
img = double(img);

score = CPBD_compute( img );


end

