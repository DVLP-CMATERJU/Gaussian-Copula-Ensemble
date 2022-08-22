%BoundingBox
clearvars -except bwim;
t = 200;
stats = regionprops(bwim,'Area', 'BoundingBox', 'FilledImage', 'FilledArea');
rectangles = cat(1, stats.BoundingBox);
areas = cat(1, stats.Area);
%im = cat(1, stats.FilledImage);
figure;
imshow(bwim);
hold on;
% plot(centroids(:,1), centroids(:,2), 'b*');
for i = 1 : size(rectangles, 1)
    if (areas(i) > t)
        %rectangle('Position', rectangles(i, :), 'EdgeColor', 'r');
    else
        rectangle('Position', rectangles(i, :), 'FaceColor', 'k')
    end
    
end
hold off;
print('Final_Out', '-djpeg');

%del_rects = rectangles(find(areas <= t),:);



% [R C] = size(bwim);
% % figure;
% % imshow(uint8(bwim));
% % figure;
% % filteredIm = roifill(uint8(bwim));
% 
% filteredIm = uint8(bwim)*255;
% 
% for i = 1 : size(del_rects, 1)
%     x = rectangles(i, 1);
%     y = rectangles(i, 2);
%     w = rectangles(i, 3);
%     h = rectangles(i, 4);
%     c = [ x , x+w , x+w, x ];
%     r = [R-y, R-y, R-y-h, R-y-h];
%     filteredIm = roifill(filteredIm, c, r);
% end
% 
% figure;
% imshow(filteredIm);


