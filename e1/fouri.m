clear;
% 1:
% x = -10:0.1:10;
% y = -10:0.1:10;
% m = length(x);
% x = repmat(x,m,1);
% y = repmat(y', 1,m);
% u = 1;
% v = 1;
% fi = pi/3;
% f = exp(1i*(2*pi*(u*x + v*y) + fi));
% 
% F = fft2(f);
% 
% angles  = angle(F);
% power = abs(F);
% subplot(1,2,1);
% 
% mesh(x,y,angles);
% subplot(1,2,2);
% % imshow(power);
% mesh(x,y,power);

% 2:
% for idx = 1:5
% 	im = imread([num2str(idx) '.jpg']);
%     if(length(size(im))==3)
%         im = rgb2gray(im);
%     end
% 	size1 = size(im,1);
% 	ftmp = fft(im,size1,1);
% 	F = fft(ftmp',size1,1);
% 	figure;
% 	imshow(F');
% end
% 


% 3:
% f = [1 1 3 1; 2 1 2 2; 3 0 5 -1; 1 3 2 5]
% h = hadamard(4)
% F = h*f*h/4
% f = h*F*h/4



% 4:K_L 变换
% im = imread('311257-106.jpg');
% im = im2double(rgb2gray(im));
% covx = cov(im);
% [pc,variances,explained] = pcacov(covx);
% KL=im*pc;
% imshow(im);
% figure;
% imshow(KL);

clc;
close all;
clear all;
I=imread('311257-106.jpg');
I=im2double(rgb2gray(I));
I = imresize(I,[256 256]); 
m=1;
for i=1:8:256
    for j=1:8:256
        for x=0:7
            for y=0:7
            img(x+1,y+1)=I(i+x,j+y);
            end
        end
            k=0;
            for l=1:8
                img_expect{k+1}=img(:,l)*img(:,l)';
                k=k+1;
            end
            imgexp=zeros(8:8);
            for l=1:8
                imgexp=imgexp+(1/8)*img_expect{l};%expectation of E[xx']
            end
            img_mean=zeros(8,1);
            for l=1:8
                img_mean=img_mean+(1/8)*img(:,l);
            end
            img_mean_trans=img_mean*img_mean';
            img_covariance=imgexp - img_mean_trans;
            [v{m},d{m}]=eig(img_covariance);
            temp=v{m};
             m=m+1;
            for l=1:8
                v{m-1}(:,l)=temp(:,8-(l-1));
            end
             for l=1:8
           trans_img1(:,l)=v{m-1}*img(:,l);
             end
           for x=0:7
               for  y=0:7
                   transformed_img(i+x,j+y)=trans_img1(x+1,y+1);
               end
           end
mask=[1 1 1 1 1 1 1 1 
      1 1 1 1 1 1 1 1 
      1 1 1 1 1 1 1 1 
      1 1 1 1 1 1 1 1 
      1 1 1 1 1 1 1 1 
      1 1 1 1 1 1 1 1 
      1 1 1 1 1 1 1 1 
      1 1 1 1 1 1 1 1 ];
  trans_img=trans_img1.*mask;
           for l=1:8
           inv_trans_img(:,l)=v{m-1}'*trans_img(:,l);
           end
            for x=0:7
               for  y=0:7
                  inv_transformed_img(i+x,j+y)=inv_trans_img(x+1,y+1);
               end
           end
          end
  end
  imshow(I);
  figure
  imshow(inv_transformed_img);
  figure;
  err = I-inv_transformed_img;
  imshow(I-inv_transformed_img)
% X=imread(TEST.TIF); %读图�?X是一�?波段图像图像的宽和高均为 256

% XX=reshape(X,[256*256,7]); %将图像转换化为一个波段的图像

% pic1=XX(:,1);

% pic1=reshape(pic1,[256, 256]);

% figure(1);

% imshow(pic1,[]);

% title(Original Image);

% XX=im2double(XX); %图像转化为双精度

% covx = cov(XX); % 求图像的协方�?
% [pc,variances,explained] = pcacov(covx); % 求解K_L变换矩阵，即PCA

% pc

% myKL=XX*pc; %进行K_L变换

% pic2=myKL(:,1);

% pic2=reshape(pic2,[256,256]);

% figure(2);

% imshow(pic2,[]);

% title(K_L 第一分量);

% figure(3);

% pic3=myKL(:,2);

% pic3=reshape(pic3,[256 256]);

% imshow(pic3,[]);

% title(K_L 第二分量);

% my=myKL*pc;

% my1=my(:,1);

% my1=reshape(my1,[256,256]);

% figure(4);

% imshow(my1,[]);