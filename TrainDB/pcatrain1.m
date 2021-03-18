%% Add training and test directories to path
addpath('./TrainDB/A');
addpath('./TrainDB/B');
addpath('./TrainDB/C');
addpath('./TrainDB/Five');
addpath('./TrainDB/Point');
addpath('./TrainDB/V');
addpath('./TestDB/A');
addpath('./TestDB/B');
addpath('./TestDb/C');
addpath('./TestDB/Five');
addpath('./TestDB/Point');
addpath('./TestDB/V');

%SLR using PCA- base features
n=input('Enter no. of images for training');
L=input('Enter no. of dominant Eigen values to keep');
Symbol = input('Enter the symbol you want to test for (A,B,C,Five,Point,V)-','s');
M=100; N=90; %Required image dimesnions
X=zeros(n,(M*N)); %Initialize dataset matrix [X]
T=zeros (n,L); %Initialize Transformed dataset [T] in PCA space
for count=1:n
    I=imread(strcat(Symbol,'-train',num2str(count),'.jpg'));  %Read input image
    I=rgb2gray(I);
    I=imresize(I,[M,N]);  %Reshaping images as 1D vector
end
Xb=X;
m=mean(X); %Mean of all images
for i=1:n
    X(i,:)=X(i,:)-m; %Subtracting mean from each 1D image
end
Q=(X'*X)/(n-1); %Finding covariance matrix
[Evecm, Evalm]=eig(Q);  %Getting Eigen values and Eigen vectors of COV matrix [Q]
Eval=diag(Evalm); %Extracting all Eigen values
[Evalsorted,Index]=sort(Eval, 'descend'); %Sorting Eigen values
Evecsorted=Evecm(:,Index);
Ppca=Evecsorted(:,1:L); %Reduced Transformation matrix [Ppca]
for i=1:n
    T(i,:)=(Xb(i,:)-m)*Ppca; %Projecting each image to PCA space
end