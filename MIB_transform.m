function [MIB2] = MIB_transform(MIB1,H)

    X = [MIB1.xmin, MIB1.xmin,MIB1.xmax, MIB1.xmax];
    Y = [MIB1.ymin; MIB1.ymax,MIB1.ymin, MIB1.ymax];

    

    XU = zeros(1,4);
    YU = zeros(1,4);

    
    for i = 1:4
        % Appliquer la matrice d'homographie inverse aux coordonnées transformées
        homog_coord = H* [X(i); Y(i); 1];

        XU(i) = homog_coord(1) / homog_coord(3);
        YU(i) = homog_coord(2) / homog_coord(3);

    end
     
    MIB2.xmin = min(floor(XU));
    MIB2.ymin = min(floor(YU));

    MIB2.xmax = max(ceil(XU));
    MIB2.ymax = max(ceil(YU));

    

    h = MIB2.xmax - MIB2.xmin + 1;

    MIB2.I = zeros(h,w);
    MIB2.M = zeros(h,w);

    for x = MIB2.xmin:MIB2.xmax
        for y = MIB2.xmax:MIB2.ymax

            homog_coord = inv(H)* [x; y; 1];

            XU = homog_coord(1) / homog_coord(3);
            YU = homog_coord(2) / homog_coord(3);

            if (((XU<=MIB1.xmax)&&(XU>=MIB1.xmin) && ((YU<=MIB1.ymax)&&(YU>=MIB1.ymin))))

                MIB2.M(x - MIB2.xmin +1 , y - MIB2.ymin +1) = 1;
                MIB2.I(x - MIB2.xmin +1 , y - MIB2.ymin +1, :) = MIB1.I(YU - MIB1.xmin +1, XU - MIB1.ymin +1, :);
    
            end
            

        end
    end

end

