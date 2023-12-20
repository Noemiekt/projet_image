function [imgExt] = extraction(H, img, h, w)
    % Cette fonction prend une homographie H, une image img, et les dimensions h et w
    % Elle extrait une région de l'image transformée par H pour former une nouvelle image imgExt.

    % Initialisation d'une nouvelle image
    imgExt = zeros(h, w, 3);

    % Parcours du rectangle d'arrivée
    for xr = 1:w
        for yr = 1:h
            % Transformation inverse par l'homographie
            Hcoord = inv(H) * [xr; yr; 1];
            ximg = Hcoord(1) / Hcoord(3);
            yimg = Hcoord(2) / Hcoord(3);

            % Copie des données de l'image transformée vers l'image extraite
            imgExt(yr, xr, :) = img(round(yimg), round(ximg), :);
        end
    end
end
