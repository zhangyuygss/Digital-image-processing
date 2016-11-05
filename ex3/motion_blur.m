clear;
im = imread('12003.jpg');
im = im2double(rgb2gray(im));
im = imresize(im, [256 256]);
a = 16;
K = round(size(im,1)/a);
PSF = fspecial('motion', a, 0);
f = imfilter(im, PSF, 'circular');
row_avrg = sum(f, 2)/size(f, 2);
f_diff = zeros(size(f));
f_diff(:, 2:size(f, 2)) = diff(f, 1, 2);
f_diff(:, 1) = f_diff(:, 2);
g = zeros(size(f));
for z = 1:a-1
	
end

subplot(1,2,1);
imshow(im);
title('Original');
subplot(1,2,2);
imshow(f);
title('Motion blur');
