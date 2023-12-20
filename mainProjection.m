%% SALLMONE Armela, KEGL Noémie & MONY Alexandra
clear; close all; clc;

%% Initialisation
% Charger les images
img = double(imread('images/affichesimple.jpeg'));
poster = double(imread('images/poster.jpeg'));

%% Traitement
% Affichage de l'image
figure;
subplot(1, 2, 1);
imshow(uint8(img));
title('Selectionnez 4 points');

n = 4;
% Capture des 4 points
[Xdst, Ydst] = ginput(n);

% Affichez les points capturés sur l'image
hold on;
subplot(1, 2, 1);
scatter(Xdst, Ydst, 'r', 'filled');
hold off;

% Définir la taille du poster
[h, w, ~] = size(poster);

% Coordonnées des coins du poster
Ysrc = [1, 1, h, h];
Xsrc = [1, w, w, 1];

% Détermination de l'homographie
H = homographie(Xsrc, Ysrc,Xdst, Ydst );

% Projection de l'image
imgProj = projection(H, img, poster, Xdst, Ydst);

%% Affichage de l'image projetée
subplot(1, 2, 2);
imshow(uint8(imgProj));
title('Image projetée');