% features = 'C:\Users\Sai\Documents\MATLAB\DIP PROJECT\features\';

load('new_avg1.mat');
load('new_avg5.mat');
% load('new_avg8.mat');
% load('new_avg8.mat');
% load('new_avg8.mat');
% load('new_avg8.mat');
% load('new_avg8.mat');
% load('new_avg8.mat');
X = zeros(80,343);
Y = zeros(80,1);

for i=1:1:40
    for j=1:343
        X(i,j)=new_avg1(i,j);
        X(i+40,j)=new_avg5(i,j);
    end
end

for i = 1:1:40
    Y(i,1)=1;
end


% SVMStruct = svmtrain(X,Y,'kernel_function','rbf');
% PC1 = svmclassify(SVMStruct,new_avg1(41:50,:));
% PC2 = svmclassify(SVMStruct, new_avg5(41:50),:));

SVMModel = fitcsvm(X,Y,'Standardize',true,'KernelFunction','RBF','KernelScale','auto');
[PC1,score1] = predict(SVMModel,new_avg1(41:50,:));
[PC2,~] = predict(SVMModel,new_avg5(41:50,:));
%[X,Y] = perfcurve(group,score1(:,2),1);
C1=confusionmat(ones(10,1),PC1);
C2=confusionmat(zeros(10,1),PC2);

