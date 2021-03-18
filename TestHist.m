%First load required variables in workspace for testing
clc;
load PCA-DB-Hist; %Loading PCA-DB-Hist.mat file
%PCA-DB-Hist loads the following in the workspace
% Image size [M=100, N=90]
% Mean histogram of images [m]
% Reducced Eigen vectors transformation matrix [Ppca]
% Transformed dataset matrix of images [T]

[filename,pathname]=uigetfile('*.*', 'Select the Input Image');
filewithpath=strcat (pathname,filename);
img=imread(filewithpath);
imgo=img;
img=rgb2gray(img);
img=imresize(img, [M,N]);
img=double(reshape(img,[1,M*N])); %Reshaping image as 1D image
temp=imhist(img);   %Generating histogram of 1D image
his=temp'; %Generating histogram transpose
imgpca=(his-m)*Ppca; %Projecting query histogram to PCA space
distarray=zeros(n,1); %Initialize difference array
for i=1:n
    distarray(i)=sum(abs(T(i,:)-imgpca)); %Finding L1 distance
end
[result,indx]=min(distarray); %Getting best match
resultimg=imread(sprintf('%d.jpg',indx)); %Getting best matched histogram

%Plotting images
subplot(121)
imshow (imgo);
title ('Query Sign');
subplot(122)
imshow(resultimg);
title ('Recognized Sign from Dataset');
disp(indx);
resInd=(indx/120);
if mod(indx,120)~=0
    resInd=resInd+1;
end;
disp(char(resInd+64));
    