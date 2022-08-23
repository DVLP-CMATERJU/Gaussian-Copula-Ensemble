model={'dense161','res34','inception'};
%for k=1:3
    %for i=1:5
   i=4;
    data_B_roi=['/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/ROI_breakhis/Original/fold_five_roi/fold_',num2str(i),'/test/B'];
    data_M_roi=['/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/ROI_breakhis/Original/fold_five_roi/fold_',num2str(i),'/test/M'];
    data_B=['/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/ROI_breakhis/Original/fold_five/fold_',num2str(i),'/test/B'];
    data_M=['/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/ROI_breakhis/Original/fold_five/fold_',num2str(i),'/test/M'];
    no_B = dir(strcat(data_B,'/*.png'));
    no_M = dir(strcat(data_M,'/*.png'));
    no_B_roi=dir(strcat(data_B_roi,'/*.png'));
    no_M_roi=dir(strcat(data_M_roi,'/*.png'));
    no_B=length(no_B);
    no_M=length(no_M);
    no_testdata_original=no_B+no_M;
    no_B_roi=length(no_B_roi);
    no_M_roi=length(no_M_roi);
    no_testdata_roi=no_B_roi+no_M_roi;
%     B=csvread(['/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/ROI_breakhis/Original/fold_result/prob/test_',model{1,k},'_fold',num2str(i),'_B.csv']);
%     M=csvread(['/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/ROI_breakhis/Original/fold_result/prob/test_',model{1,k},'_fold',num2str(i),'_M.csv']);
%     o_B=csvread(['/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/ROI_breakhis/Original/fold_result/prob/test_',model{1,k},'_original_fold',num2str(i),'_B.csv']);
%     o_M=csvread(['/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/ROI_breakhis/Original/fold_result/prob/test_',model{1,k},'_original_fold',num2str(i),'_M.csv']);

   %disp(['fold',num2str(i),model{1,k},'Accuracy='])
    %mejority_result( B,M,o_B,o_M,no_testdata_roi,no_testdata_original,no_B_roi,no_B,no_M,i)
     predict=new_copula_roi(model{1,1},model{1,2},model{1,3},i,no_testdata_roi);
     predict_o=new_copula_org(model{1,1},model{1,2},model{1,3},i,no_testdata_original);
     disp(['fold',num2str(i),model{1,1},'Vs',model{1,2},'Vs.',model{1,3},'Accuracy='])
     acc=mejority_result_copula( predict,predict_o,no_testdata_original,no_B_roi,no_B,no_M,i);
%      predict=new_copula_roi(model{1,1},model{1,3},i,no_testdata_roi);
%      predict_o=new_copula_org(model{1,1},model{1,3},i,no_testdata_original);
%      disp(['fold',num2str(i),model{1,1},'Vs',model{1,3},'Accuracy='])
%      mejority_result_copula( predict,predict_o,no_testdata_original,no_B_roi,no_B,no_M,i);
%      predict=new_copula_roi(model{1,3},model{1,2},i,no_testdata_roi);
%      predict_o=new_copula_org(model{1,3},model{1,2},i,no_testdata_original);
%      disp(['fold',num2str(i),model{1,3},'Vs',model{1,2},'Accuracy='])
%      mejority_result_copula( predict,predict_o,no_testdata_original,no_B_roi,no_B,no_M,i);
     
   % end
%end