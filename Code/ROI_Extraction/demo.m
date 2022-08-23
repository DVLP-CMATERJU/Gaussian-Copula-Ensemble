
   
   ROI_path='/Dataset_Name/ROI/''[Path for saving Extracted ROIs]'
    if not(isfolder(ROI_path))

       mkdir(ROI_path)
   end
    
    datapath_image=["RGB Image Path"];
    datapath_mask=["Superimposed Mask Path"];
    fileArray = dir(strcat(datapath_image,'/*.jpg'));
    fileArray1 = dir(strcat(datapath_mask,'/*.png'));
    for idx=1:length(fileArray)
      fileNm = strcat(datapath_image,'/',fileArray(idx).name);
      fileNm1 = strcat(datapath_mask,'/',fileArray1(idx).name);
      [filepath,name,ext] = fileparts(fileNm);
      disp([fileNm,fileNm1])
      crop_New(fileNm1,fileNm,ROI_path); 
    end
    
