%% SALLMONE Armela, KEGL Noémie & MONY Alexandra
clear; close all; clc;

%% Initialisation
% Charger l'image
img = imread('images/muraffiches.jpeg');

% Carré de base :
XSquare = [-1, 1, 1, -1]; % Dest points in X
YSquare = [-1, -1, 1, 1]; % Dest points in Y

% Affichage de l'image originale
figure;
subplot(1, 2, 1);
imshow(img);  
title('Image 1');

% Nombre de points à capturer pour chaque image
n = 4;

% Capturez 4 points de la première image
subplot(1, 2, 1);
[x1, y1] = ginput(n);

% Capturez 4 points de la deuxième image
subplot(1, 2, 1);
[x2, y2] = ginput(n);

% Affichez les points capturés sur la première image
subplot(1, 2, 1);
hold on;
scatter(x1, y1, 'r', 'filled');
hold off;

% Affichez les points capturés sur la deuxième image
subplot(1, 2, 1);
hold on;
scatter(x2, y2, 'r', 'filled');
hold off;

% Calcul des matrices d'homographie
H1toC = homographie(x1, y1, XSquare, YSquare);
H2toC = homographie(x2, y2, XSquare, YSquare);
H1to2 = homographie(x1, y1, x2, y2);

% Application de l'échange
srcImageReconstruite = echange(H1toC, H2toC, H1to2, img);

%% Affichage
subplot(1, 2, 2);
imshow(srcImageReconstruite);
title('Image avec la portion extraite réintégrée');