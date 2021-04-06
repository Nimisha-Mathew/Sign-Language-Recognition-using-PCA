a=100; b=100;
img1 = imread('165.jpg'); %Reading image
img2 = rgb2gray(img1); %Coversion from RGB to grayscale image
img3 = imresize(img2,[a,b]); %Resizing images
imgf = reshape(img3,[1,a*b]); %Reshaping images to 1 dimension

subplot(131)
imshow (img1);
title ('Original Image'); %Input image
subplot(132)
imshow(img2);
title ('Grayscale Image'); %Conversion
subplot(133)
imshow(img3);
title ('Resized image'); %ResizinG

