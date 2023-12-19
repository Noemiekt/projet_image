clear; close all;

%% Sallmone Armela, Kegl Noémie, Mony Alexandra 

% Main script to perform image extraction using homography

% Load the source image 
image1 = double(imread('images/jaune1.png'));
image2 = double(imread('images/jaune2.png'));

figure;
subplot(1, 2, 1);
imshow(image1/255);  % Normaliser les valeurs entre 0 et 1 pour afficher correctement
title('Image 1');

subplot(1, 2, 2);
imshow(image2/255);  % Normaliser les valeurs entre 0 et 1 pour afficher correctement
title('Image 2');

n = 4; % Nombre de points à capturer pour chaque image

% Capturez 4 points de la première image
subplot(1, 2, 1);
[x1, y1] = ginput(n);

% Capturez 4 points de la deuxième image
subplot(1, 2, 2);
[x2, y2] = ginput(n);

% Affichez les points capturés sur la première image
subplot(1, 2, 1);
hold on;
scatter(x1, y1, 'r', 'filled');
hold off;

% Affichez les points capturés sur la deuxième image
subplot(1, 2, 2);
hold on;
scatter(x2, y2, 'r', 'filled');
hold off;



H1to2=homographie(x1, y1, x2, y2);

%H= [cos(pi/3) -sin(pi/3) 0; sin(pi/3) cos(pi/3) 0; 0 0 1];
MIB1=ItoMIB(image1);
MIB2=ItoMIB(image2);

MIB1_trans=MIB_transfoAlex(MIB1,H1to2);



MIBin={MIB2,MIB1_trans};

MIBout=MIB_fusion(MIBin);



% Afficher l'image résultante
figure;
imshow(MIB1_trans.M);
title('Image avec la portion extraite réintégrée');

figure;
imagesc(uint8(MIB1_trans.I));
title('Image avec la portion extraite réintégrée');

figure;
imagesc(uint8(MIBout.M));
title('Image avec la portion extraite réintégrée');

figure;
imagesc(uint8(MIBout.I));
title('Image avec la portion extraite réintégrée');









 




