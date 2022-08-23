% % for i=1:5
%     datapath='/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/Dataset/New_FNAC_data/original/test/B';
% 	%datapath1 = ['/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/ROI_breakhis/Original/fold_five_roi/fold_',num2str(i),'/test/B'];
%     datapath1='/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/Dataset/New_FNAC_data/ROI/test/B';
% 	fileArray = dir(strcat(datapath,'/*.jpg'));
% 	fileArray1 = dir(strcat(datapath1,'/*.jpg'));
% 	for idx=1:length(fileArray)
% 	    fileNm = strcat(datapath,'/',fileArray(idx).name);
% 	    [filepath,name,ext] = fileparts(fileNm);
%         %count_roi=0;
% 	    for id=1:length(fileArray1)
% 	      fileNm1 = strcat(datapath1,'/',fileArray1(id).name);
% 	      img = imread(fileNm1);
% 	      [filepath,name1,ext] = fileparts(fileNm1);
%           
% 	      part = strsplit(name1,'.');
% 	      Nm = part{1,1};
% 	      if (isequal(Nm,name)==1)
%               %count_roi=count_roi+1;
%               %imwrite(img,['/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/FNAC_fold/fold_roi/fold_',num2str(i),'/train/B/',name1,'.jpg']);
% 		 
% 	      end
%         end
%        
%     end
%     
% 
%     
%     datapath=['/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/FNAC_fold/fold_original/fold',num2str(i),'/train/M'];
% 	%datapath1 = ['/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/ROI_breakhis/Original/fold_five_roi/fold_',num2str(i),'/test/M'];
%     datapath1='/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/Dataset/ROIs/automatedROI/2';
% 	fileArray = dir(strcat(datapath,'/*.jpg'));
% 	fileArray1 = dir(strcat(datapath1,'/*.jpg'));
% 	for idx=1:length(fileArray)
% 	    fileNm = strcat(datapath,'/',fileArray(idx).name);
% 	    [filepath,name,ext] = fileparts(fileNm);
%         %count_roi=0;
% 	    for id=1:length(fileArray1)
% 	      fileNm1 = strcat(datapath1,'/',fileArray1(id).name);
% 	      img = imread(fileNm1);
% 	      [filepath,name1,ext] = fileparts(fileNm1);
%           
% 	      part = strsplit(name1,'.');
% 	      Nm = part{1,1};
% 	      if (isequal(Nm,name)==1)
%               %count_roi=count_roi+1;
%               %imwrite(img,['/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/FNAC_fold/fold_roi/fold_',num2str(i),'/train/M/',name1,'.jpg']);
% 		 
% 	      end
%         end
%         
%     end
    
    datapath='/media/aritra/STORAGE1/soumyajyoti/Project_ROI/ROI_breakhis/Original/val/B';
	%datapath1 = ['/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/ROI_breakhis/Original/fold_five_roi/fold_',num2str(i),'/test/B'];
    datapath1='/media/aritra/STORAGE1/soumyajyoti/Project_ROI/ROI_breakhis/majority_voting/val/B';
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
              %imwrite(img,['/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/FNAC_fold/fold_roi/fold_',num2str(i),'/test/B/',name1,'.jpg']);
		 
	      end
        end
        gt(idx,1)=idx;
        gt(idx,2)=count_roi;
    end
    

    x=length(fileArray);
    datapath='/media/aritra/STORAGE1/soumyajyoti/Project_ROI/ROI_breakhis/Original/val/M';
	%datapath1 = ['/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/ROI_breakhis/Original/fold_five_roi/fold_',num2str(i),'/test/M'];
    datapath1='/media/aritra/STORAGE1/soumyajyoti/Project_ROI/ROI_breakhis/majority_voting/val/M';
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
              %imwrite(img,['/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/FNAC_fold/fold_roi/fold_',num2str(i),'/test/M/',name1,'.jpg']);
		 
	      end
        end
        gt(idx+x,1)=idx+x;
        gt(idx+x,2)=count_roi;
    end
    save('/media/aritra/STORAGE1/soumyajyoti/Project_ROI/ROI_breakhis/majority_voting/gt_val.mat','gt');
    %disp(['fold',num2str(i),'done'])
% end