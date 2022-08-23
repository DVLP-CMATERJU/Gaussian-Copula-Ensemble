    model1=''  #Inpur Model 1#
    model2=''  #Input Model 2#
    p=30 ## ROI Voting Percentage ##
    data_B_roi=['/Dataset_name/ROI/Test/Benign/'];  %Path of Benign ROIs from Test Set%
    data_M_roi=['/Dataset_name/ROI/Test/Malignant/']; %Path of Malignant ROIs from Test Set%
    data_B=['/Dataset_name/Original/Test/Benign/']; %Path of Original Benign Data from Test Set%
    data_M=['/Dataset_name/Original/Test/Malignant/'];%Path of Original Benign Data from Test Set%
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
    predict=new_copula_roi(model1,model2,no_testdata_roi);
    predict_o=new_copula_org(model1,model2,no_testdata_original);
    mejority_result_copula( predict,predict_o,no_testdata_original,no_B_roi,no_B,no_M,p);
    
