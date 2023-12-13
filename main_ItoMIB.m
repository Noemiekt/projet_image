clear; close all;
dbstop if error;

%% Sallmone Armela, Kegl Noémie, Mony Alexandra 

% Main script to perform image extraction using homography

% Load the source image 
sourceImg = imread('images/tab.jpg');



% Display the source image 
imshow(sourceImg);


%% Points on the source image 2
% Apply ItoMIB 
MIB = ItoMIB(sourceImg);
disp(MIB)
