clear; close all; clc;

%% Initialisation

% Charger l'image
img = imread('images.jpeg');

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

H = homographie_arm(x, y, rectangle_x, rectangle_y);

% transformed_rectangle = [rectangle_x; rectangle_y; ones(1, 4)];
% transformed_rectangle = H * transformed_rectangle;
% 
% transformed_rectangle = transformed_rectangle ./ transformed_rectangle(3, :);
% 
% transformed_x = transformed_rectangle(1, :);
% transformed_y = transformed_rectangle(2, :);
% 
% xmin = min(transformed_x);
% xmax = max(transformed_x);
% ymin = min(transformed_y);
% ymax = max(transformed_y);
% 
% region_width = xmax - xmin + 1;
% region_height = ymax - ymin + 1;
% 
% extracted_region = imcrop(img, [xmin, ymin, region_width - 1, region_height - 1]);
% 
% 
% % Affichage
% 
% disp('Coordonnées des clics :');
% disp(coords);
% 
% % Afficher la région extraite
% figure;
% imshow(extracted_region);
% title('Contenu du rectangle transformé');



% Créer une transformation géométrique à partir de la matrice d'homographie
tform = projective2d(H);

% % Définir les dimensions du rectangle parallèle aux axes
% outputWidth = h;
% outputHeight = w;

% Appliquer l'homographie pour extraire le contenu du quadrangle
% quadrangle = imwarp(img, tform, 'OutputView', imref2d([w, h]));
quadrangle = extraction(inv(H), img, h, w);


%% Affichage

disp('Coordonnées des clics :');
disp(coords);

% Afficher le contenu du quadrangle extrait
figure;
imshow(quadrangle);
% title('Poster extrait avec homographie');

