clear;
im = imread('12003.jpg');
im = im2double(rgb2gray(im));
PSF = fspecial('motion', 10, 45);
im_blur = imfilter(im, PSF, 'circular');
subplot(1,2,1);
imshow(im);
title('Original');
subplot(1,2,2);
imshow(im_blur);
title('Motion blur');