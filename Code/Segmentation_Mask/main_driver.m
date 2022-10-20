%clear;close all;clc ; 
function[bwim]= main_driver(image)

iptsetpref('ImshowBorder','tight');
im=imread(image);
%figure;
%imshow(im);
contrast_im = imadjust(im,stretchlim(im),[]);
%contrast_im = im;
%figure;
%imshow(contrast_im);
bwim=adaptivethreshold(contrast_im,50,0.02,0);
%figure();
%imshow(bwim);
objects = uint8(cat(3,bwim,bwim, bwim)) .* uint8(contrast_im);
%objects = uint8(bwim) .* contrast_im;
[row column rgb] = size(contrast_im);
%objects = contrast_im;
%figure();
%imshow(objects);
obj_pixels = uint32(reshape(objects, row*column, rgb));
row_info = repmat(1:row, [1 , column]);
col_info = kron(1:column, ones(1, row));
obj_pixels = [obj_pixels, row_info', col_info'];
inx_pixels = ~ismember(obj_pixels(:, 1:3),[0 0 0],'rows');
obj_pixels = obj_pixels(find(inx_pixels), :);

rng(2);
options = statset('Display','final');
gm = fitgmdist(double(obj_pixels(:,2)),2,'Options',options);
inx_cluster = cluster(gm ,double(obj_pixels(:,2)));
non_nucleus_objects = obj_pixels(find(inx_cluster == 2),:);
for i = 1:size(non_nucleus_objects,1)
    bwim(non_nucleus_objects(i,4), non_nucleus_objects(i,5)) = 0;
end

