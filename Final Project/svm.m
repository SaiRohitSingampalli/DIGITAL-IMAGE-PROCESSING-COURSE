features = 'C:\Users\Sai\Documents\MATLAB\DIP PROJECT\features\';

load('new_avg1.mat');
load('new_avg5.mat');
% load('new_avg8.mat');
% load('new_avg8.mat');
% load('new_avg8.mat');
% load('new_avg8.mat');
% load('new_avg8.mat');
% load('new_avg8.mat');
X = zeros(400,343);
Y = ones(1,400);

for i=1:1:200
    for j=1:343
        X(i,j)=new_avg1(i,j);
        X(i+200,j)=new_avg5(i,j);
    end
end

for i = 1:1:200
    Y(1,i)=0;
end

SVMStruct = svmtrain(X,Y,'kernel_function','rbf');
PC1 = svmclassify(SVMStruct, Rc1(2:2:length(pathcset1),:));
PC2 = svmclassify(SVMStruct, Rc2(2:2:length(pathcset2),:));+--------------------------------
