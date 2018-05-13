clc;clear
load('new_avg2.mat');
load('new_avg6.mat');
X=[new_avg2;new_avg6];
X(1:50,end+1)=0;
X(51:100,end)=1;
rand('seed',34);
randind=randperm(size(X,1));
train_data=X(randind(1:80),:);
train_label=train_data(:,end);

test_data=X(randind(81:100),:);
test_label=test_data(:,end);


model=fitcsvm(train_data,train_label);
pred_label=predict(model,test_data);
con_mat=confusionmat(test_label,pred_label)


load ionosphere
resp = strcmp(Y,'b'); % resp = 1, if Y = 'b', or 0 if Y = 'g'
pred = X(:,3:34);
mdlSVM = fitcsvm(pred,resp,'Standardize',true);
mdlSVM = fitPosterior(mdlSVM);
[~,score_svm] = resubPredict(mdlSVM);
score=score_svm(:,mdlSVM.ClassNames);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(resp,score,'true');


