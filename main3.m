clear; close all;

%% Sallmone Armela, Kegl Noémie, Mony Alexandra 

% Main script to perform image extraction using homography

% Load the source image 
image1 = imread('images/image1.png');
image2 = imread('images/image2.png');

figure;
subplot(1, 2, 1);
imshow(image1);
title('Image 1');

subplot(1, 2, 2);
imshow(image2);
title('Image 2');

% n = 4; % Nombre de points à capturer pour chaque image
% 
% % Capturez 4 points de la première image
% subplot(1, 2, 1);
% [x1, y1] = ginput(n);
% 
% % Capturez 4 points de la deuxième image
% subplot(1, 2, 2);
% [x2, y2] = ginput(n);
% 
% % Affichez les points capturés sur la première image
% subplot(1, 2, 1);
% hold on;
% scatter(x1, y1, 'r', 'filled');
% hold off;
% 
% % Affichez les points capturés sur la deuxième image
% subplot(1, 2, 2);
% hold on;
% scatter(x2, y2, 'r', 'filled');
% hold off;

% Homography matrix 
x1=[290, 646,646,290];
x2=[11, 361,361,11];
y1=[330,330,420,420];
y2=[9,9,100,100];

H1to2=homographie(x1, y1, x2, y2);


% Dimensions de l'image extraite
n = size(image2, 1);
m = size(image2, 2);


image1rec = image1;

for i = 1:n
    for j = 1:m
        % Appliquer la matrice d'homographie inverse aux coordonnées transformées
        homog_coord = inv(H1to2) * [j; i; 1];

        XU = homog_coord(1) / homog_coord(3);
        YU = homog_coord(2) / homog_coord(3);

        image1rec(round(YU), round(XU), :) = image2(i,j, :);

    end
end


% Afficher l'image résultante
figure;
imshow(image1rec);
title('Image avec la portion extraite réintégrée');











 




