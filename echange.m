function  srcImageReconstruite = echange(HitoC,HjtoC,Hitoj, srcImage)


% Dimensions de l'image extraite
n = size(srcImage, 1);
m = size(srcImage, 2);


srcImageReconstruite = srcImage;

for i = 1:n
    disp(i);
    for j = 1:m
        
        % Appliquer la matrice d'homographie inverse aux coordonnées transformées
        homog_coord = HitoC * [j; i; 1];

        XU = homog_coord(1) / homog_coord(3);
        YU = homog_coord(2) / homog_coord(3);

        

        % Vérifier que les coordonnées calculées sont à l'intérieur des dimensions de l'image d'origine
        if (((XU<=1)&&(XU>=-1)) && ((YU<=1)&&(YU>=-1)))
            homog_coord2 = Hitoj * [j; i; 1];

            disp(j);

            XU2 = homog_coord2(1) / homog_coord2(3);
            YU2 = homog_coord2(2) / homog_coord2(3);

               
            srcImageReconstruite(i,j, :) = srcImage(round(YU2), round(XU2), :);

        end

        
    end
end

for i = 1:n
    disp(i);
    for j = 1:m
        % Appliquer la matrice d'homographie inverse aux coordonnées transformées
        homog_coord = HjtoC * [j; i; 1];

        XU = homog_coord(1) / homog_coord(3);
        YU = homog_coord(2) / homog_coord(3);

        

        % Vérifier que les coordonnées calculées sont à l'intérieur des dimensions de l'image d'origine
        if ((abs(XU)<=1) && (abs(YU)<=1))
            homog_coord2 = inv(Hitoj) * [j; i; 1];

            XU2 = homog_coord2(1) / homog_coord2(3);
            YU2 = homog_coord2(2) / homog_coord2(3);
            srcImageReconstruite(i,j, :) = srcImage(round(YU2), round(XU2), :);
        end

        
    end
end
end

