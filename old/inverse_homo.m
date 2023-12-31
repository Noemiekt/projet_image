function [srcImageReconstruite] = inverse_homo(XR, YR, H, extractedImg, srcImage)

% XR, YR: les coordonnées dans l'image transformée extractImg
% H: la matrice d'homographie inverse
% XU, YU: les coordonnées dans l'image d'origine

% Inverse de la matrice d'homographie
H_inverse = inv(H);

% Dimensions de l'image extraite
n = size(extractedImg, 1);
m = size(extractedImg, 2);


srcImageReconstruite = srcImage;

for i = 1:n
   
    for j = 1:m
       
        % Appliquer la matrice d'homographie inverse aux coordonnées transformées
        homog_coord = H_inverse * [j; i; 1];

        XU = homog_coord(1) / homog_coord(3);
        YU = homog_coord(2) / homog_coord(3);

        % Copier la valeur du pixel de l'image extraite dans l'image de destination
        srcImageReconstruite(round(YU), round(XU), :) = extractedImg(i, j, :);
        
    end
end

end