function [smoothed] = neighbor_mean(im, mask)
	smoothed = conv2(im, mask);
end