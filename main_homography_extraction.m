clear; close all;

%% Sallmone Armela, Kegl Noémie, Mony Alexandra 

% Main script to perform image extraction using homography

% Load the source image 
sourceImg = imread('images/tab.jpg');



%% Points on the source image 1
% Display the source image ans selct 4 points
imshow(sourceImg);
title('Selectionnez les 4 points du premier tableau à échanger');
[XU, YU] = ginput(4); 

% Destination points
width = 512; 
height = 256;
XR = [1, width, width, 1]; % dest points in X
YR = [1, 1, height, height]; % dest points in Y

% Homography matrix 
H = homographie(XU, YU, XR, YR);

% Invert H
invH = inv(H);

% Extract image
extractedImg = extraction(invH,sourceImg, height, width);

%% Points on the source image 2
% Display the source image ans selct 4 points
imshow(sourceImg);
title('Selectionnez les 4 points du second tableau à échanger');
[XU2, YU2] = ginput(4); 

% Destination points
width2 = 512; 
height2 = 256;
XR2 = [1, width2, width2, 1]; % dest points in X
YR2 = [1, 1, height2, height2]; % dest points in Y

% Homography matrix 
H2 = homographie(XU2, YU2, XR2, YR2);

% Invert H
invH2 = inv(H2);

% Extract image
extractedImg2 = extraction(invH2,sourceImg, height2, width2);

%% Remettre l'image a sa place

srcImageReconstruite = inverse_homo(XR2, YR2, H2, extractedImg, sourceImg);
srcImageReconstruite2 = inverse_homo(XR, YR, H, extractedImg2, srcImageReconstruite);



%% Affichage

% Display extracted image 
figure;
imshow(extractedImg);
title('Extracted Image');

% Display extracted image 
figure;
imshow(extractedImg2);
title('Extracted Image');

% Afficher l'image résultante
figure;
imshow(srcImageReconstruite2);
title('Image avec la portion extraite réintégrée');





 




