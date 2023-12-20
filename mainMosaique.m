%% SALLMONE Armela, KEGL Noémie & MONY Alexandra
clear; close all; clc;

%% Chargement et Affichage des Images Sources
img1 = double(imread('images/mosaique1.jpeg'));
img2 = double(imread('images/mosaique2.jpeg'));
img3 = double(imread('images/mosaique3.jpeg'));
img4 = double(imread('images/mosaique4.jpeg'));

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

subplot(2, 2, 4);
imshow(uint8(img4));  
title('Image 4');

%% Sélection de Points Correspondants sur Chaque Image
n = 4; % Nombre de points à capturer pour chaque image

subplot(2, 2, 1);
[xa1, ya1] = ginput(n);

subplot(2, 2, 2);
[xa2, ya2] = ginput(n);

subplot(2, 2, 4); % Correction du sous-plot ici
[xb1, yb1] = ginput(n);

subplot(2, 2, 3);
[xb2, yb2] = ginput(n);

subplot(2, 2, 3);
[xc1, yc1] = ginput(n);

subplot(2, 2, 4);
[xc2, yc2] = ginput(n);

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
scatter(xc1, yc1, 'r', 'filled');
hold off;

subplot(2, 2, 4);
hold on;
scatter(xc2, yc2, 'r', 'filled');
hold off;

%% Conversion des Images en Structure MIB
MIB1 = ItoMIB(img1);
MIB2 = ItoMIB(img2);
MIB3 = ItoMIB(img3);
MIB4 = ItoMIB(img4);

%% Calcul des Matrices d'Homographie
H1to2 = homographie(xa1, ya1, xa2, ya2);
H2to3 = homographie(xb1, yb1, xb2, yb2);
H3to4 = homographie(xc1, yc1, xc2, yc2);

%% Transformation des Structures MIB avec les Homographies
MIB2t = MIB_transform(MIB2, inv(H1to2));
MIB3t = MIB_transform(MIB3, inv(H1to2) * inv(H2to3));
MIB4t = MIB_transform(MIB4, inv(H1to2) * inv(H2to3) * inv(H3to4));

%% Fusion des Structures MIB Transformées
MIBin = {MIB1, MIB2t, MIB3t, MIB4t};
MIBout = MIB_fusion(MIBin);

%% Affichage de l'Image Résultante
figure;
imagesc(uint8(MIBout.I));
title('Mosaïque finale');
