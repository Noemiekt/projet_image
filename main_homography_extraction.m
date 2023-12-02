clear; close all;

%% Sallmone Armela, Kegl Noémie, Mony Alexandra 

% Main script to perform image extraction using homography

% Load the source image 
sourceImg = imread('images/picture_arm.jpeg');

% Display the source image ans selct 4 points
imshow(sourceImg);
title('Select 4 points on the image');
% Points on the source image
[XU, YU] = ginput(4); 

% Destination points
width = 200; 
height = 200;
XR = [1, width, width, 1]; % dest points in X
YR = [1, 1, height, height]; % dest points in Y

% Homography matrix 
H = homographie(XU, YU, XR, YR);

% Invert H
invH = inv(H);

% Extract image
extractedImg = extraction(invH,sourceImg, height, width);

% Display extracted image 
figure;
imshow(extractedImg);
title('Extracted Image');


 




