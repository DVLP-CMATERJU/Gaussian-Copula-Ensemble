function [] = crop_New(mask_im_name,Rgb_Original_im,path)
% tic
%clear all; % Clear the work spaces to store new image details %
%p = 1;
index = 1;
imgArray = {};
% distinctImgArray = {};
% indexNew = 1;
Crop_img_size = 256; %Cropped image size will be 256 * 256 %
[fp fname fext] = fileparts(Rgb_Original_im);
%im=imread('/media/nibaran/storage/Soumyajyoti/mask new/Result/Untitled Folder/Mask/B24A.jpg');
%Original_im = imread('/media/nibaran/storage/Soumyajyoti/FNAC_Total_Dataset_/1/B24A.jpg');
im = imread(mask_im_name);
Original_im = imread(Rgb_Original_im);
Original_im = imresize(Original_im,[900 1200]);
%Original_im = imresize(Original_im,[600 800]);
%im = imresize(im,[500 500]);
img_gray = rgb2gray(im);
max1 = max(max(img_gray));
min1 = min(min(img_gray));
diff = max1 - min1;
[r c] = size(img_gray);
for i=1:r
    for j=1:c
        Norms_img(i,j) =img_gray(i,j)-min1;
    end
end
Norms_img = double(Norms_img);
Norms_img = Norms_img/double(diff); %% Convert RGB image into normalized from %%
% M = max(max(Norms_img)); 
% Maximum intensity value of the image %%
k = 1;
for i = 1:r
    for j = 1:c
        if(Norms_img(i,j)>= 0.5 && Norms_img(i,j)<=1)
        stack(k) = Norms_img(i,j);
        k = k + 1;
        end
    end
end
stack = sort(stack);
len = length(stack);
delta = Crop_img_size / 2;
for m = 1:len
    if(m==1)   % Initial step %
       M = stack(len);
       for i=1:r
           for j=1:c
              if(Norms_img(i,j)== M) %% Calculation of cordinate of high prob  value %%
                 x = i;
                 y = j;
              end
           end
       end 
     im_left = imcrop(Original_im,[(y-delta) x 255 255]);
     imgArray{index} = im_left;
     index = index + 1;
     im_top = imcrop(Original_im,[y (x-delta) 255 255]);
     imgArray{index} = im_top;
     index = index + 1;
     im_bottom = imcrop(Original_im,[y (x+delta)  255 255]);
     imgArray{index} = im_bottom;
     index = index + 1;
     im_right = imcrop(Original_im,[(y+delta) x 255 255]);
     imgArray{index} = im_right;
     index = index + 1;
     im_middle = imcrop(Original_im,[y x 255 255]);
     imgArray{index} = im_middle;
%      figure;imshow(Original_im);
%      hold on;
%      rectangle('Position',[y, x, 256, 256],'EdgeColor','r');
%      rectangle('Position',[y, (x + delta), 256, 256],'EdgeColor','g');
%      rectangle('Position',[(y + delta), x, 256, 256],'EdgeColor','g');
%      rectangle('Position',[(y - delta), x, 256, 256],'EdgeColor','g');
%      rectangle('Position',[y, (x - delta ), 256, 256],'EdgeColor','g');
     disp('Insert Initial ROIs');
     len = len - 1;
    else 
       
    
        
%disp('***************************');
    M = stack(len);
    for i=1:r
        for j=1:c
            if(Norms_img(i,j)== M) %% Calculation of cordinate of high prob  value %%
                x = i;
                y = j;
            end
        end
    end
   
%figure;imshow(Norms_img);
%hold on;
% Making bounding box top, down, right, left %
% rectangle('Position',[y, x, 256, 256],'EdgeColor','r');
% rectangle('Position',[y, (x + delta), 256, 256],'EdgeColor','g');
% rectangle('Position',[(y + delta), x, 256, 256],'EdgeColor','g');
% rectangle('Position',[(y - delta), x, 256, 256],'EdgeColor','g');
% rectangle('Position',[y, (x - delta ), 256, 256],'EdgeColor','g');


    count_bottom = 0;     % Bottom sided ROI's high probability values covered area calculation %
    for i=(x+delta):(x+delta+Crop_img_size)
%      figure;imshow(Original_im);
%      hold on;
%      rectangle('Position',[y, x, 256, 256],'EdgeColor','r');
%      rectangle('Position',[y, (x + delta), 256, 256],'EdgeColor','g');
%      rectangle('Position',[(y + delta), x, 256, 256],'EdgeColor','g');
%      rectangle('Position',[(y - delta), x, 256, 256],'EdgeColor','g');
%      rectangle('Position',[y, (x - delta ), 256, 256],'EdgeColor','g');
        for j=y:(y+Crop_img_size)
            if((i>=1 && i<=r) && (j>=1 && j<=c))
            %         try if(i>=r && j>=c)
            %                 catch('index out of bound');
            %             end
            %        end
    
            if(Norms_img(i,j)>= 0.5 && Norms_img(i,j)<=1)
                count_bottom = count_bottom + 1;
            end
            end
        end
   end

    %count_bottom = 0;


    count_top = 0; % top sided ROI's high probability values covered area calculation %
    for i=(x-delta):(x-delta+Crop_img_size)
        for j=y:(y+Crop_img_size)
            if((i>=1 && i<=r) && (j>=1 && j<=c))
            if(Norms_img(i,j)>= 0.5 && Norms_img(i,j)<=1)
                count_top = count_top + 1;
            end
            end
        end
    end

    count_left = 0; % left sided ROI's high probability values covered area calculation %
    for i=x:(x+Crop_img_size)
        for j=(y-delta):(y-delta+Crop_img_size)
            if((i>=1 && i<=r) && (j>=1 && j<=c))
            if(Norms_img(i,j)>= 0.5 && Norms_img(i,j)<=1)
               count_left = count_left + 1;
            end
            end
        end
    end

    count_right = 0; % right sided ROI's high probability values covered area calculation %
    for i=x:(x+Crop_img_size)
        for j=(y+delta):(y+delta+Crop_img_size)
            if((i>=1 && i<=r) && (j>=1 && j<=c))
            if(Norms_img(i,j)>= 0.5 && Norms_img(i,j)<=1)
               count_right = count_right + 1;
            end
            end
        end
    end

    count =0; % Centre ROI's high probability values covered area calculation %
    for i=x:(x+Crop_img_size)
        for j=y:(y+Crop_img_size)
            if((i>=1 && i<=r) && (j>=1 && j<=c))
            if(Norms_img(i,j)>= 0.5 && Norms_img(i,j)<=1)
               count = count + 1; 
            end
            end
        end
    end
    Area = (Crop_img_size*Crop_img_size);
    percent_left = (count_left/ Area)*100 ;
    percent_right = (count_right/Area)*100;
    percent_top =(count_top/Area)*100;
    percent_bottom = (count_bottom/Area)*100;
    percent_middle = (count/Area)*100;

    if (percent_left >= 30 )
        im_left = imcrop(Original_im,[(y-delta) x 255 255]);
        disp('Left ');
        if  (isempty(imgArray) == 1)
            imgArray{index} = im_left;
        elseif (isequal(im_left,imgArray{1,index})==1)
          index = index;
        else 
          index = index +1 ;
          imgArray{index} = im_left;
        end   
     %imgArray{index} = im_left; % Store Img into Stack %
     %index = index + 1;
     %figure(); imshow(im_left);
     %imwrite(im_left,['/media/nibaran/storage/Soumyajyoti/mask new/Result/Untitled Folder/',int2str(p),'.jpg']);
      %p = p+1;
    end
    if (percent_top >= 30 )
        im_top = imcrop(Original_im,[y (x-delta) 255 255]);
        if  (isempty(imgArray) == 1)
            imgArray{index} = im_top;
        elseif (isequal(im_top,imgArray{1,index})==1)
                index = index;
        else
              disp('top');
              index = index +1 ;
              imgArray{index} = im_top;
        end   
    
     %index = index + 1;
     %figure(); imshow(im_top);
     %imwrite(im_top,['/media/nibaran/storage/Soumyajyoti/mask new/Result/Untitled Folder/',int2str(p),'.jpg']);
        %p = p+1;
  end
  if (percent_bottom >= 30 )
     im_bottom = imcrop(Original_im,[y (x+delta)  255 255]);
     disp('bottom');
     if  (isempty(imgArray) == 1)
         imgArray{index} = im_bottom;
     elseif (isequal(im_bottom,imgArray{1,index})==1)
          index = index;
      else
        
         index = index +1 ;
         imgArray{index} = im_bottom;
         
      end   
%      imgArray{index} = im_bottom;
%      index =  index + 1;
    % imwrite(im_bobttom,['/media/nibaran/storage/Soumyajyoti/mask new/Result/Untitled Folder/',int2str(p),'.jpg']);
      %p = p+1;
    % figure(); imshow(im_bottom);
  end
  if (percent_right >= 30 )
     im_right = imcrop(Original_im,[(y+delta) x 255 255]);
     disp('im_right');
     %imgArray{index} = im_right;
     %index = index + 1;
     if  (isempty(imgArray) == 1)
         imgArray{index} = im_right;
     elseif (isequal(im_right,imgArray{1,index})==1)
          index = index;
     else
        
         index = index +1 ;
         imgArray{index} = im_right;
         
      end   
     %figure(); imshow(im_right);
     %imwrite(im_right,['/media/nibartopan/storage/Soumyajyoti/mask new/Result/Untitled Folder/',int2str(p),'.jpg']);
     %p = p+1; im_top = imcrop(Original_im,[y (x-delta) 255 255]);
  end
  if(percent_middle >=30)
      im_middle = imcrop(Original_im,[y x 255 255]);
      disp('im_middle');
%       imgArray{index} = im_middle;
%       index = index + 1;
    if  (isempty(imgArray) == 1)
         imgArray{index} = im_middle;
    elseif (isequal(im_middle,imgArray{1,index})==1)
          index = index;
    else
         index = index +1 ;
         imgArray{index} = im_middle;
         
      end   
      %figure();imshow(im_middle);
      %imwrite(im_middle,['/media/nibaran/storage/Soumyajyoti/mask new/Result/Untitled Folder/',int2str(p),'.jpg']);
      %p=p+1;
  end
     
     
  len = len - 1;
  disp('end loop');
    end
end
[Au, idx ,idx2] = uniquecell(imgArray); 

% Save the Cropped portion from Stack %
[rr cc]=size(Au);
p=0;
for i=1:cc
    [u v w]=size(Au{1,i});
    if(u ==256 && v==256 )
       imwrite(Au{1,i},[path,fname,'.',int2str(p),'.png']);
       p=p+1;
    end
end
% toc
