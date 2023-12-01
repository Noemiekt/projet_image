function [extractedImg] = extraction(invH, sourceImg, h,w)
    
    % [sourceH, sourceW] = size(sourceImg);
    % 
    % % Créez une grille de coordonnées pour l'image extraite
    % [X, Y] = meshgrid(1:w, 1:h);
    % 
    % % Appliquez la transformation (inversée) à toutes les coordonnées en une seule opération
    % coords = invH * [X(:)'; Y(:)'; ones(1, h*w)];
    % 
    % % Convertissez les coordonnées transformées en coordonnées d'indice
    % x2 = floor(coords(3, :) ./ coords(1, :));
    % y2 = floor(coords(3, :) ./ coords(2, :));
    % 
    % % Initialisez l'image extraite avec des zéros
    % extractedImg = zeros(h, w);
    % 
    % % Remplissez l'image extraite avec les pixels valides de l'image source
    % for i = 1:length(x2)
    %     if x2(i) >= 1 && x2(i) <= sourceW && y2(i) >= 1 && y2(i) <= sourceH
    %         extractedImg(Y(i), X(i)) = sourceImg(y2(i), x2(i));
    %     end
    % end
    
    for x=1:w
	    for y=1:h
		    % Appliquer la transformation (inversée)
            M2 = invH * [x; y; 1];
            x2 = floor(M2(1)/M2(3));
            y2 = floor(M2(2)/M2(3));

		    extractedImg(y,x) = sourceImg(y2,x2);

	    end
    end


end

