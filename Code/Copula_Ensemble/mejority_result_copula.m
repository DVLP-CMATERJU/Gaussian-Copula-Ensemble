
function [ acc] =mejority_result_copula( predict,predict_o,no_testdata_original,no_B_roi,no_B,no_M,p)

datapath=['/Dataset_name/Original/Test/Benign/'];
datapath1 = ['/Dataset_name/ROI/Test/Benign/'];
fileArray = dir(strcat(datapath,'/*.png'));
fileArray1 = dir(strcat(datapath1,'/*.png'));
for idx=1:length(fileArray)
    fileNm = strcat(datapath,'/',fileArray(idx).name);
    [filepath,name,ext] = fileparts(fileNm);

    count_B=0;
    count_M=0;
    for id=1:length(fileArray1)
      fileNm1 = strcat(datapath1,'/',fileArray1(id).name);
      img = imread(fileNm1);
      [filepath,name1,ext] = fileparts(fileNm1);
      part = strsplit(name1,'.');
      Nm = part{1,1};
      if (isequal(Nm,name)==1)

         
          x=predict(id,1);
          if(x==1)
             count_B=count_B+1;
          elseif(x==2)
             count_M=count_M+1;
          end
      
      end
    end
    result(idx,1)= idx;
    result(idx,2)=count_B;
    result(idx,3)=count_M;
end

datapath=['/Dataset_name/Original/Test/Malignant/'];
datapath1 = ['/Dataset_name/ROI/Test/Malignant/'];
fileArray = dir(strcat(datapath,'/*.png'));
fileArray1 = dir(strcat(datapath1,'/*.png'));
for idx=1:length(fileArray)
    fileNm = strcat(datapath,'/',fileArray(idx).name);
    [filepath,name,ext] = fileparts(fileNm);

    count_B=0;
    count_M=0;
    for id=1:length(fileArray1)
      fileNm1 = strcat(datapath1,'/',fileArray1(id).name);
      img = imread(fileNm1);
      [filepath,name1,ext] = fileparts(fileNm1);
      part = strsplit(name1,'.');
      Nm = part{1,1};
      if (isequal(Nm,name)==1)

          s=id+no_B_roi;
          x=predict(s,1);
          if(x==1)
          count_B=count_B+1;
          elseif(x==2)
          count_M=count_M+1;
          end
      
      end
    end
    result(idx+no_B,1)= idx+no_B;
    result(idx+no_B,2)=count_B;
    result(idx+no_B,3)=count_M;
end

model=load(["./count.mat"]); ## The .mat file where you have saved image wise ROIs count. Run count.m File ## 
gt=model.gt;

acc=predicte(result,gt,predict_o,no_testdata_original,no_B,no_M,p);


end
