function [img] = projection(H, img, poster, Xdst, Ydst)
    % Cette fonction applique une homographie H pour remplacer une partie de l'image
    % par le contenu d'une autre image (mode "projection").
    %
    % Paramètres :
    %   - H : Matrice d'homographie
    %   - img : Image de destination à modifier
    %   - poster : Image source à projeter sur l'image de destination
    %   - Xdst, Ydst : Coordonnées des points dans l'image destination

    %% Initialisation
    [h, w, ~] = size(poster);
    xmax = max(Xdst);
    xmin = min(Xdst);
    ymax = max(Ydst);
    ymin = min(Ydst);

    %% Traitement
    % Parcours du poster
    for xr = 1:w
        for yr = 1:h
            % Homographie
            Hcoord = H * [xr; yr; 1];
            ximg = round(Hcoord(1) / Hcoord(3));
            yimg = round(Hcoord(2) / Hcoord(3));

            % Copie des données
            if (ximg >= xmin && ximg <= xmax && yimg >= ymin && yimg <= ymax)
                img(yimg, ximg, :) = poster(yr, xr, :);
            end
        end
    end
end
