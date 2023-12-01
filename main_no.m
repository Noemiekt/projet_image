clear; close all; clc;

%% Initialisation

% Charger l'image
img = imread('tab.jpg');

% initialisation des tailles du rectangle
w = 500;
h = 1000;

%% Code

% Afficher l'image
imshow(img);
title('Cliquez sur les côtés du poster');

% Obtenir les coordonnées des quatre clics
coords = ginput(4); 

% Coordonnées des coins du quadrangle (dans l'ordre : haut gauche, haut droit, bas droit, bas gauche)
x = [coords(1,1), coords(2,1), coords(3,1), coords(4,1)];
y = [coords(1,2), coords(2,2), coords(3,2), coords(4,2)];

% Coordonnées des coins du rectangle 
rectangle_x = [1, 1, h, h];
rectangle_y = [1, w, w, 1];

% Appeler la fonction "identification" pour obtenir la matrice d'homographie
H = identification(x, y, rectangle_x, rectangle_y);

% Transformer les coins du rectangle initial en fonction de l'homographie
transformed_rectangle = [rectangle_x; rectangle_y; ones(1, 4)];
transformed_rectangle = H * transformed_rectangle;

% Diviser par la coordonnée Z pour obtenir les coordonnées homogènes
transformed_rectangle = transformed_rectangle ./ transformed_rectangle(3, :);

% Extraire les coordonnées x et y du rectangle transformé
transformed_x = transformed_rectangle(1, :);
transformed_y = transformed_rectangle(2, :);

% Extraire la région du rectangle transformé depuis l'image d'origine
xmin = min(transformed_x);
xmax = max(transformed_x);
ymin = min(transformed_y);
ymax = max(transformed_y);

% Obtenir les dimensions de la région du rectangle transformé
region_width = xmax - xmin + 1;
region_height = ymax - ymin + 1;

% Utiliser la fonction imcrop pour extraire la région du rectangle transformé
extracted_region = imcrop(img, [xmin, ymin, region_width - 1, region_height - 1]);


%% Affichage

disp('Coordonnées des clics :');
disp(coords);

% Afficher la région extraite
figure;
imshow(extracted_region);
title('Contenu du rectangle transformé (sans imwarp, méthode simple)');



% % Créer une transformation géométrique à partir de la matrice d'homographie
% tform = projective2d(H);
% 
% % Définir les dimensions du rectangle parallèle aux axes
% outputWidth = h;
% outputHeight = w;
% 
% % Appliquer l'homographie pour extraire le contenu du quadrangle
% quadrangle = imwarp(img, tform, 'OutputView', imref2d([outputHeight, outputWidth]));
% 
% 
% %% Affichage
% 
% disp('Coordonnées des clics :');
% disp(coords);
% 
% % Afficher le contenu du quadrangle extrait
% figure;
% imshow(quadrangle);
% title('Poster extrait avec homographie');

