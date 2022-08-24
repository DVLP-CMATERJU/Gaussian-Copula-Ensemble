    ## author: Soumyajyoti ##
    ## Image wise number of ROIs count ##

datapath=['/Dataset_name/Original/Test/Benign/'];
datapath1 = ['/Dataset_name/ROI/Test/Benign/'];
	fileArray = dir(strcat(datapath,'/*.png'));
	fileArray1 = dir(strcat(datapath1,'/*.png'));
	for idx=1:length(fileArray)
	    fileNm = strcat(datapath,'/',fileArray(idx).name);
	    [filepath,name,ext] = fileparts(fileNm);
        count_roi=0;
	    for id=1:length(fileArray1)
	      fileNm1 = strcat(datapath1,'/',fileArray1(id).name);
	      img = imread(fileNm1);
	      [filepath,name1,ext] = fileparts(fileNm1);
          
	      part = strsplit(name1,'.');
	      Nm = part{1,1};
	      if (isequal(Nm,name)==1)
              count_roi=count_roi+1;
             
		 
	      end
        end
        gt(idx,1)=idx;
        gt(idx,2)=count_roi;
    end
    

    x=length(fileArray);
datapath=['/Dataset_name/Original/Test/Malignant/'];
datapath1 = ['/Dataset_name/ROI/Test/Malignant/'];
	fileArray = dir(strcat(datapath,'/*.png'));
	fileArray1 = dir(strcat(datapath1,'/*.png'));
	for idx=1:length(fileArray)
	    fileNm = strcat(datapath,'/',fileArray(idx).name);
	    [filepath,name,ext] = fileparts(fileNm);
        count_roi=0;
	    for id=1:length(fileArray1)
	      fileNm1 = strcat(datapath1,'/',fileArray1(id).name);
	      img = imread(fileNm1);
	      [filepath,name1,ext] = fileparts(fileNm1);
          
	      part = strsplit(name1,'.');
	      Nm = part{1,1};
	      if (isequal(Nm,name)==1)
              count_roi=count_roi+1;
            
		 
	      end
        end
        gt(idx+x,1)=idx+x;
        gt(idx+x,2)=count_roi;
    end
    
    
    
 save('./count.mat','gt');
    
