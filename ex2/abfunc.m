function [rsim] = abfunc(im, a, b)
	myalpha = 0.1;
	mybeta = 0.2;
	mygamma = 0.3;
	idx = find((0<=im) & (im<a));
	im(idx) = im(idx)*myalpha;
	idx = find((a<=im) & (im<b));
	im(idx) = mybeta*(im(idx)-a) + a*myalpha;
	idx = find(b<=im);
	im(idx) = mygamma*(im(idx) - b) + a*myalpha + (b-a)*mybeta;
    rsim = im;
end
