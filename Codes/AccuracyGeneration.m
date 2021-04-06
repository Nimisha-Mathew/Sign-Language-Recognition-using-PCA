%Code for testing dataset using Principal Component Analysis
%L1 (Manhattan Distance) classifier calculated using |x1-x2|+|y1-y2|
%Testing for multiple images in a loop (all testing images in dataset), for
%the purpose of accuracy generation matrix.

%Sign Language Recognition using PCA with L1 classifier

clc;
clear all;
load PCA-DB; %Loading PCA-DB.mat file (training phase)
% Variables:
% [a,b] - Dimensions of image
% [m] - Mean image
% [TM] - Transformation Matrix
% [T] - Transformed dataset matrix

Final=zeros(26,26); %Initializing accuracy matrix
for i=1:26 
    for j=1:10
        img=imread(sprintf('%c%d.jpg',char(i+64),j));
        imgc=img; %Copying testing image
        img = rgb2gray(img); %Coversion from rgb to grayscale image
        img = imresize(img, [a,b]); %Resizing image
        img = double(reshape(img,[1,a*b])); %Reshaping image to single dimension
        imgpca = (img-m)*TM; %Projecting test image to PCA space

        dist=zeros(n,1); %Initializing difference array
        for k=1:n
            dist(k)=sum(abs(T(k,:)-imgpca)); %Finding L1 distance for training images
        end

        [result,indx]=min(dist); %Obtaining best match by computing least distance
        resInd=(indx/(n/26));
        if mod(indx,(n/26))~=0
            resInd=resInd+1;
        end
        c= char(resInd+64); %Obtaining corresponding letter of English alphabet
        
        Final(i, c-64)=Final(i, c-64)+1;
    end
end

sum=0;
for i=1:26
    sum=sum+Final(i,i); %Adding diagonal elements
end
acc=double(sum/260)*100; %Computing accuracy
disp(acc);        