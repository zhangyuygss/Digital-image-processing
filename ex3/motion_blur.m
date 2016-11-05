% 时域的运动模糊复原
clear;
im = imread('12003.jpg');
im = im2double(rgb2gray(im));
im = imresize(im, [256 256]);
a = 16;						% blur pixel number
K = round(size(im,1)/a);
PSF = fspecial('motion', a, 0);
f = imfilter(im, PSF, 'circular');
row_avrg = sum(f, 2)/size(f, 2);
f_diff = zeros(size(f));	% diff of blurred image
f_diff(:, 2:size(f, 2)) = diff(f, 1, 2);
f_diff(:, 1) = f_diff(:, 2);
g = zeros(size(f));			% deblurred image
for row = 1:size(f,2)		% every row of image
	fai = zeros(a);
	for z = 1:a
		tmpsum = 0;
		for iter_k = 0:K-1
			tmpsum = tmpsum + (K-iter_k)*f_diff(row, z+iter_k*a);
		end
		fai(z) = row_avrg(row) - a*tmpsum/K;
		clear tmpsum,iter_k;
		% compute f(z + m*a) of current row
		for m = 0:K-1
			tmpsum = 0;
			for iter_k = 0:m
				tmpsum = tmpsum + f_diff(row, z+iter_k*a);
			end
			g(row, z+m*a) = a*tmpsum + fai(z);
		end
	end
end

subplot(2,2,1);
imshow(im);
title('Original');
subplot(2,2,2);
imshow(f);
title('Motion blur');
subplot(2,2,3);
imshow(g);
title('spatial deblur');
subplot(2,2,4);
imshow((im - g));
title('difference image');