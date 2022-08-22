    datapath=["Data Path"];
    fileArray = dir(strcat(datapath,'/*.jpg'));
    for idx=1:length(fileArray)
        fileNm = strcat(datapath,'/',fileArray(idx).name);
        [filepath,name,ext] = fileparts(fileNm);

        im=imread(fileNm);
        seg=main_driver(im); ## Binay Segmentation Mask ##
        superimposeMask=bitand(seg,im); ## superimpose Mask ##
        

        imwrite(superimposeMask,['[save_path for store Mask Image]/',name,'.jpg']);

    end
    
