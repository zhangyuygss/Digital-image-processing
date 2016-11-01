clear;
x = -10:0.1:10;
y = -10:0.1:10;
m = length(x);
x = repmat(x,m,1);
y = repmat(y', 1,m);
u = 1;
v = 1;
fi = pi/3;
f = exp(1i*(2*pi*(u*x + v*y) + fi));

F = fft2(f);

angles  = angle(F);
power = abs(F);
subplot(1,2,1);

mesh(x,y,angles);
subplot(1,2,2);
% imshow(power);
mesh(x,y,power);

% clc;
% I = [12,23,53,16;42,16,68,45;34,62,73,26;72,15,34,28];  
% A = zeros(4);   
% for i = 0:3
%     for j = 0:3
%         if i == 0
%             a = sqrt(1/4);
%         else
%             a = sqrt(2/4);
%         end
%         A(i+1,j+1) = a*cos((j+0.5)*pi*i/4)
%     end
% end
% D = A*I*A';     
% D1 = dct2(I);   
% D2 = A'*D*A;  
