clear all;
BW = imread('Final_Out.jpg');
BW = rgb2gray(BW);
level = graythresh(BW);
BW = im2bw(BW, level);
%figure;
%imshow(BW);

BW2 = imfill(BW, 'holes');
figure; imshow(BW2);

D = bwdist(~BW2);
%figure;
%imshow(D);
D = -D;
D(~BW2) = -Inf;
L = watershed(D);
figure;
imshow(label2rgb(L,'jet','w'));