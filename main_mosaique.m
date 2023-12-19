% clear; close all;
% 
% %% Sallmone Armela, Kegl Noémie, Mony Alexandra 
% 
% % Main script to perform image extraction using homography
% 
% % Load the source image 
% image1 = imread('images/image1.png');
% image2 = imread('images/image2.png');
% 
% figure;
% subplot(1, 2, 1);
% imshow(image1);
% title('Image 1');
% 
% subplot(1, 2, 2);
% imshow(image2);
% title('Image 2');
% 
% % n = 4; % Nombre de points à capturer pour chaque image
% % 
% % % Capturez 4 points de la première image
% % subplot(1, 2, 1);
% % [x1, y1] = ginput(n);
% % 
% % % Capturez 4 points de la deuxième image
% % subplot(1, 2, 2);
% % [x2, y2] = ginput(n);
% % 
% % % Affichez les points capturés sur la première image
% % subplot(1, 2, 1);
% % hold on;
% % scatter(x1, y1, 'r', 'filled');
% % hold off;
% % 
% % % Affichez les points capturés sur la deuxième image
% % subplot(1, 2, 2);
% % hold on;
% % scatter(x2, y2, 'r', 'filled');
% % hold off;
% 
% % Homography matrix 
% x1=[290, 646,646,290];
% x2=[11, 361,361,11];
% y1=[330,330,420,420];
% y2=[9,9,100,100];
% 
% H=homographie(x1, y1, x2, y2);
% 
% 
% % Dimensions de l'image extraite
% n = size(image2, 1);
% m = size(image2, 2);
% 
% 
% image1rec = image1;
% 
% MIB_img1 = ItoMIB(image1);
% MIB_img2 = MIB_transform(MIB_img1, H);
% 
% MIB(1) = MIB_img1;
% MIB(2) = MIB_img2;
% MIB = ceil(MIB(1), MIB(2));
% MIB_out = MIB_fusion(MIB);
% 
% 
% 
% 
% % Afficher l'image résultante
% figure;
% imshow(MIB_out);
% title('Image avec la portion extraite réintégrée');
% 
% clear; close all;

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


MIB1=ItoMIB(image1);
MIB2=ItoMIB(image2);

MIB2_trans=MIB_transform(MIB1,H1to2);

maCellule = cell(1, 2);

MIBin=cell(1);

MIBin{1}=MIB1;
MIBin{2}=MIB2_trans;

MIBout=MIB_fusion(MIBin);



% Afficher l'image résultante
figure;
imshow(MIBout.I);
title('Image avec la portion extraite réintégrée');











 

