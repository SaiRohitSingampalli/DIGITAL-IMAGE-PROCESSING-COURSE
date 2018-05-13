clc;
clear all;
%% COMPARISON BETWEEN 1.AVERAGE FITERED+JPEG70 VS MEDIAN FILTERED(MF3)+JPEG70
%                     2.GAUSSIAN FITERED+JPEG90 VS MEDIAN FILTERED IMAGE(MF3)+JPEG70                   

DType=["Original", "JPEG 90", "JPEG 70", "JPEG 50"];
% LOADING FEATURES OF MATRIX FOR ORIGINAL AND MEDIAN FILTERED IMAGES
for i=1:2

  cnt=1;
 
  if(i==1)
       load('new_avg1.mat');
      load('new_avg7.mat');
      
      X=[new_avg1;new_avg7];
  end
  if(i==2)
       load('new_avg2.mat');
      load('new_avg8.mat');
      X=[new_avg2;new_avg8];
  end

%% CREATING TRAINING FOLDER
%   puTTING LABEL 0 FOR ORIGINAL IMAGE AND LABEL 1 FOR MEDIAN FITERED IMAGE
  X(1:200,end+1)=0;
  X(201:400,end)=1;
  rand('seed',34);
%selecting a set of 180 numbers from EACH SET 1:200 AND 201:400
  z1=randperm(200,180); 
  z2=200+randperm(200,180);

  train_data=[X(z1,:);X(z2,:)];
  z1_=setdiff(1:200,z1);
  z2_=setdiff(201:400,z2);
%selecting images for testing data
  train_label=train_data(:,end);

  test_data=[X(z1_,:);X(z2_,:)];
  test_label=test_data(:,end);
%% APLLYING SVM ON TRAINING IMAGES AND TESTING THE TEST IMAGES

  model=fitcsvm(train_data,train_label);
  pred_label=predict(model,test_data);
  z=DType(i);
  fprintf('Confusion matrix for %s',z);
  confusion_mat=confusionmat(test_label,pred_label)
%% PLOTTING ROC USING PERFCURVE FOR ALL 4 COMPARISION

  load ionosphere
  resp = strcmp(Y,'g'); 
  pred = X(:,3:34);
  mdlSVM = fitcsvm(pred,resp,'Standardize',true);
  mdlSVM = fitPosterior(mdlSVM);
  [~,score_svm] = resubPredict(mdlSVM);
  score=score_svm(:,mdlSVM.ClassNames);
  [Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(resp,score,'true');
  disp('AUC %');
  disp(AUCsvm*100);
  subplot(2,1,i)
  plot(Xsvm,Ysvm, 'y')
   xlabel('FP') 
  ylabel('TP')
end