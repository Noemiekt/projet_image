%% SALLMONE Armela, KEGL Noémie & MONY Alexandra
%clear; close all; clc;

%% Chargement des Images Sources
img1 = double(imread('images/mosaique2-1.jpeg'));
img3 = double(imread('images/mosaique2-2.jpeg'));
img2 = double(imread('images/mosaique2-3.jpeg'));


%% Image plus sombre 
facteur = 0.5;
% Diminuer la luminosité
img3 = img3 * facteur;

%% Image bruitée (avec une bruit gaussien)
% Définir les paramètres du bruit gaussien
mean = 0;
variance = 1000;

% Générer le bruit gaussien
bruit_gaussien = sqrt(variance) * randn(size(img3)) + mean;

% Ajouter le bruit à l'image
img3 = img3 + bruit_gaussien;

%% Affichage des Images Sources
figure;
subplot(2, 2, 1);
imshow(uint8(img1));  
title('Image 1');

subplot(2, 2, 2);
imshow(uint8(img2));  
title('Image 2');

subplot(2, 2, 3);
imshow(uint8(img3));  
title('Image 3');



%% Sélection de Points Correspondants sur Chaque Image
n = 4; % Nombre de points à capturer pour chaque image

subplot(2, 2, 1);
[xa1, ya1] = ginput(n);

subplot(2, 2, 2);
[xa2, ya2] = ginput(n);

subplot(2, 2, 2); 
[xb1, yb1] = ginput(n);

subplot(2, 2, 3);
[xb2, yb2] = ginput(n);



%% Affichage des Points Sélectionnés sur Chaque Image
subplot(2, 2, 1);
hold on;
scatter(xa1, ya1, 'r', 'filled');
hold off;

subplot(2, 2, 2);
hold on;
scatter(xa2, ya2, 'r', 'filled');
scatter(xb1, yb1, 'r', 'filled');
hold off;

subplot(2, 2, 3);
hold on;
scatter(xb2, yb2, 'r', 'filled');
hold off;


%% Conversion des Images en Structure MIB
MIB1 = ItoMIB(img1);
MIB2 = ItoMIB(img2);
MIB3 = ItoMIB(img3);


%% Calcul des Matrices d'Homographie
H1to2 = homographie(xa1, ya1, xa2, ya2);
H2to3 = homographie(xb1, yb1, xb2, yb2);


%% Transformation des Structures MIB avec les Homographies
MIB2t = MIB_transform(MIB2, inv(H1to2));
MIB3t = MIB_transform(MIB3, inv(H1to2) * inv(H2to3));


%% Fusion des Structures MIB Transformées
MIBin = {MIB1, MIB2t, MIB3t};
MIBout = MIB_fusion(MIBin);

%% Affichage de l'Image Résultante
figure;
imagesc(uint8(MIBout.I));
title('Mosaïque finale');
