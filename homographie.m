function [H] = homographie(Xsrc, Ysrc, Xdst, Ydst)
    % Cette fonction calcule la matrice d'homographie H à partir de points correspondants
    % dans l'image source (Xsrc, Ysrc) et l'image destination (Xdst, Ydst).

    % Initialisation des matrices A et B
    A = zeros(8, 8);
    B = zeros(8, 1);

    % Boucle sur les quatre points correspondants
    for i = 1:4
        % Construction de la matrice A avec les points correspondants
        A(2*i-1, :) = [Xsrc(i), Ysrc(i), 1, 0, 0, 0, -Xsrc(i)*Xdst(i), -Ysrc(i)*Xdst(i)];
        A(2*i, :) = [0, 0, 0, Xsrc(i), Ysrc(i), 1, -Xsrc(i)*Ydst(i), -Ysrc(i)*Ydst(i)];

        % Construction de la matrice B avec les points de destination
        B(2*i-1) = Xdst(i);
        B(2*i) = Ydst(i);
    end

    % Résolution du système d'équations linéaires pour obtenir X (AX = B)
    X = A\B;

    % Reshape de la solution en une matrice 3x3 et ajout d'un 1 à la fin
    H = reshape([X; 1], 3, 3)';
end
