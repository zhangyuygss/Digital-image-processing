clear;
im = imread('12003.jpg');
im = im2double(rgb2gray(im));

subplot(2,2,1);
imshow(im);
title('Original Image');

noise_mean = 0;
noise_var = 0.001;
f = imnoise(im, 'gaussian', noise_mean, noise_var);
noise = f - im;
% noise = mat2gray(noise);
myalpha = 1;

subplot(2,2,2);
imshow(f);
title('Noise image');

Sf = abs(fft2(f)).^2;
Sn = abs(fft2(noise)).^2;
Sg = Sf - myalpha*Sn;
idx = find(Sg <= 0);
Sg(idx) = 0;
G = sqrt(Sg);
G = complex(G,0);
g = ifft2(G);
subplot(2,2,3);
imshow(g);
title('谱减法');

subplot(2,2,4);
imshow(mat2gray(noise));