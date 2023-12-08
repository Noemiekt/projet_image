clear; close all;
dbstop if error;

%% Sallmone Armela, Kegl Noémie, Mony Alexandra 

% Main script to perform image extraction using homography

% Load the source image 
sourceImg = imread('images/tab.jpg');


% Carré de base :
XR = [-1, 1, 1, -1]; % dest points in X
YR = [-1, -1, 1, 1]; % dest points in Y


%% Points on the source image 1
% Display the source image ans selct 4 points
imshow(sourceImg);
title('Selectionnez les 4 points du premier tableau à échanger');
[XU, YU] = ginput(4); 

%% Points on the source image 2
% Display the source image ans selct 4 points
imshow(sourceImg);
title('Selectionnez les 4 points du second tableau à échanger');
[XU2, YU2] = ginput(4); 


% Homography matrix 
H1toC = homographie(XU, YU, XR, YR);

% Invert H
H2toC = homographie(XU2, YU2,XR, YR);


H1to2=homographie(XU, YU, XU2, YU2);


srcImageReconstruite = echange(H1toC,H2toC,H1to2, sourceImg);





%% Affichage


% Afficher l'image résultante
figure;
imshow(srcImageReconstruite);
title('Image avec la portion extraite réintégrée');

