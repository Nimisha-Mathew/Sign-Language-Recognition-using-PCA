%First load required variables in workspace for testing
clc;
load PCA-DB; %Loading PCA-DB.mat file
%PCA-DB loads the following in the workspace
% Image size [M=100, N=90]
% Mean image [m]
% Reducced Eigen vectors transformation matrix [Ppca]
% Transformed dataset matrix [T]

[filename,pathname]=uigetfile('*.*', 'Select the Input Image');
filewithpath=strcat (pathname,filename);
img=imread(filewithpath);
imgo=img;
img=rgb2gray(img);
img=imresize(img, [M,N]);
img=double(reshape(img,[1,M*N]));
imgpca=(img-m)*Ppca; %Projecting query image to PCA space
distarray=zeros(n,1); %Initialize difference array
for i=1:n
    distarray(i)=sum(abs(T(i,:)-imgpca)); %Finding L1 distance
end
[result,indx]=min(distarray); %Getting best match
resultimg=imread(sprintf('%d.jpg',indx)); %Getting best matched image

%Finding English letter corresponding to best-matched image
resInd=(indx/120);
if mod(indx,120)~=0
    resInd=resInd+1;
end;
c= char(resInd+64);

%Plotting images
subplot(121)
imshow (imgo);
title ('Input Sign Language');
subplot(122)
imshow(sprintf('%c.jpg',c));
title ('Recognized English Alphabet');
disp(indx);

    