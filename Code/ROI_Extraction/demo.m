
   folder=["Train","Test","Validation"];
   class=["Benign","malignant"];
   for i=1:3
   for j=1:2
   ROI_path=['/Dataset_Name/ROI/',folder(i),'/',class(j),'/'] %Path for saving Extracted ROIs%
    if not(isfolder(ROI_path))

       mkdir(ROI_path)
   end
    
    datapath_image=['/Dataset_Name/Original/',folder(i),'/',class(j),'/']; %["RGB Image Path"];%
    datapath_mask=['/Dataset_Name/Mask/',folder(i),'/',class(j),'/']; %["Superimposed Mask Path"]%
    fileArray = dir(strcat(datapath_image,'/*.jpg'));
    fileArray1 = dir(strcat(datapath_mask,'/*.png'));
    for idx=1:length(fileArray)
      fileNm = strcat(datapath_image,'/',fileArray(idx).name);
      fileNm1 = strcat(datapath_mask,'/',fileArray1(idx).name);
      [filepath,name,ext] = fileparts(fileNm);
      disp([fileNm,fileNm1])
      crop_New(fileNm1,fileNm,ROI_path); 
    end
    end
    end
