clear;
im = imread('12003.jpg');
im = im2double(rgb2gray(im));
noise_mean = 0;
noise_var = 0.0001;
PSF = fspecial('motion', 7, 45);
[f, noise] = blur_img(im, PSF, noise_mean, noise_var);
H = psf2otf(PSF, size(im));

% Winear filter
Sn = abs(fft2(noise)).^2;
Sf = abs(fft2(f)).^2;

% Minimun power
Sn = ones(size(H));
Sf = ones(size(H));

denom = abs(H).^2;
denom = denom.*Sf;
denom = denom + Sn;
denom = max(denom, sqrt(eps));
G = conj(H).*Sf;
G = G./denom;
F = fft2(f);
DEBLUR = G.*F;
deblur = ifft2(DEBLUR);
imshow(deblur);


% H = fft2(H);
% constriant = eye(size(im, 2));
% threholding = 1;
% mygamma = 100;
% for iter = 1:100
% 	g = H'*f/(H'*H + mygamma*(constriant')*(constriant));
% 	noise_norm = (norm(noise))^2;
% 	error_norm = norm(f - H*g)^2;
% 	if(noise_norm - error_norm > threholding)
% 		mygamma = mygamma + 2;
% 	elseif (noise_norm - error_norm < -threholding)
%  		mygamma = mygamma - 2;
% 	else
% 		disp('Converge in 100 iters');
% 		break;
%     end
% end
% disp('Did not converge in 100 iters');
% g = H'*f/(H'*H + mygamma*(constriant')*(constriant));
% subplot(2,2,1);
% imshow(im);
% title('Original Image');
% subplot(2,2,2);
% imshow(f);
% title('Blurred Image');
% subplot(2,2,3);
% imshow(g);
% title('Deblurred Image');
