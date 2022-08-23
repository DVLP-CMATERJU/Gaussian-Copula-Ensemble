function [accuracy]= new_copula_org(classifier1,classifier2,classifier3,f,no_test_data)
%%clear all;
%disp('------------------Copula_cal------------')
data={'train','test'};
% Data={'roi','original'};
% class={'B','M'};
% classifier1_train = csvread(['/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/bestModel/final/probability_distribution/',classifier1,'_',data{:,1},'.csv']);
% classifier1_test = csvread(['/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/bestModel/final/probability_distribution/',classifier1,'_',data{:,2},'.csv']);
% classifier2_train = csvread(['/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/bestModel/final/probability_distribution/',classifier2,'_',data{:,1},'.csv']);
% classifier2_test =csvread(['/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/bestModel/final/probability_distribution/',classifier2,'_',data{:,2},'.csv']);
% classifier3_train = csvread(['/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/bestModel/final/probability_distribution/',classifier3,'_',data{:,1},'.csv']);
% classifier3_test = csvread(['/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/bestModel/final/probability_distribution/',classifier3,'_',data{:,2},'.csv']);
% classifier4_train = csvread(['/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/bestModel/final/probability_distribution/',classifier4,'_',data{:,1},'.csv']);
% classifier4_test = csvread(['/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/bestModel/final/probability_distribution/',classifier4,'_',data{:,2},'.csv']);
% classifier5_train = csvread(['/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/bestModel/final/probability_distribution/',classifier5,'_',data{:,1},'.csv']);
% classifier5_test = csvread(['/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/bestModel/final/probability_distribution/',classifier5,'_',data{:,2},'.csv']);
% classifier6_train = csvread(['/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/bestModel/final/probability_distribution/',classifier6,'_',data{:,1},'.csv']);
% classifier6_test = csvread(['/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/bestModel/final/probability_distribution/',classifier6,'_',data{:,2},'.csv']);
% classifier7_train = csvread(['/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/bestModel/final/probability_distribution/',classifier7,'_',data{:,1},'.csv']);
% classifier7_test = csvread(['/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/bestModel/final/probability_distribution/',classifier7,'_',data{:,2},'.csv']);
% classifier3_train = csvread('/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/bestModel/final/inception_train.csv');
% classifier3_test = csvread('/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/bestModel/final/inception_test.csv');
% classifier3_train = csvread('/media/nibaran/Current Projects/Projects/soumyajyoti/copula/res18.csv');
% classifier3_test = csvread('/media/nibaran/Current Projects/Projects/soumyajyoti/copula/res18_test.csv');
% classifier1_train = csvread(classifier1_train);
% classifier1_test = csvread(classifier1_test);
% classifier2_train = csvread(classifier2_train);
% classifier2_test = csvread(classifier2_test);
root='/media/aritra/STORAGE1/soumyajyotiFNAC/Project_ROI/ROI_breakhis/Original/prob_new/';
classifier1_test_benign=csvread([root,data{:,2},'_',classifier1,'_original_fold',num2str(f),'_B','.csv']);
classifier1_test_malignant=csvread([root,data{:,2},'_',classifier1,'_original_fold',num2str(f),'_M','.csv']);
classifier1_train_benign=csvread([root,data{:,1},'_',classifier1,'_original_fold',num2str(f),'_B','.csv']);
classifier1_train_malignant=csvread([root,data{:,1},'_',classifier1,'_original_fold',num2str(f),'_M','.csv']);
classifier2_test_benign=csvread([root,data{:,2},'_',classifier2,'_original_fold',num2str(f),'_B','.csv']);
classifier2_test_malignant=csvread([root,data{:,2},'_',classifier2,'_original_fold',num2str(f),'_M','.csv']);
classifier2_train_benign=csvread([root,data{:,1},'_',classifier2,'_original_fold',num2str(f),'_B','.csv']);
classifier2_train_malignant=csvread([root,data{:,1},'_',classifier2,'_original_fold',num2str(f),'_M','.csv']);
classifier3_test_benign=csvread([root,data{:,2},'_',classifier3,'_original_fold',num2str(f),'_B','.csv']);
classifier3_test_malignant=csvread([root,data{:,2},'_',classifier3,'_original_fold',num2str(f),'_M','.csv']);
classifier3_train_benign=csvread([root,data{:,1},'_',classifier3,'_original_fold',num2str(f),'_B','.csv']);
classifier3_train_malignant=csvread([root,data{:,1},'_',classifier3,'_original_fold',num2str(f),'_M','.csv']);

% classifier3_test_benign=classifier3_test(:,1);
% classifier3_test_malignant=classifier3_test(:,2);
% classifier3_train_benign=classifier3_train(:,1);
% classifier3_train_malignant=classifier3_train(:,2);
x=classifier1_train_benign;% Store Training Samples's Prob Val of Class 1 with respect to Classifier 1%
y=classifier2_train_benign;% Store Training Samples's Prob Val of Class 1 with respect to Classifier 2%
p=classifier3_train_benign;
% q=classifier4_train_benign;
% r=classifier5_train_benign;
% s=classifier6_train_benign;
% t=classifier7_train_benign;
% z=classifier3_train_benign;% Store Training Samples's Prob Val of Class 1 with respect to Classifier 3%
% x_beta=betafit(x);  % Calculation of values of a,b of Bita Distribution of Class1(Classifier 1) %
% y_beta=betafit(y);  % Calculation of values of a,b of Bita Distribution of Class1(Classifier 2) %
% z_beta=betafit(z);  % Calculation of values of a,b of Bita Distribution of Class1(Classifier 3) %
% u=betacdf(x,x_beta(1),x_beta(2));% Calculate cumulative distributions  [Bita Distribution] Class1(Classifier 1)%
% v=betacdf(y,y_beta(1),y_beta(2));% Calculate cumulative distributions  [Bita Distribution] Class1(Classifier 2)%
% w=betacdf(z,z_beta(1),z_beta(2));% Calculate cumulative distributions  [Bita Distribution] Class1(Classifier 3)%
u=ksdensity(x,x,'function','cdf');
v=ksdensity(y,y,'function','cdf');
w=ksdensity(p,p,'function','cdf');
% n=ksdensity(q,q,'function','cdf');prob
% k=ksdensity(r,r,'function','cdf');
% l=ksdensity(s,s,'function','cdf');
% f=ksdensity(t,t,'function','cdf');
% w=ksdensity(z,z,'function','cdf');
copula_class1 = [u v w]; 
% copula_class1 = [u v];
% [r c] = size(copula_class1);
% for i=1:r
%      for j=1:c
%          if(copula_class1(i,j)== 0)
%             copula_class1(i,j) = copula_class1(i,j)+0.0001;     % Normalized cdf for [0,1] for class 1 %
%          elseif(copula_class1(i,j)== 1)
%                  copula_class1(i,j) = copula_class1(i,j) - 0.0001;
%          end
%          end
%  end
% f_x=betapdf(x,x_beta(1),x_beta(2)) 
% f_y=betapdf(y,y_beta(1),y_beta(2))
rho=copulafit('Gaussian',copula_class1);
%[rho,nu] = copulafit('t',copula_class1,'Method','ApproximateML')% Calculate Estimation Values of cdf's of  Classifiers By fitting Copula %
xx_test=classifier1_test_benign;  % Store Testing Samples's Prob Val of Class 1 with respect to Classifier 1%
yy_test=classifier2_test_benign; % Store Testing Samples's Prob Val of Class 1 with respect to Classifier 2%
zz_test=classifier3_test_benign; % Store Testing Samples's Prob Val of Class 1 with respect to Classifier 2%
% qq_test=classifier4_test_benign; % Store Testing Samples's Prob Val of Class 1 with respect to Classifier 2%
% kk_test=classifier5_test_benign;
% ll_test=classifier6_test_benign;
% mm_test=classifier7_test_benign;
% zz_test =classifier3_test_benign; % Store Testing Samples's Prob Val of Class 1 with respect to Classifier 3%
x_test=ksdensity(xx_test,xx_test,'function','cdf');
y_test=ksdensity(yy_test,yy_test,'function','cdf');
z_test=ksdensity(zz_test,zz_test,'function','cdf');
% n_test=ksdensity(qq_test,qq_test,'function','cdf');
% i_test=ksdensity(kk_test,kk_test,'function','cdf');
% j_test=ksdensity(ll_test,ll_test,'function','cdf');
% l_test=ksdensity(mm_test,mm_test,'function','cdf');
% z_test=ksdensity(zz_test,zz_test,'function','cdf');
% cl= copulapdf('Gaussian',[x_test y_test z_test], rho);
cl= copulapdf('Gaussian',[x_test y_test z_test], rho);
% cl= copulapdf('Gaussian',[x_test y_test], rho);
% cl = copulapdf('t',[x_test y_test z_test],rho,nu);
% f=ksdensity(x_test,x_test,'function','pdf');
% g=ksdensity(y_test,y_test,'function','pdf');
% h=ksdensity(z_test,z_test,'function','pdf');
c = cl.*xx_test.*yy_test.*zz_test.*0.5;
% c = cl.*xx_test.*yy_test.*0.5;


x1=classifier1_train_malignant;  % Store Training Samples's Prob Val of Class 2 with respect to Classifier 1%
y1=classifier2_train_malignant;% Store Training Samples's Prob Val of Class 2 with respect to Classifier 2%
p1=classifier3_train_malignant;
% q1=classifier4_train_malignant;
% k1=classifier5_train_malignant;
% l1=classifier6_train_malignant;
% d1=classifier7_train_malignant;
% z1=classifier3_train_malignant;  % Store Training Samples's Prob Val of Class 2 with respect to Classifier 3%
% x1_beta=betafit(x1);  % Calculation of values of a,b of Bita Distribution of Class2(Classifier 1) %
% y1_beta=betafit(y1);  % Calculation of values of a,b of Bita Distribution of Class2(Classifier 2) %
% z1_beta=betafit(z1);  % Calculation of values of a,b of Bita Distribution of Class2(Classifier 3) %

u1=ksdensity(x1,x1,'function','cdf');
v1=ksdensity(y1,y1,'function','cdf');
w1=ksdensity(p1,p1,'function','cdf');
% n1=ksdensity(q1,q1,'function','cdf');
% i1=ksdensity(k1,k1,'function','cdf');
% j1=ksdensity(l1,l1,'function','cdf');
% a1=ksdensity(d1,d1,'function','cdf');
% w1=ksdensity(z1,z1,'function','cdf');

copula_class2 = [u1 v1 w1]; 
% copula_class2 = [u1 v1]; 

rho1=copulafit('Gaussian',copula_class2);

% [rho1,nu1] = copulafit('t',copula_class2,'Method','ApproximateML')% Calculate Estimation Values of cdf's of both Classifiers By fitting Copula %
xx1_test=classifier1_test_malignant; % Store Testing Samples's Prob Val of Class 2 with respect to Classifier 1%
yy1_test=classifier2_test_malignant; % Store Testing Samples's Prob Val of Class 2 with respect to Classifier 2%
pp1_test=classifier3_test_malignant;
% qq1_test=classifier4_test_malignant;
% ii1_test=classifier5_test_malignant;
% jj1_test=classifier6_test_malignant;
% aa1_test=classifier7_test_malignant;
% zz1_test=classifier3_test_malignant; % Store Testing Samples's Prob Val of Class 2 with respect to Classifier 3%
x1_test=ksdensity(xx1_test,xx1_test,'function','cdf');
y1_test=ksdensity(yy1_test,yy1_test,'function','cdf');
z1_test=ksdensity(pp1_test,pp1_test,'function','cdf');
% n1_test=ksdensity(qq1_test,qq1_test,'function','cdf');
% z1_test=ksdensity(ii1_test,ii1_test,'function','cdf');
% k1_test=ksdensity(jj1_test,jj1_test,'function','cdf');
% e1_test=ksdensity(aa1_test,aa1_test,'function','cdf');
cl1= copulapdf('Gaussian',[x1_test y1_test z1_test], rho1);
% cl1= copulapdf('Gaussian',[x1_test y1_test], rho1);
% cl1= copulapdf('Gaussian',[x1_test y1_test], rho1);
% cl1 = copulapdf('t',[x1_test y1_test z1_test],rho1,nu1);
% f1=ksdensity(x1_test,x1_test,'function','pdf');
% g1=ksdensity(y1_test,y1_test,'function','pdf');
% h1=ksdensity(z1_test,z1_test,'function','pdf');
c1 = cl1.*xx1_test.*yy1_test.*pp1_test.*0.5;
% c1 = cl1.*xx1_test.*yy1_test.*0.5;
% m1=sum(c);
% for i=1:120
%    b1(i,:) = c(i,:)/m1;
% end
% 
% m2=sum(c1);
% for i=1:120
%    b2(i,:) = c1(i,:)/m2;
% end
m1=sum(c);
m2=sum(c1);
b1=(c/m1);
b2=(c1/m2);

% predicted classes after copula fusion 1:Benign 2:Malignant
for i=1:no_test_data
    if (b1(i,:)> b2(i,:)) 
        correct(i,:)=1;
  
    else correct(i,:)=2;
    end
end

% ground truth classes of test samples
for j=1:no_B
correct1(j,:)=1;
end
for j=no_B+1:no_test_data
correct1(j,:)=2;
end


% accuracy calculation
count=0;
for i=1:no_test_data
    if (correct(i,:)==correct1(i,:))
        count=count+1;
    end
end
accuracy = (count/no_test_data)*100;


