function [MIB] = ItoMIB(I)
    % Cette fonction convertit une image en une structure MIB.

    % Extraction des dimensions de l'image (hauteur, largeur, nombre de canaux de couleur)
    [h, w, ~] = size(I);

    % Initialisation d'une matrice M avec des 1 de la même taille que l'image
    MIB.M = ones(h, w);

    % Assignation de l'image à la structure MIB
    MIB.I = I;

    % Définition des coordonnées minimales et maximales de la zone d'intérêt
    MIB.xmin = 1;
    MIB.ymin = 1;
    MIB.xmax = w;
    MIB.ymax = h;
end

