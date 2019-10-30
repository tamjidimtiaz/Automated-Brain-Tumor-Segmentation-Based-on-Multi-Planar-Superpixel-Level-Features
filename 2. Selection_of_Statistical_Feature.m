

clc;
clear all;

close all;

% This code is used to find out the capability of the statistical features
% to separate the types of data.
datatarget=importdata('consistencydatatargetforhistogram.mat');
data=importdata('consistencydataforhistogram.mat');
datatarget(datatarget>1)=1; % Use the other three types of tumor on a single class and make the non tumorclass seperate
index0=find(datatarget==0);
index1=find(datatarget==1);




data0=data(index0,:); % for tumor class
data1=data(index1,:);  % for non-tumor class

% Each of the data used below is actually couple. the first two digits
% after "data" indicates the feature no. and the last digit is for
% normal(0) and abnormal(1) case
data010=data0(:,1);
data011=data1(:,1);
data020=data0(:,2);
data021=data1(:,2);
data030=data0(:,3);
data031=data1(:,3);
data040=data0(:,4);
data041=data1(:,4);
data050=data0(:,5);
data051=data1(:,5);
data060=data0(:,6);
data061=data1(:,6);
data070=data0(:,7);
data071=data1(:,7);
data080=data0(:,8);
data081=data1(:,8);
data090=data0(:,9);
data091=data1(:,9);
data100=data0(:,10);
data101=data1(:,10);
data110=data0(:,11);
data111=data1(:,11);
data120=data0(:,13);
data121=data1(:,13);
data130=data0(:,14);
data131=data1(:,14);
data140=data0(:,15);
data141=data1(:,15);
data150=data0(:,16);
data151=data1(:,16);
data160=data0(:,17);
data161=data1(:,17);
data170=data0(:,18);
data171=data1(:,18);
data180=data0(:,19);
data181=data1(:,19);
data190=data0(:,20);
data191=data1(:,20);
data200=data0(:,21);
data201=data1(:,21);
data210=data0(:,22);
data211=data1(:,22);
data220=data0(:,23);
data221=data1(:,23);
data230=data0(:,25);
data231=data1(:,25);
data240=data0(:,26);
data241=data1(:,26);
data250=data0(:,27);
data251=data1(:,27);
data260=data0(:,28);
data261=data1(:,28);
data270=data0(:,29);
data271=data1(:,29);
data280=data0(:,30);
data281=data1(:,30);
data290=data0(:,31);
data291=data1(:,31);
data300=data0(:,32);
data301=data1(:,32);

% data2=data(index2,:);
% data4=data(index4,:);

% As the data in normal class is larger than the abnormal class, we select
% the first 5883 cases for the comparison to make the no of normal and abnormal
% case equal. But otherwise the use of total cases are also possible.
numelements = 5883;

values10 = data10(1:numelements,:);
values20 = data20(1:numelements,:);
values30 = data30(1:numelements,:);
values40 = data40(1:numelements,:);
values50 = data50(1:numelements,:);
values60 = data60(1:numelements,:);
values70 = data70(1:numelements,:);
values80 = data80(1:numelements,:);
values90 = data90(1:numelements,:);
values100 = data100(1:numelements,:);
values110 = data110(1:numelements,:);
values120 = data120(1:numelements,:);
values130 = data130(1:numelements,:);
values140 = data140(1:numelements,:);
values150 = data150(1:numelements,:);
values160 = data160(1:numelements,:);
values170 = data170(1:numelements,:);
values180 = data180(1:numelements,:);
values190 = data190(1:numelements,:);
values200 = data200(1:numelements,:);
values210 = data210(1:numelements,:);
values220 = data220(1:numelements,:);
values230 = data230(1:numelements,:);
values240 = data240(1:numelements,:);
values250 = data250(1:numelements,:);
values260 = data260(1:numelements,:);
values270 = data270(1:numelements,:);
values280 = data280(1:numelements,:);
values290 = data290(1:numelements,:);
values300 = data300(1:numelements,:);
values310 = data310(1:numelements,:);
values320 = data320(1:numelements,:);
values330 = data330(1:numelements,:);


values11= data11(:,1);
values21= data21(:,1);
values31= data31(:,1);
values41= data41(:,1);
values51= data51(:,1);
values61= data61(:,1);
values71= data71(:,1);
values81= data81(:,1);
values91= data91(:,1);
values101= data101(:,1);
values111= data111(:,1);
values121= data121(:,1);
values131= data131(:,1);
values141= data141(:,1);
values151= data151(:,1);
values161= data161(:,1);
values171= data171(:,1);
values181= data181(:,1);
values191= data191(:,1);
values201= data201(:,1);
values211= data211(:,1);
values221= data221(:,1);
values231= data231(:,1);
values241= data241(:,1);
values251= data251(:,1);
values261= data261(:,1);
values271= data271(:,1);
values281= data281(:,1);
values291= data291(:,1);
values301= data301(:,1);
values311= data311(:,1);
values321= data321(:,1);
values331= data331(:,1);



% Use the boxplot to visualize the seperability of each of the features
figure
boxplot([normalize(values10,'range') normalize(values11,'range') normalize(values20,'range') normalize(values21,'range') normalize(values30,'range') normalize(values31,'range') normalize(values60,'range') normalize(values41,'range') normalize(values70,'range') normalize(values71,'range')  normalize(values40,'range') normalize(values61,'range')  normalize(values50,'range') normalize(values51,'range') normalize(values80,'range') normalize(values81,'range') normalize(values90,'range') normalize(values91,'range') normalize(values100,'range') normalize(values101,'range')],'Notch','on','Symbol',' ',...
        'labels',{'Mean of non Tumor';'Mean of Tumor';'Standard Deviation of non Tumor';'Standard Deviation of Tumor';'Entropy of Non Tumor';'Entropy of Tumor';'Mean of Absolute Deviation of non Tumor';'Mean of Absolute Deviation of Tumor';'Skewness of non Tumor';'Skewness of Tumor';'Kurtosis of non Tumor';'Kurtosis of Tumor';'Maximum of non Tumor';'Maximum of Tumor';'Minimum of non Tumor';'Minimum of Tumor';'Median of non Tumor';'Median of Tumor';'Mode of non Tumor';'Mode of Tumor'},'LabelOrientation','inline')
set(gca,'XTick',1:20);
set(gca,'XTickLabel',{'Mean of non Tumor';'Mean of Tumor';'Standard Deviation of non Tumor';'Standard Deviation of Tumor';'Entropy of Non Tumor';'Entropy of Tumor';'Mean of Absolute Deviation of non Tumor';'Mean of Absolute Deviation of Tumor';'Skewness of non Tumor';'Skewness of Tumor';'Kurtosis of non Tumor';'Kurtosis of Tumor';'Maximum of non Tumor';'Maximum of Tumor';'Minimum of non Tumor';'Minimum of Tumor';'Median of non Tumor';'Median of Tumor';'Mode of non Tumor';'Mode of Tumor'},'FontSize',15)
set(gca,'XTickLabelRotation',17)  
 
    
title({'Comparison of Tumor and non Tumor Class for Different','Statistical Features for FLAIR images'},'Fontsize',17)
figure
boxplot([normalize(values120,'range') normalize(values121,'range') normalize(values130,'range') normalize(values131,'range') normalize(values140,'range') normalize(values141,'range') normalize(values150,'range') normalize(values151,'range') normalize(values180,'range')  normalize(values181,'range') normalize(values170,'range')  normalize(values171,'range') normalize(values160,'range') normalize(values161,'range') normalize(values190,'range') normalize(values191,'range') normalize(values200,'range') normalize(values201,'range') normalize(values210,'range') normalize(values211,'range')],'Notch','on','Symbol',' ',...
        'labels',{'Mean of non Tumor';'Mean of Tumor';'Standard Deviation of non Tumor';'Standard Deviation of Tumor';'Entropy of Non Tumor';'Entropy of Tumor';'Mean of Absolute Deviation of non Tumor';'Mean of Absolute Deviation of Tumor';'Skewness of non Tumor';'Skewness of Tumor';'Kurtosis of non Tumor';'Kurtosis of Tumor';'Maximum of non Tumor';'Maximum of Tumor';'Minimum of non Tumor';'Minimum of Tumor';'Median of non Tumor';'Median of Tumor';'Mode of non Tumor';'Mode of Tumor'},'LabelOrientation','inline')
set(gca,'XTick',1:20);
set(gca,'XTickLabel',{'Mean of non Tumor';'Mean of Tumor';'Standard Deviation of non Tumor';'Standard Deviation of Tumor';'Entropy of Non Tumor';'Entropy of Tumor';'Mean of Absolute Deviation of non Tumor';'Mean of Absolute Deviation of Tumor';'Skewness of non Tumor';'Skewness of Tumor';'Kurtosis of non Tumor';'Kurtosis of Tumor';'Maximum of non Tumor';'Maximum of Tumor';'Minimum of non Tumor';'Minimum of Tumor';'Median of non Tumor';'Median of Tumor';'Mode of non Tumor';'Mode of Tumor'},'FontSize',15)
set(gca,'XTickLabelRotation',17)  
    
    
title({'Comparison of Tumor and non Tumor Class for Different','Statistical Features for T1c images'},'Fontsize',17)


figure
boxplot([normalize(values10,'range') normalize(values11,'range') normalize(values240,'range') normalize(values241,'range') normalize(values250,'range') normalize(values251,'range') normalize(values260,'range') normalize(values261,'range') normalize(values290,'range')  normalize(values291,'range') normalize(values280,'range')  normalize(values281,'range') normalize(values270,'range') normalize(values271,'range') normalize(values300,'range') normalize(values301,'range') normalize(values310,'range') normalize(values311,'range') normalize(values320,'range') normalize(values321,'range')],'Notch','on','Symbol',' ',...
        'labels',{'Mean of non Tumor';'Mean of Tumor';'Standard Deviation of non Tumor';'Standard Deviation of Tumor';'Entropy of Non Tumor';'Entropy of Tumor';'Mean of Absolute Deviation of non Tumor';'Mean of Absolute Deviation of Tumor';'Skewness of non Tumor';'Skewness of Tumor';'Kurtosis of non Tumor';'Kurtosis of Tumor';'Maximum of non Tumor';'Maximum of Tumor';'Minimum of non Tumor';'Minimum of Tumor';'Median of non Tumor';'Median of Tumor';'Mode of non Tumor';'Mode of Tumor'},'LabelOrientation','inline')

  
set(gca,'XTick',1:20);
set(gca,'XTickLabel',{'Mean of non Tumor';'Mean of Tumor';'Standard Deviation of non Tumor';'Standard Deviation of Tumor';'Entropy of Non Tumor';'Entropy of Tumor';'Mean of Absolute Deviation of non Tumor';'Mean of Absolute Deviation of Tumor';'Skewness of non Tumor';'Skewness of Tumor';'Kurtosis of non Tumor';'Kurtosis of Tumor';'Maximum of non Tumor';'Maximum of Tumor';'Minimum of non Tumor';'Minimum of Tumor';'Median of non Tumor';'Median of Tumor';'Mode of non Tumor';'Mode of Tumor'},'FontSize',15)
set(gca,'XTickLabelRotation',17)  
    
    
title({'Comparison of Tumor and non Tumor Class for Different','Statistical Features for T2 images'},'Fontsize',17)
