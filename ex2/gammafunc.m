function [res_im] = gammafunc(im , mygamma)
	im = im2double(im);
	res_im = im.^(mygamma);
end