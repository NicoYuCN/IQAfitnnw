function score = SyMP_index_score(img, MaxPol_kernel)

if size(img, 3) > 1
    img = rgb2gray(img);
end

blurry_image = im2double(img); % 与double有区别

params.d = MaxPol_kernel;
params.moment_evaluation = [72, 8];

input_data.data = blurry_image;
score = Synthetic_MaxPol(input_data, params);
end

