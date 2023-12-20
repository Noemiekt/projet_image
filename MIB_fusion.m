function [MIBout] = MIB_fusion(MIBin)
    % Cette fonction fusionne plusieurs structures MIB en une seule.

    % Nombre total de structures MIB en entrée
    n = numel(MIBin);

    %% Initialiser MIBout.B
    % Initialisation des coordonnées minimales et maximales de la zone d'intérêt de sortie
    MIBout.xmin = NaN;
    MIBout.xmax = NaN;
    MIBout.ymin = NaN;
    MIBout.ymax = NaN;

    % Parcours de toutes les structures MIB en entrée pour déterminer les coordonnées de la zone d'intérêt
    for i = 1:length(MIBin)
        MIBout.xmin = min(MIBout.xmin, MIBin{i}.xmin);
        MIBout.xmax = max(MIBout.xmax, MIBin{i}.xmax);
        MIBout.ymin = min(MIBout.ymin, MIBin{i}.ymin);
        MIBout.ymax = max(MIBout.ymax, MIBin{i}.ymax);
    end

    %% Déterminer le masque et l'image résultante
    % Calcul des dimensions de la nouvelle image résultante
    w = MIBout.xmax - MIBout.xmin + 1;
    h = MIBout.ymax - MIBout.ymin + 1;

    % Initialisation de la matrice M et de l'image I de sortie
    MIBout.M = zeros(h, w);
    MIBout.I = zeros(h, w, 3);

    % Parcours de toutes les structures MIB en entrée
    for i = 1:n
        % Calcul des indices pour copier la partie appropriée de chaque MIB dans MIBout
        xstart = MIBin{i}.xmin - MIBout.xmin + 1;
        xend = xstart + MIBin{i}.xmax - MIBin{i}.xmin;
        ystart = MIBin{i}.ymin - MIBout.ymin + 1;
        yend = ystart + MIBin{i}.ymax - MIBin{i}.ymin;

        % Ajout du masque et de l'image de la structure MIB à la structure de sortie
        MIBout.M(ystart:yend, xstart:xend) = MIBout.M(ystart:yend, xstart:xend) + MIBin{i}.M;
        MIBout.I(ystart:yend, xstart:xend, :) = MIBout.I(ystart:yend, xstart:xend, :) + MIBin{i}.I;
    end

    % Normalisation de l'image résultante par le masque
    MIBout.I = MIBout.I ./ MIBout.M;
end
