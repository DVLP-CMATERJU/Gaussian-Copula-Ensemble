% datapath='/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/Dataset/MajorityVote/RGB/val/M'
% fileArray = dir(strcat(datapath,'/*.JPG'));
% for idx=1:length(fileArray)
% fileNm = strcat(datapath,'/',fileArray(idx).name);
% [filepath,name,ext] = fileparts(fileNm);
% im=imread(fileNm);
% imwrite(im,['/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/Dataset/MajorityVote/RGB/val/',name,'.jpg']);
% end


datapath='/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/Dataset/MajorityVote/RGB/test/B';
datapath1 = '/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/Dataset/MajorityVote/MV/test/B';
fileArray = dir(strcat(datapath,'/*.jpg'));
fileArray1 = dir(strcat(datapath1,'/*.jpg'));
for idx=1:length(fileArray)
    fileNm = strcat(datapath,'/',fileArray(idx).name);
    [filepath,name,ext] = fileparts(fileNm);
     
    count_roii=0;
    
    for id=1:length(fileArray1)
      fileNm1 = strcat(datapath1,'/',fileArray1(id).name);
      img = imread(fileNm1);
      [filepath,name1,ext] = fileparts(fileNm1);
      part = strsplit(name1,'.');
      Nm = part{1,1};
      if (isequal(Nm,name)==1)
           count_roii=count_roii+1;
         
      end
    end
    result(idx,1)= idx;
    result(idx,2)=count_roii;
end

datapath='/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/Dataset/MajorityVote/RGB/test/M';
datapath1 = '/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/Dataset/MajorityVote/MV/test/M';
fileArray = dir(strcat(datapath,'/*.jpg'));
fileArray1 = dir(strcat(datapath1,'/*.jpg'));
for idx=1:length(fileArray)
    fileNm = strcat(datapath,'/',fileArray(idx).name);
    [filepath,name,ext] = fileparts(fileNm);
     
    count_roii=0;
    
    for id=1:length(fileArray1)
      fileNm1 = strcat(datapath1,'/',fileArray1(id).name);
      img = imread(fileNm1);
      [filepath,name1,ext] = fileparts(fileNm1);
      part = strsplit(name1,'.');
      Nm = part{1,1};
      if (isequal(Nm,name)==1)
           count_roii=count_roii+1;
         
      end
    end
    result(idx+13,1)= idx+13;
    result(idx+13,2)=count_roii;
end
