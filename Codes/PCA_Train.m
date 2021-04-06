%Code for training dataset using Principal Component Analysis
%L1 (Manhattan Distance) classifier calculated using |x1-x2|+|y1-y2|

% Sign Language Recognition using PCA with L1 classifier 
disp('Sign Language Recognition using PCA with L1 classifier');
n = input('Please enter the number of images for training of the dataset: ');

L = input('Please enter the number of dominant Eigen values to be used: '); 
a=100; b=100; %Image dimensions for resizing
DS1 = zeros(n,(a*b)); %Initializing dataset matrix
T = zeros(n,L); %Initializing transformed dataset matrix

for count = 1:n
    img = imread(sprintf('%d.jpg',count)); %Reading image for training
    img = rgb2gray(img); %Coversion from RGB to grayscale image
    img = imresize(img,[a,b]); %Resizing images
    DS1(count,:) = reshape(img,[1,a*b]); %Reshaping images to 1 dimension
end
DS2 = DS1; %Copying dataset matrix
m = mean(DS1); %Computing mean image of all images 

for i = 1:n
    DS1(i,:) = DS1(i,:) - m; %Subtracting mean image from each image in dataset
end

COV = (DS1'*DS1)/(n-1); %Computing covariance matrix of training dataset matrix
[EVecm, EValm] = eig(COV); %Obtaining Eigen vectors and values of covariance matrix
EVal = diag(EValm); %Storing Eigen values in EVal
[EValsorted,Index] = sort(EVal, 'descend'); %Sorting Eigen values of all images
EVec = EVecm(:,Index); %Sorting Eigenvectors according to index
TM = EVec(:,1:L); %Obtaining Reduced Transformation matrix

for i = 1:n
    T(i,:) = (DS2(i,:)-m)*TM; %Projecting each training image to PCA space
end