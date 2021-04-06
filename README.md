# Sign-Language-Recognition-using-PCA
A simple application based on MATLAB for American Sign Language Recognition using Principal Component Analysis, alongside L1 distance classifier. 
For this model, we are focussing solely on classification using Principal Component Analysis (PCA) and Manhattan Distance (L1) classifier. PCA can be used here for dimensionality reduction for large datasets, ensuring that the 2-dimensional images in the spatial domain are converted into the 1-dimensional image in the PCA space using the dominant Eigenvalues. 
The reduced Eigenvector matrix can subsequently be used alongside the mean image for L1 classification, computing the Manhattan distance throughout the dataset and obtaining the smallest distance with respect to the testing image. The proposed algorithm is thoroughly evaluated and tested on isolated datasets with individual letters of the American Sign Language alphabet. 
Extensive experimental studies have convincingly displayed a high accuracy and effectiveness of the proposed framework.
