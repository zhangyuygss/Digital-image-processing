clear;
im = imread('12003.jpg');
im = im2double(rgb2gray(im));

subplot(2,3,1);
imshow(im);
title('Original Image');

noise_mean = 0;
noise_var = 0.0001;
PSF = fspecial('motion', 7, 45);
[f, noise] = blur_img(im, PSF, noise_mean, noise_var);

subplot(2,3,2);
imshow(f);
title('Blurred Image');

H = psf2otf(PSF, size(im));

% Winear filter
Sn_winear = abs(fft2(noise)).^2;
Sf_winear = abs(fft2(f)).^2;
denom = abs(H).^2;
denom = denom.*Sf_winear;
denom = denom + Sn_winear;
denom = max(denom, sqrt(eps));
G = conj(H).*Sf_winear;
G = G./denom;
F = fft2(f);
DEBLUR = G.*F;
deblur = ifft2(DEBLUR);
subplot(2,3,3);
imshow(deblur);
title('Winear deblur');


% Minimun power
Sn_power = ones(size(H));
Sf_power = ones(size(H));
denom = abs(H).^2;
denom = denom.*Sf_power;
denom = denom + Sn_power;
denom = max(denom, sqrt(eps));
G = conj(H).*Sf_power;
G = G./denom;
F = fft2(f);
DEBLUR = G.*F;
deblur = ifft2(DEBLUR);
subplot(2,3,4);
imshow(deblur);
title('Power deblur');


% smooth constriant 
lapalace = [0 1 0; 1 -4 1; 0 1 0];
Sn_smooth = psf2otf(lapalace,size(im));
% Sn_smooth = fft2(Sn_smooth);
Sf_smooth = ones(size(im));
denom = abs(H).^2;
denom = denom.*Sf_smooth;
denom = denom + Sn_smooth;
denom = max(denom, sqrt(eps));
G = conj(H).*Sf_smooth;
G = G./denom;
F = fft2(f);
DEBLUR = G.*F;
deblur = ifft2(DEBLUR);
subplot(2,3,5);
imshow(deblur);
title('Smooth deblur');


% Direct Inverse 
deblur = ifft2(F./H);
subplot(2,3,6);
imshow(deblur);
title('Inverse deblur');
