



clc;
clear all;


datax=importdata('18.mat');  % predicted tumor region extracted from the training of x-y planar superpixels
datay=importdata('patientno18ycomponentgroundtruth.mat');  % predicted tumor region extracted from the training of y-z planar superpixels
dataz=importdata('patientno18zcomponentgroundtruth.mat');   % predicted tumor region extracted from the training of z-x planar superpixels
target=zeros(240,240,155);

datatarget=importdata('mytarget.mat');
datatarget(datatarget>1)=1;
datatarget=datatarget(:,372001+7*37200:409200+7*37200);
datatarget=reshape(datatarget,240,240,155);
datatarget=permute(datatarget,[2 1 3]);
a=[2 3 1];
b=[3 2 1];
datax=permute(datax,[2 1 3]);
datay=permute(datay,a);
dataz=permute(dataz,b);

datax= imbinarize(datax);
datay= imbinarize(datay);
dataz= imbinarize(dataz);
% morphological operation
datax=imfill(datax,'holes');
datay=imfill(datay,'holes');
dataz=imfill(dataz,'holes');

for i=1:240
    for j=1:240
        for k=1:155
            if (datax(i,j,k)+datay(i,j,k)+dataz(i,j,k)==3) % check if the pixel is labelled as tumor from all the three planar scores. if not then it is non tumor.
                target(i,j,k)=1;
            end    
        end
    end
end


se = strel('disk',20);
for i=1:155
    target(:,:,i) = imclose(target(:,:,i),se);
end
TP=0;
FN=0;
FP=0;
TN=0;
for i=1:240
    for j=1:240
        for k=1:155
            if(target(i,j,k)==1 && datatarget(i,j,k)==1)
                TP=TP+1;
            elseif (target(i,j,k)==0 && datatarget(i,j,k)==1)
                FN=FN+1;
            elseif (target(i,j,k)==1 && datatarget(i,j,k)==0)
                FP=FP+1; 
            else
                TN=TN+1;
            end
            end
        end
end
    
tpfn=sum(sum(sum(target)))+sum(sum(sum(datatarget)));

% measure 5 standard performance metric 
dice1=2*TP/tpfn;

PPV=TP/(TP+FP);

sensitivity=TP/(TP+FN);

specificity=TN/(TN+FP);

Jaccard=TP/(TP+FP+FN);
