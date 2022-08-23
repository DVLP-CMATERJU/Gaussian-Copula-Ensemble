function [ accuracy ] =predicte( result,gt,predict_o,no_testdata_original,no_B,no_M)
%predict_o
for i=1:no_testdata_original
    accuracy=(result(i,3)/gt(i,2))*100;
    if(accuracy>=9)
        prediction(i)=2;
    elseif (gt(i,2)==0)
        prediction(i)=predict_o(i);
            
    else  prediction(i)=1;
    end
end
% for i=14:25
%     accuracy=(result(i,3)/gt(i,2))*100;
%     if(accuracy>=20)
%         prediction(i)=2;
%     elseif (gt(i,2)==0)
%         prediction(i)=predict_o(i);
%     else prediction(i)=1;
%     end
% end
prediction=prediction';
%prediction
%save('/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/ROI_breakhis/majority_voting/copula_result/prediction/inception.mat','prediction');
for i=1:no_B
    original(i)=1;
end
for i=no_B+1:no_testdata_original
    original(i)=2;
end
original=original';
%prediction
correct=0;
for i=1:no_testdata_original
    if(prediction(i,1)==original(i,1))
        correct=correct+1;
    end
end
%correct
accuracy=(correct/no_testdata_original)*100
%dlmwrite('/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/ROI_breakhis/majority_voting/accuracy.txt',accuracy);
end        
