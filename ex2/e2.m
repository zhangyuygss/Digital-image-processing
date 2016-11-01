clear;

% 1:
im = rgb2gray(imread('12003.jpg'));
im1 = abfunc(im, 50, 190);
figure;
subplot(1,2,1);
imshow(im);
subplot(1,2,2);
imshow(im1);

% 2:
% gama_mi4 = gammafunc(im, 0.4);
% gama_mi8 = gammafunc(im, 0.8);
% gama_ma2 = gammafunc(im, 2);
% gama_ma8 = gammafunc(im, 8);
% figure;
% subplot(2,2,1);
% imshow(gama_mi4);
% title('gamma:0.4');
% subplot(2,2,2);
% imshow(gama_mi8);
% title('gamma:0.8');
% subplot(2,2,3);
% imshow(gama_ma2);
% title('gamma:2');
% subplot(2,2,4);
% imshow(gama_ma8);
% title('gamma:8');

% 3:
% im1 = gammafunc(im, 0.4);
% figure;
% subplot(2,2,1);
% imshow(im1);
% title('Original Img');
% subplot(2,2,2);
% imhist(im1);
% title('histogram');
% subplot(2,2,3);
% imshow(histeq(im1));
% title('Equalized Img');
% subplot(2,2,4)
% imhist(histeq(im1));
% title('histogram');

% 4:
% im = rgb2gray(imread('face.jpg'));
% im = im2double(imresize(im,[600 400]));
% masks = cell(5,1);
% masks{1} = ones(3,3)/9;
% masks{2} = [1,1,1; 1,2,1; 1,1,1]/10;
% masks{3} = [1 2 1; 2 4 2; 1 2 1]/16;
% masks{4} = [1 1 1; 1 0 1; 1 1 1]/8;
% masks{5} = [0 1/4 0; 1/4 1 1/4; 0 1/4 0]/2;
% figure;
% subplot(2,3,1);
% imshow(im);
% title('Original image');
% for i = 1:length(masks)
% 	smoothed = neighbor_mean(im, masks{i});
% 	subplot(2,3,i+1);
% 	imshow(smoothed);
% 	title(['mask number:' num2str(i)]);
% end

% 5:
im = rgb2gray(imread('12003.jpg'));
% g = imgradient(im);
% g = uint8(g);
% threshold = 220;
% figure;
% subplot(2,3,1);
% imshow(im);
% title('Original image');
% subplot(2,3,2);
% imshow(g);
% title('g = G');
% subplot(2,3,3);
% imtmp = g;
% idx = find(imtmp<threshold);
% imtmp(idx) = im(idx);
% imshow(imtmp);
% title('g = G when bigger than T');
% subplot(2,3,4);
% LG = 255;
% imtmp = g;
% idx1 = find(g>=threshold);
% idx2 = find(g<threshold);
% imtmp(idx1) = LG;
% imtmp(idx2) = im(idx2);
% imshow(imtmp);
% title('g = LG when bigger');
% subplot(2,3,5);
% LB = 0;
% imtmp = g;
% idx = find(g<threshold);
% imgtmp(idx) = LB;
% imshow(imtmp);
% title('g = LB when less');
% subplot(2,3,6);
% imtmp = g;
% imtmp(idx1) = LG;
% imtmp(idx2) = LB;
% imshow(imtmp);
% title('LG and LB');

% 6:Lapalace 
% im = im2double(im);
% masks = cell(4,1);
% masks{1} = [0 -1 0; -1 4 -1; 0 -1 0];
% masks{2} = [-1 -1 -1; -1 8 -1; -1 -1 -1];
% masks{3} = [1 -2 1; -2 4 -2; 1 -2 1];
% masks{4} = [0 -1 0; -1 5 -1; 0 -1 0];
% figure;
% subplot(2,3,1);
% imshow(im);
% title('Original image');
% for i = 1:length(masks)
% 	subplot(2,3,i+1);
% 	imshow(conv2(im, masks{i}));
% 	title(['mask:' num2str(i)]);
% end
