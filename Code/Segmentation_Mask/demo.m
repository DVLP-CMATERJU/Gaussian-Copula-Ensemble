    datapath=["Data Path"];
    fileArray = dir(strcat(datapath,'/*.jpg'));
    for idx=1:length(fileArray)
        fileNm = strcat(datapath,'/',fileArray(idx).name);
        [filepath,name,ext] = fileparts(fileNm);

        im=imread(fileNm);
        mask=main_driver(im); ## Binay Segmentation Mask ##
        mask3 = cat(3, mask, mask, mask);
        mask3=uint8(mask3);
        seg=mask3.*255;
        superimposeMask=bitand(seg,im); ## superimpose Mask ##
        

        imwrite(superimposeMask,['[save_path for store Mask Image(Super Impose Image)]/',name,'.png']);

    end
    
