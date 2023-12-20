function imgRec = echange(H1toC, H2toC, H1to2, img)
    % Cette fonction réalise un échange entre deux quadrangles présents dans une image
    % au moyen d'un carré intermédiaire (mode "projections croisées").
    %
    % Paramètres :
    %   - H1toC : Matrice d'homographie de la première image vers le carré intermédiaire
    %   - H2toC : Matrice d'homographie de la deuxième image vers le carré intermédiaire
    %   - H1to2 : Matrice d'homographie entre la première et la deuxième image
    %   - img : Image source

    % Dimensions de l'image extraite
    [h,w,~]=size(img);

    % Image reconstruite, initialement égale à l'image source
    imgRec = img;

    % Partie de la première image vers le carré intermédiaire
    for x = 1:w
        for y = 1:h
            % Appliquer la matrice d'homographie inverse aux coordonnées transformées
            homog_coord = H1toC * [x; y; 1];
            XU = homog_coord(1) / homog_coord(3);
            YU = homog_coord(2) / homog_coord(3);

            % Vérifier que les coordonnées calculées sont à l'intérieur des dimensions de l'image d'origine
            if (((XU <= 1) && (XU >= -1)) && ((YU <= 1) && (YU >= -1)))
                homog_coord2 = H1to2 * [x; y; 1];
                XU2 = homog_coord2(1) / homog_coord2(3);
                YU2 = homog_coord2(2) / homog_coord2(3);
                imgRec(y, x, :) = img(round(YU2), round(XU2), :);
            end
        end
    end

    % Partie de la deuxième image vers le carré intermédiaire
    for x = 1:w
        for y = 1:h
            % Appliquer la matrice d'homographie inverse aux coordonnées transformées
            homog_coord = H2toC * [x; y; 1];
            XU = homog_coord(1) / homog_coord(3);
            YU = homog_coord(2) / homog_coord(3);

            % Vérifier que les coordonnées calculées sont à l'intérieur des dimensions de l'image d'origine
            if ((abs(XU) <= 1) && (abs(YU) <= 1))
                homog_coord2 = inv(H1to2) * [x; y; 1];
                XU2 = homog_coord2(1) / homog_coord2(3);
                YU2 = homog_coord2(2) / homog_coord2(3);
                imgRec(y, x, :) = img(round(YU2), round(XU2), :);
            end
        end
    end
end