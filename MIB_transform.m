function [MIBout] = MIB_transform(MIBin, H)
    %% Initialisation de MIBout.B
    X = [MIBin.xmin, MIBin.xmin, MIBin.xmax, MIBin.xmax];
    Y = [MIBin.ymin, MIBin.ymax, MIBin.ymin, MIBin.ymax];
    
    % Initialisation des coordonnées minimales et maximales de la zone d'intérêt de sortie
    MIBout.xmin = NaN;
    MIBout.ymin = NaN;
    MIBout.xmax = NaN;
    MIBout.ymax = NaN;

    % Transformation des coins de la zone d'intérêt initiale avec la matrice d'homographie
    for i = 1:4
        homog_coord = H * [X(i); Y(i); 1];
        XU = homog_coord(1) / homog_coord(3);
        YU = homog_coord(2) / homog_coord(3);
        MIBout.xmin = min(floor(XU), MIBout.xmin);
        MIBout.ymin = min(floor(YU), MIBout.ymin);
        MIBout.xmax = max(ceil(XU), MIBout.xmax);
        MIBout.ymax = max(ceil(YU), MIBout.ymax);
    end

    %% Initialisation de MIBout.M & MIBout.I
    % Calcul des dimensions de la nouvelle image résultante
    w = MIBout.xmax - MIBout.xmin + 1;
    h = MIBout.ymax - MIBout.ymin + 1;

    % Initialisation de la matrice M et de l'image I de sortie
    MIBout.M = zeros(h, w);
    MIBout.I = zeros(h, w, 3);

    % Parcours des pixels de la nouvelle image résultante
    for x = MIBout.xmin:MIBout.xmax
        for y = MIBout.ymin:MIBout.ymax
            % Appliquer la matrice d'homographie inverse aux coordonnées transformées
            homog_coord = inv(H) * [x; y; 1];
            XU = homog_coord(1) / homog_coord(3);
            YU = homog_coord(2) / homog_coord(3);

            % Vérifier que les coordonnées calculées sont à l'intérieur des dimensions de l'image d'origine
            if (round(YU) >= MIBin.ymin && round(YU) <= MIBin.ymax && round(XU) >= MIBin.xmin && round(XU) <= MIBin.xmax)
                % Remplir la matrice M et l'image I de sortie avec les valeurs de l'image d'entrée transformée
                MIBout.M(y - MIBout.ymin + 1, x - MIBout.xmin + 1) = MIBin.M(round(YU) - MIBin.ymin + 1, round(XU) - MIBin.xmin + 1);
                MIBout.I(y - MIBout.ymin + 1, x - MIBout.xmin + 1, :) = MIBin.I(round(YU) - MIBin.ymin + 1, round(XU) - MIBin.xmin + 1, :);
            end
        end
    end
end
