%for k=1:5
clear;
k=5

c1=load(['/home/aritra/Desktop/resultH/dense161fold_',num2str(k),'.mat']);
c1=c1.prediction_m;
c2=load(['/home/aritra/Desktop/resultH/inceptionfold_',num2str(k),'.mat']);
c2=c2.prediction_m;
c3=load(['/home/aritra/Desktop/resultH/res34fold_',num2str(k),'.mat']);
c3=c3.prediction_m;
data_B=['/media/aritra/STORAGE1/soumyajyoti/Project_ROI/ROI_breakhis/Original/fold_five/fold_',num2str(k),'/test/B'];
data_M=['/media/aritra/STORAGE1/soumyajyoti/Project_ROI/ROI_breakhis/Original/fold_five/fold_',num2str(k),'/test/M'];
no_B = dir(strcat(data_B,'/*.png'));
no_M = dir(strcat(data_M,'/*.png'));
b=length(no_B);
m=length(no_M);
t=b+m;

for i=1:t
    predict(i,1)=i;
    predict(i,2)=(c1(i,2)+c2(i,2)+c3(i,2))/3;
    predict(i,3)=(c1(i,3)+c2(i,3)+c3(i,3))/3;
end

for i=1:t
    if(predict(i,2)>predict(i,3))
        label(i)=1;
    else
        label(i)=2;
    end
end
label=label';

for i=1:b
    org(i)=1;
end
for i=b+1:t
    org(i)=2;
end
org=org';
count=0;
for i=1:t
    if(label(i,1)==org(i,1))
        count=count+1;
    end
end
disp(['Accuracy for fold',num2str(k),'==='])
accuracy=(count/t)*100
%end

    