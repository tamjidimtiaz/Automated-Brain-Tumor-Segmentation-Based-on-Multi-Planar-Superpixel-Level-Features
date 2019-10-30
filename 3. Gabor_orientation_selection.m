clc
clear all
% Selection of Gabor orientation as a feature reduction process.Here only
% flair images are used. The other two modalities have to be used
% seperately. From this processes we finally select 3 orientation from
% primarily selected 8 orientations which greatly reduced the feature
% space. This code is implemented according to the algorithm described in 
% W.Y. Han, J.C. Lee, "Palm vein recognition using adaptive gabor filter"
% Expert Systems with Applications, vol. 39, no. 18, pp. 13225-13234, 2012.

dataflair=importdata('brats2018flairmodality.mat');

n=0;
% initialize the volume for individual orientation as there are 8
% orientation number of volumes are eight.
L1max=zeros(1,155*20);
L2max=zeros(1,155*20);
L3max=zeros(1,155*20);
L4max=zeros(1,155*20);
L5max=zeros(1,155*20);
L6max=zeros(1,155*20);
L7max=zeros(1,155*20);
L8max=zeros(1,155*20);

for p=1:155*20
    
    i1=double(dataflair(:,n+1:n+240));
    i4=double(datat1ce(:,n+1:n+240));
    i5=double(datat2(:,n+1:n+240));
    
    % create the mask which is basically the local descriptor corresponding
    % to 8 orientation
    d1 = [0 0 0;-1 0 1;0 0 0]; 
    d2 = [0 0 1;-1 0 0;0 0 0]; 
    d3 = [0 0 1;0 0 0;-1 0 0]; 
    d4 = [0 0 1;0 0 0;0 -1 0]; 
    d5 = [0 1 0;0 0 0;0 -1 0]; 
    d6 = [1 0 0;0 0 0;0 -1 0]; 
    d7 = [1 0 0;0 0 0;0 0 -1]; 
    d8 = [1 0 0;0 0 -1;0 0 0]; 

    % initialize the convoluted image which is found from the convoloution of mask image d and original image i. 
    L1=zeros(240,240);
    L2=zeros(240,240);
    L3=zeros(240,240);
    L4=zeros(240,240);
    L5=zeros(240,240);
    L6=zeros(240,240);
    L7=zeros(240,240);
    L8=zeros(240,240);
    
    for x=2:154
        for y=2:239
            for a=-1:1
                for b=-1:1
                    L1(x,y) = L1(x,y) + (i5(x+a,y+b)*d1(a+2,b+2));
                    L2(x,y) = L2(x,y) + (i5(x+a,y+b)*d2(a+2,b+2));
                    L3(x,y) = L3(x,y) + (i5(x+a,y+b)*d3(a+2,b+2));
                    L4(x,y) = L4(x,y) + (i5(x+a,y+b)*d4(a+2,b+2));
                    L5(x,y) = L5(x,y) + (i5(x+a,y+b)*d5(a+2,b+2));
                    L6(x,y) = L6(x,y) + (i5(x+a,y+b)*d6(a+2,b+2));
                    L7(x,y) = L7(x,y) + (i5(x+a,y+b)*d7(a+2,b+2));
                    L8(x,y) = L8(x,y) + (i5(x+a,y+b)*d8(a+2,b+2));
                end
            end
        end
    end
    % sum all the intensity of the corresponding convoluted image
    L1sum(1,p)=sum(sum(abs(L1)));
    L2sum(1,p)=sum(sum(abs(L2)));
    L3sum(1,p)=sum(sum(abs(L3)));
    L4sum(1,p)=sum(sum(abs(L4)));
    L5sum(1,p)=sum(sum(abs(L5)));
    L6sum(1,p)=sum(sum(abs(L6)));
    L7sum(1,p)=sum(sum(abs(L7)));
    L8sum(1,p)=sum(sum(abs(L8)));
        
   n=n+240; 
end
% Finally sorted out the maximum intensified convoluted image which is a
% indicator of better orientation performance.
Lmax=[L1sum; L2sum; L3sum; L4sum; L5sum; L6sum; L7sum; L8sum];
Lmax=Lmax(:,any(Lmax));
Lrow=sum(Lmax,2);
[L,I] = sort(Lmax,'ascend');
I(4:8,:)=[];

max1=sum(sum(I==1));
max2=sum(sum(I==2));
max3=sum(sum(I==3));
max4=sum(sum(I==4));
max5=sum(sum(I==5));
max6=sum(sum(I==6));
max7=sum(sum(I==7));
max8=sum(sum(I==8));
m=[max1 max2 max3 max4 max5 max6 max7 max8];
% 
