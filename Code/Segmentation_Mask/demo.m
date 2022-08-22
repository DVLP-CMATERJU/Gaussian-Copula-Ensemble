    datapath=["Data Path"];
    fileArray = dir(strcat(datapath,'/*.jpg'));
    for idx=1:length(fileArray)
        fileNm = strcat(datapath,'/',fileArray(idx).name);
        [filepath,name,ext] = fileparts(fileNm);

        im=imread(fileNm);
        seg=main_driver(im);
        

        imwrite(seg,['[save_path for store Mask Image]/',name,'.jpg']);

    end
    
