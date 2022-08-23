% function [ acc ] =mejority_result( B,M,o_B,o_M,no_testdata_roi,no_testdata_original,no_B_roi,no_B,no_M,p)
function [ acc] =mejority_result_copula( predict,predict_o,no_testdata_original,no_B_roi,no_B,no_M,p)
% B=csvread('/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/ROI_breakhis/majority_voting/prob_value/test_dense121_B.csv')
% M=csvread('/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/ROI_breakhis/majority_voting/prob_value/test_dense121_M.csv')
% y=[B M];
% y_o=[o_B o_M];
% for i=1:no_testdata_roi
%     if(y(i,1)>y(i,2))
%         final(i)=1;
%     else
%         final(i)=2;
%     end
% end
% 
% 
% for i=1:no_testdata_original
%     if(y_o(i,1)>y_o(i,2))
%         final_o(i)=1;
%     else
%         final_o(i)=2;
%     end
% end

% predict=final';
% predict_o=final_o';
datapath=['/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/ROI_breakhis/Original/fold_five/fold_',num2str(p),'/test/B'];
datapath1 = ['/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/ROI_breakhis/Original/fold_five_roi/fold_',num2str(p),'/test/B'];
fileArray = dir(strcat(datapath,'/*.png'));
fileArray1 = dir(strcat(datapath1,'/*.png'));
for idx=1:length(fileArray)
    fileNm = strcat(datapath,'/',fileArray(idx).name);
    [filepath,name,ext] = fileparts(fileNm);
%     count_roi=0;
    count_B=0;
    count_M=0;
    for id=1:length(fileArray1)
      fileNm1 = strcat(datapath1,'/',fileArray1(id).name);
      img = imread(fileNm1);
      [filepath,name1,ext] = fileparts(fileNm1);
      part = strsplit(name1,'.');
      Nm = part{1,1};
      if (isequal(Nm,name)==1)
%           count_roi=count_roi+1;
         
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

datapath=['/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/ROI_breakhis/Original/fold_five/fold_',num2str(p),'/test/M'];
datapath1 = ['/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/ROI_breakhis/Original/fold_five_roi/fold_',num2str(p),'/test/M'];
fileArray = dir(strcat(datapath,'/*.png'));
fileArray1 = dir(strcat(datapath1,'/*.png'));
for idx=1:length(fileArray)
    fileNm = strcat(datapath,'/',fileArray(idx).name);
    [filepath,name,ext] = fileparts(fileNm);
%     count_roi=0;
    count_B=0;
    count_M=0;
    for id=1:length(fileArray1)
      fileNm1 = strcat(datapath1,'/',fileArray1(id).name);
      img = imread(fileNm1);
      [filepath,name1,ext] = fileparts(fileNm1);
      part = strsplit(name1,'.');
      Nm = part{1,1};
      if (isequal(Nm,name)==1)
%           count_roi=count_roi+1;
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

model=load(['/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/ROI_breakhis/Original/fold_result/gt_fold',num2str(p),'.mat']);
gt=model.gt;

acc=predicte(result,gt,predict_o,no_testdata_original,no_B,no_M);




% datapath='/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/ROI_breakhis/Original/test/B'
% datapath1 = '/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/ROI_breakhis/majority_voting/test/B'
% fileArray = dir(strcat(datapath,'/*.png'));
% fileArray1 = dir(strcat(datapath1,'/*.png'));
% for idx=1:length(fileArray)
%     fileNm = strcat(datapath,'/',fileArray(idx).name);
%     [filepath,name,ext] = fileparts(fileNm);
%     count_roi=0;
% %     count=0;
%     for id=1:length(fileArray1)
%       fileNm1 = strcat(datapath1,'/',fileArray1(id).name);
%       img = imread(fileNm1);
%       [filepath,name1,ext] = fileparts(fileNm1);
%       part = strsplit(name1,'.');
%       Nm = part{1,1};
%       if (isequal(Nm,name)==1)
%          count_roi=count_roi+1;
%          
% %           x=predict(id,1);
% %           if(x==1)
% %           count=count+1;
% %           end
%       
%       end
%     end
%     result(idx,1)= idx;
%     result(idx,2)=count_roi;
% end
% 
% datapath='/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/ROI_breakhis/Original/test/M'
% datapath1 = '/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/ROI_breakhis/majority_voting/test/M'
% fileArray = dir(strcat(datapath,'/*.png'));
% fileArray1 = dir(strcat(datapath1,'/*.png'));
% for idx=1:length(fileArray)
%     fileNm = strcat(datapath,'/',fileArray(idx).name);
%     [filepath,name,ext] = fileparts(fileNm);
%     count_roi=0;
% %     count=0;
%     for id=1:length(fileArray1)
%       fileNm1 = strcat(datapath1,'/',fileArray1(id).name);
%       img = imread(fileNm1);
%       [filepath,name1,ext] = fileparts(fileNm1);
%       part = strsplit(name1,'.');
%       Nm = part{1,1};
%       if (isequal(Nm,name)==1)
%          count_roi=count_roi+1;
%          
% %           x=predict(id,1);
% %           if(x==1)
% %           count=count+1;
% %           end
%       
%       end
%     end
%     result(idx+115,1)= idx+115;
%     result(idx+115,2)=count_roi;
% end
end
