clear all;
close all;

data=importdata('features.mat'); % Save the features as a seperate .mat file and named it as features

% CLear the data with nan values
[li_r,li_c]=find(isnan(data));
data(li_r,:)=[];
%
% Include the corresponding targets
datatarget=importdata('featurestarget.mat'); %
%

datatarget(li_r,:)=[];

% Set the training portion and testing portion in theis particular code we
% forcefully creates 2 fold cross validation process to make sure that the
% first 10 patient is in the training phase and the remaining are on the
% testing. But if you want it more acurate make sure to shuffle the whole
% things. Finally , it is obviously important to seperate the test and
% training set. It is to be mentioned that the 
train=data(1:133867,:);
target=datatarget(1:133867,:);
test=data(133868:end,:);
testtarget=datatarget(133868:end,:);

X_train = train;
Y_train = target;

X_test = test;
Y_test = testtarget;

% 
trainSet=[X_train Y_train];
%trainSet(:,15)=[];
testSet=[X_test Y_test];
x=find(Y_train(:,end)==0);
x1=find(Y_train(:,end)==1);
x2=find(Y_train(:,end)==2);
x4=find(Y_train(:,end)==4);
newsetfinal=[];
newsetfinal1=[];
newsetfinal2=[];
newsetfinal4=[];

newsetfinal=trainSet(x(1:length(x)),1:end);
newsetfinal1=trainSet(x1(1:length(x1)),1:end) ;
newsetfinal2=trainSet(x2(1:length(x2)),1:end) ;
newsetfinal4=trainSet(x4(1:length(x4)),1:end) ;
%testSet=[X_test Y_test];


       
    trainSet0=newsetfinal;  
    trainSet1=newsetfinal1;
    trainSet2=newsetfinal2;
    trainSet4=newsetfinal4;
    trainSetfinal=[trainSet0;trainSet1;trainSet2;trainSet4];
    inputType=ones(length(trainSetfinal),1);
    
    
    % this part of the code is implemented using the matlab code found from
    % https://www.mathworks.com/matlabcentral/fileexchange/47372-rtaormina-matlab_extratrees
    % Please visit to find out the corresponding functions which has to be
    % used for the execution of the method.
    
    M =22 ;           % number of trees
    K = 3;           % number of attributes randomly selected at each node
    nmin =2;         % minimum sample size for splitting a node
    problemType = 1;  % classification problem


[ensemble,output,scores,depths] = buildAnEnsemble(M, K,nmin,trainSetfinal,problemType,inputType,[]);

prediction = predictWithAnEnsemble(ensemble,testSet(:,1:end-1),1);


%the number of correct predictions
    count = numel(find(~(prediction - testSet(:,end))));

    display(['The percetange of correct predictions= '...
    num2str(count/size(testSet,1))])




%plot the number of correct predictions for each class
    classNames = {'0','1','2','4'};

    realOutput = testSet(:,end);
    presentClasses = unique_f(realOutput);

    classNum = zeros(numel(presentClasses,1));
    classCorr = zeros(numel(presentClasses,1));


