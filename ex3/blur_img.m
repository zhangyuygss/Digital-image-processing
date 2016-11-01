%% Generate a blured gray image from RGB image, add aditional noise
function [im2, noise] = blur_img(im, PSF, noise_mean, noise_var)
% 	im = rgb2gray(im);
	im = im2double(im);
	im1 = imfilter(im, PSF, 'circular');
    im2 = imnoise(im1, 'gaussian', noise_mean, noise_var);
    noise = im2 - im1;
    
