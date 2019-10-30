%%%%  this code generates the dice coefficient of the test images of x-y
%%%%  plane. the same process will be done on other three planes and save
%%%%  the three planar scores in individual mat file

%% roi end
a=1;
b=155;
n=57600;   % Here we want to predict the 2nd patient and as the data is stored in a side by side fashion the column number corresponding to the beginning of the 2nd patient is 240*240+1=57601
% kn=1;
 train=[];
 target=[];
s=0;
den=0;
ensemble=importdata('ensemble60v3.mat');      %% ensemble from demo_example_classification.m%data=importdata('enhancednondatasetwithtumorwithreduceddata.mat');

dataflair=importdata('brats2018flairmodality.mat');
datat1ce=importdata('brats2018t1cemodality.mat');
datat2=importdata('brats2018t2modality.mat');
% 
datatarget=importdata('mytarget.mat');          %%  ground truth target
dice=0; % measure of overlapping

%%
prediction=[];
%%
t=1;
datatarget(datatarget>1)=1; % to make the overall tumor region detection we combine the other three types of tumor class in a single class.

 c=1;
 r=1;
%N=1368;
for N=a:b
    i1=double(dataflair(:,n+1:n+240)); 
    i4=double(datat1ce(:,n+1:n+240));
    i5=double(datat2(:,n+1:n+240));
    i2=datatarget(:,n+1:n+240);
    
   
         rng();
        [L,NumLabels] = superpixels(i1,1600);
        
        lambda  = 2;
        theta   = [3*pi/8 4*pi/8 5*pi/8]; % orientation variation
        psi     = pi/2; %predetermined values
        gamma   = 0.5;  %predetermined values
        bw      = 1;    %predetermined values
        N       = 8;    %predetermined values
        sigma= [0.2 0.5 0.8 1.1 1.4];

        img_out = zeros(size(i1,1), size(i1,2), No);
        no=1;
        for k=1:6
            for j=1:5
                gb = abs(gabor_fn(sigma(j),bw,gamma,psi(1),lambda,theta(k))...
                    + 1i * gabor_fn(sigma(j),bw,gamma,psi(2),lambda,theta(k)));
                % gb is the n-th gabor filter
                img_out(:,:,no) = abs(imfilter(i1, gb, 'symmetric'));
                img_out(:,:,no+1) = abs(imfilter(i4, gb, 'symmetric'));
                img_out(:,:,no+2) = abs(imfilter(i5, gb, 'symmetric'));
                
                % filter output to the n-th channel
                %theta = theta + 2*pi/N;
                % next orientation
                no=no+3;
            end
        end

        
        for i=1:1600
            
            if(sum(i1(L==i))==0)
                
                train(r,1)=0;
                train(r,2)=0;
                train(r,3)=0;
                train(r,4)=0;
                train(r,5)=0;
                train(r,6)=0;
                train(r,7)=0;
                train(r,8)=0;
                train(r,9)=0;
                train(r,10)=0;
                train(r,11)=0;
                train(r,12)=0;
                train(r,13)=0;
                train(r,14)=0;
                train(r,15)=0;
                train(r,16)=0;
                train(r,17)=0;
                train(r,18)=0;
                train(r,19)=0;
                train(r,20)=0;
                train(r,21)=0;
                train(r,22)=0;
                train(r,23)=0;
                train(r,24)=0;
                train(r,25)=0;
                train(r,26)=0;
                train(r,27)=0;
                train(r,28)=0;
                train(r,29)=0;
                train(r,30)=0;
                train(r,31)=0;
                train(r,32)=0;
                train(r,33)=0;
                train(r,34)=0;
                train(r,35)=0;
                train(r,36)=0;
                train(r,37)=0;
                train(r,38)=0;
                train(r,39)=0;
                train(r,40)=0;
                train(r,41)=0;
                train(r,42)=0;
                train(r,43)=0;
                train(r,44)=0;
                train(r,45)=0;
                train(r,46)=0;
                train(r,47)=0;
                train(r,48)=0;
                train(r,49)=0;
                train(r,50)=0;
                train(r,51)=0;
                train(r,52)=0;
                train(r,53)=0;
                train(r,54)=0;
                train(r,55)=0;
                train(r,56)=0;
                train(r,57)=0;
                train(r,58)=0;
                train(r,59)=0;
                train(r,60)=0;
                train(r,61)=0;
                train(r,62)=0;
                train(r,63)=0;
                train(r,64)=0;
                train(r,65)=0;
                train(r,66)=0;
                train(r,67)=0;
                train(r,68)=0;
                train(r,69)=0;
                train(r,70)=0;
                train(r,71)=0;
                train(r,72)=0;
                train(r,73)=0;
                train(r,74)=0;
                train(r,75)=0;
                train(r,76)=0;
                train(r,77)=0;
                train(r,78)=0;
                train(r,79)=0;
                train(r,80)=0;
                train(r,81)=0;
                train(r,82)=0;
                train(r,83)=0;
                train(r,84)=0;
                train(r,85)=0;
                train(r,86)=0;
                train(r,87)=0;
                train(r,88)=0;
                train(r,89)=0;
                train(r,90)=0;
                train(r,91)=0;
                train(r,92)=0;
                train(r,93)=0;
                train(r,94)=0;
                train(r,95)=0;
                train(r,96)=0;
                train(r,97)=0;
                train(r,98)=0;
                train(r,99)=0;
                train(r,100)=0;
                train(r,101)=0;
                train(r,102)=0;
                train(r,103)=0;
                train(r,104)=0;
                train(r,105)=0;
                train(r,106)=0;
                train(r,107)=0;
                train(r,108)=0;
                train(r,109)=0;
                train(r,110)=0;
                train(r,111)=0;
                train(r,112)=0;
                
                train(r,113)=0;
                train(r,114)=0;
                train(r,115)=0;
                train(r,116)=0;
                train(r,117)=0;
                train(r,118)=0;
                train(r,119)=0;
                train(r,120)=0;
                train(r,121)=0;
                train(r,122)=0;
                train(r,123)=0;
                train(r,124)=0;
                train(r,125)=0;
                train(r,126)=0;
                target(r,1)=0;
            else

                train(r,1)=mean(i1(L==i));
                train(r,2)=max(i1(L==i));
                train(r,3)=min(min(i1(L==i)));
                train(r,4)=median(i1(L==i));
                train(r,5)=mode(i1(L==i));
               
                % Extraction of ten statistical features for t1c images
                train(r,6)=mean(i3(L==i));
                train(r,7)=max(i3(L==i));
                train(r,8)=min(min(i3(L==i)));
                train(r,9)=median(i3(L==i));
                train(r,10)=mode(i3(L==i));

                % Extraction of ten statistical features for t1c images
                train(r,11)=mean(i4(L==i));
                train(r,12)=max(i4(L==i));
                train(r,13)=min(min(i4(L==i)));
                train(r,14)=median(i4(L==i));
                train(r,15)=mode(i4(L==i));
                %Gabor Channels
                g=16;
                g1=1;
                for g1=1:45 % gabor channels for (8 orientation*5 filter size and 3 modalities. SO extraction of (5*8*3)=120 features
                    i6=img_out(:,:,g1);
                    train(r,g)=mean(i6(L==i));
                    g1=g1+1;
                end


                m4=sum(i2(L==i)==4);
                m2=sum(i2(L==i)==2);
                m1=sum(i2(L==i)==1);
                m0=sum(i2(L==i)==0);
                m=[m4 m2 m1 m0];
                mo=sort(m);
                if mo(4)==m4
                    target(r,1)=4;
                elseif mo(4)==m2
                    target(r,1)=2;
                elseif mo(4)==m1
                    target(r,1)=1;
                else
                    target(r,1)=0;
                end
            end
            
            r=r+1;
            
        end
    
    
        n=n+240

 testSet=[train target];
     

inputType=ones(length(testSet),1);
% The dataset contains a mix of continous and categorical attributes
% inputType indicates the type
% The output contains 16 classes
% class 1:  No arrhythmia
% classes 2-16: Different classes of arrhythmia



% Split the dataset into a training and testing subsets
% [n m] = size(featureset);
% cel=ceil(r*(1/2));
% %data = data(randperm(n),:); 
% trainSet = featureset(1:cel,:);
% testSet = featureset(cel+1:end,:);


% Build a tree ensemble
M = 20;           % number of trees
K = 5;           % number of attributes randomly selected at each node
nmin = 2;         % minimum sample size for splitting a node
problemType = 1;  % classification problem


% predict the superpixels
prediction = predictWithAnEnsemble(ensemble,testSet(:,1:end-1),1);

count = numel(find(~(prediction - testSet(:,end))));


idx=label2idx(L);

    i1=reshape(i1,240*240,1);
    for i=1:length(idx)
        if prediction(i)==1    
            i1(idx{1,i})=1;
        elseif prediction(i)==2
            i1(idx{1,i})=2;
        elseif prediction(i)==4
            i1(idx{1,i})=4;
        else
            i1(idx{1,i})=0;
        end
    end
    i1=reshape(i1,240,240);
    i1(i1>1)=1;
    i1 = bwareaopen(i1,200);
%     end
    i1 = imfill(i1,'holes');
    

%     
    for i=1:240
        for j=1:240
            if(i1(i,j)==1 & i2(i,j)==1)
                s=s+1;
            end
        end
    end
    
    tpfn=sum(sum(i1))+sum(sum(i2));
    den=den+tpfn;
%     
%         figure(),imshow(i1,[]);
%         figure(),imshow(i2,[]);
        if rem(N,155)==0
            dice=(2*s)/den  % find the dice score
            d(t)=dice;
            t=t+1;
        end
        N
        
end
 