%Code for testing dataset using Principal Component Analysis
%L1 (Manhattan Distance) classifier calculated using |x1-x2|+|y1-y2|
%Testing for individual images (for manual testing and webapp)

%Sign Language Recognition using PCA with L1 classifier

clc;
clear all;
load PCA-DB; %Loading PCA-DB.mat file (training phase)
% Variables:
% [a,b] - Dimensions of image
% [m] - Mean image
% [TM] - Transformation Matrix
% [T] - Transformed dataset matrix

[file,path] = uigetfile('*.*', 'Select the Input Image');
filepath = strcat(path,file);
img = imread(filepath); %Reading testing image from the local directory
imgc=img; %Copying testing image
img = rgb2gray(img); %Coversion from rgb to grayscale image
img = imresize(img, [a,b]); %Resizing image
img = double(reshape(img,[1,a*b])); %Reshaping image to single dimension
imgpca = (img-m)*TM; %Projecting test image to PCA space

dist=zeros(n,1); %Initializing difference array
for i=1:n
    dist(i)=sum(abs(T(i,:)-imgpca)); %Finding L1 distance for training images
end

[result,indx]=min(dist); %Obtaining best match by computing least distance
resInd=(indx/(n/26));
if mod(indx,(n/26))~=0
    resInd=resInd+1;
end
c= char(resInd+64); %Obtaining corresponding letter of English alphabet

subplot(121) 
imshow (imgc);
title ('Input Sign Language'); %Input testing image
subplot(122)
imshow(sprintf('%c.jpg',c));
title ('Recognized English Alphabet'); %Corresponding letter of the alphabet
disp(indx);