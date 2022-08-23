function [correct]= new_copula_roi(classifier1,classifier2,no_test_roi)

root='./Probability/'; # Root Path where the probability values will be stored#
classifier1_test_benign=csvread([root,classifier1,'_','ROI_test','_B.csv']);
classifier1_test_malignant=csvread([root,classifier1,'_','ROI_test','_M.csv']);
classifier1_train_benign=csvread([root,classifier1,'_','ROI_train','_B.csv']);
classifier1_train_malignant=csvread([root,classifier1,'_','ROI_train','_M.csv']);

classifier2_test_benign=csvread([root,classifier2,'_','ROI_test','_B.csv']);
classifier2_test_malignant=csvread([root,classifier2,'_','ROI_test','_M.csv']);
classifier2_train_benign=csvread([root,classifier2,'_','ROI_train','_B.csv']);
classifier2_train_malignant=csvread([root,classifier2,'_','ROI_train','_M.csv']);


x=classifier1_train_benign;% Store Training Samples's Prob Val of Class 1 with respect to Classifier 1%
y=classifier2_train_benign;% Store Training Samples's Prob Val of Class 1 with respect to Classifier 2%

u=ksdensity(x,x,'function','cdf');
v=ksdensity(y,y,'function','cdf');

copula_class1 = [u v]; 

rho=copulafit('Gaussian',copula_class1);

xx_test=classifier1_test_benign;  % Store Testing Samples's Prob Val of Class 1 with respect to Classifier 1%
yy_test=classifier2_test_benign; % Store Testing Samples's Prob Val of Class 1 with respect to Classifier 2%

x_test=ksdensity(xx_test,xx_test,'function','cdf');
y_test=ksdensity(yy_test,yy_test,'function','cdf');

cl= copulapdf('Gaussian',[x_test y_test], rho);

c = cl.*xx_test.*yy_test.*0.5;



x1=classifier1_train_malignant;  % Store Training Samples's Prob Val of Class 2 with respect to Classifier 1%
y1=classifier2_train_malignant;% Store Training Samples's Prob Val of Class 2 with respect to Classifier 2%


u1=ksdensity(x1,x1,'function','cdf');
v1=ksdensity(y1,y1,'function','cdf');

copula_class2 = [u1 v1]; 

rho1=copulafit('Gaussian',copula_class2);


xx1_test=classifier1_test_malignant; % Store Testing Samples's Prob Val of Class 2 with respect to Classifier 1%
yy1_test=classifier2_test_malignant; % Store Testing Samples's Prob Val of Class 2 with respect to Classifier 2%

x1_test=ksdensity(xx1_test,xx1_test,'function','cdf');
y1_test=ksdensity(yy1_test,yy1_test,'function','cdf');

cl1= copulapdf('Gaussian',[x1_test y1_test], rho1);

c1 = cl1.*xx1_test.*yy1_test.*0.5;

m1=sum(c);
m2=sum(c1);
b1=(c/m1);
b2=(c1/m2);


% predicted classes after copula fusion 1:Benign 2:Malignant
for i=1:no_test_roi
    if (b1(i,:)> b2(i,:)) 
        correct(i,:)=1;
  
    else correct(i,:)=2;
    end
end


end
