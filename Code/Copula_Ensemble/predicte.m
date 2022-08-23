function [ accuracy ] =predicte( result,gt,predict_o,no_testdata_original,no_B,no_M,p)

for i=1:no_testdata_original
    accuracy=(result(i,3)/gt(i,2))*100;
    if(accuracy>=p)
        prediction(i)=2;
    elseif (gt(i,2)==0)
        prediction(i)=predict_o(i);
            
    else  prediction(i)=1;
    end
end

prediction=prediction';

for i=1:no_B
    original(i)=1;
end
for i=no_B+1:no_testdata_original
    original(i)=2;
end
original=original';

correct=0;
for i=1:no_testdata_original
    if(prediction(i,1)==original(i,1))
        correct=correct+1;
    end
end

accuracy=(correct/no_testdata_original)*100
[c_matrix,Result]= confusion.getMatrix(original,prediction)
[X,Y,T,AUC]=perfcurve(original,prediction,2)

end        
