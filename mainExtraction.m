%% SALLMONE Armela, KEGL Noémie & MONY Alexandra
clear; close all; clc;

%% Initialisation
% Charger l'image
img = double(imread('images/affichesimple.jpeg'));

%% Traitement
% Affichage de l'image
figure;
subplot(1,2,1);
imshow(uint8(img));  
title('Selectionnez 4 points');

% Capture des 4 points 
n = 4; 
[Xsrc, Ysrc] = ginput(n);

% Affichez les points capturés sur l'image
hold on;
subplot(1,2,1);
scatter(Xsrc, Ysrc, 'r', 'filled');
hold off;

% Définir la taille de l'image reconstruite
w = round(max(Xsrc) - min(Xsrc));
h = round(max(Ysrc) - min(Ysrc));

% Coordonnées des coins du rectangle 
Ydst = [1, 1, h, h];
Xdst = [1, w, w, 1];

% Détermination de l'homographie
H = homographie(Xsrc, Ysrc, Xdst, Ydst);

% Extraction de l'image
imgExt = extraction(H, img, h, w);

%% Affichage de l'image extraite
subplot(1,2,2);
imshow(uint8(imgExt));  
title('Image extraite');