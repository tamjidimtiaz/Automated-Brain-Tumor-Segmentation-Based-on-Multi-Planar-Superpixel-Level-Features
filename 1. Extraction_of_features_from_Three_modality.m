clc;
clear all;
close all;
% This code is for the feature extraction of images extracted from x-y plane. The same code has been utilized for the feature extraction along the y-z and z-x planes. BTW this method utilizes three dimensional feature extraction process.   
a=1;
b=3100; % from image 1 to image 3100 as we have used 20 patients which in the 
train=[];
target=[];

% Three modality of MRI Scan are used to extract features 
dataflair=importdata('brats2018flairhemisphere.mat'); % the data is structured in a volumeetric way, each of the MRI volume of patient of the miccai brats-2015 database has the dimension of 240*240 image with 155 no. of slice. SO basically the whole dimension is 240*240*155
datat1=importdata('brats2018t2hemisphere.mat');
datat1ce=importdata('brats2018t1cehemisphere.mat');

datatarget=importdata('mytarget.mat');          %%  ground truth data target


c=1;
n=0;
r=1;

for N=a:b % feature extraction from image-1(a) to image-3100(b);
    
    i1=double(dataflair(:,n+1:n+240));
    i3=double(datat2(:,n+1:n+240));
    i4=double(datat1ce(:,n+1:n+240));
    i2=datatarget(:,n+1:n+240);
    
    if sum(sum(i2))>0
         rng();
        [L,NumLabels] = superpixels(i1,1600); 
        
        lambda  = 2;
        theta   = [0 pi/8 2*pi/8 3*pi/8 4*pi/8 5*pi/8 6*pi/8 7*pi/8 pi]; % orientation variation
        psi     = pi/2; %predetermined values
        gamma   = 0.5;  %predetermined values
        bw      = 1;    %predetermined values
        N       = 8;    %predetermined values
        sigma= [0.2 0.5 0.8 1.1 1.4]; % filter size is varied with a 0.3 increment.
% Extraction of gabor filtered output for 
        img_out = zeros(size(i1,1), size(i1,2), N);
        no=1;
        for k=1:6
            for j=1:5
                gb = abs(gabor_fn(sigma(j),bw,gamma,psi(1),lambda,theta(k))...
                    + 1i * gabor_fn(sigma(j),bw,gamma,psi(2),lambda,theta(k)));
                % gb is the n-th gabor filter which is conoluted with three
                % moadlity of images
                img_out(:,:,no) = abs(imfilter(i1, gb, 'symmetric'));
                img_out(:,:,no+1) = abs(imfilter(i3, gb, 'symmetric'));
                img_out(:,:,no+2) = abs(imfilter(i4, gb, 'symmetric'));
                no=no+3;
            end
        end
        
       

        
        for i=1:1600 % Extraction of features for 1600 superpixels in an image.
            
            if(sum(i1(L==i))==0)
                continue;
               
            else

                % Extraction of ten statistical features for flair images   
                train(r,1)=mean(i1(L==i)); 
                train(r,2)=std(i1(L==i));
                train(r,3)=entropy(i1(L==i));
                train(r,4)=mad(i1(L==i));
                train(r,5)=skewness(i1(L==i));
                train(r,6)=kurtosis(i1(L==i));
                train(r,7)=max(i1(L==i));
                train(r,8)=min(min(i1(L==i)));
                train(r,9)=median(i1(L==i));
                train(r,10)=mode(i1(L==i));
               
                % Extraction of ten statistical features for t1c images
                train(r,11)=mean(i3(L==i));
                train(r,12)=std(i3(L==i));
                train(r,13)=entropy(i3(L==i));
                train(r,14)=mad(i3(L==i));
                train(r,15)=skewness(i3(L==i));
                train(r,16)=kurtosis(i3(L==i));
                train(r,17)=max(i3(L==i));
                train(r,18)=min(min(i3(L==i)));
                train(r,19)=median(i3(L==i));
                train(r,20)=mode(i3(L==i));

                % Extraction of ten statistical features for t1c images
                train(r,21)=mean(i4(L==i));
                train(r,22)=std(i4(L==i));
                train(r,23)=entropy(i4(L==i));
                train(r,24)=mad(i4(L==i));
                train(r,25)=skewness(i4(L==i));
                train(r,26)=kurtosis(i4(L==i));
                train(r,27)=max(i4(L==i));
                train(r,28)=min(min(i4(L==i)));
                train(r,29)=median(i4(L==i));
                train(r,30)=mode(i4(L==i));
                %Gabor Channels
                g=31;
                g1=1;
                for g1=1:120 % gabor channels for (8 orientation*5 filter size and 3 modalities. SO extraction of (5*8*3)=120 features
                    i6=img_out(:,:,g1);
                    train(r,g)=mean(i6(L==i));
                    g1=g1+1;
                end
                m4=sum(i2(L==i)==4);
                m2=sum(i2(L==i)==2);
                m1=sum(i2(L==i)==1);
                m0=sum(i2(L==i)==0);
                % As the pixels in a superpixel carries different types of class we have labelled the superpixel as per the label of majority types of pixels in it.  
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
    
    
        n=n+240;
            if rem(n,37200)==0 
                dummy(c)=r;
                c=c+1;
            end
                
    else
        n=n+240
            if rem(n,37200)==0 
                dummy(c)=r;
                c=c+1;
            end
    end
end
