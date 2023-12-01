function H = identification(x, y, rectangle_x, rectangle_y)
    % % Estimer l'homographie
    % tform = fitgeotrans([x', y'], [rectangle_x', rectangle_y'], 'projective');
    % 
    % % Obtenir la matrice d'homographie
    % H = tform.T;

    A = [];
    B = [];

    for i = 1:4
        A = [A;
             x(i) y(i) 1 0 0 0 rectangle_x(i)*x(i) rectangle_x(i)*y(i);
             0 0 0 x(i) y(i) 1 -x(i)*rectangle_y(i) -rectangle_y(i)*y(i)];
    end

    for i = 1:4
        B = [B;
             rectangle_x(i)
             rectangle_y(i)];
    end

    H = A\B;

    % Redimensionner H pour le rendre 3x3
    H = reshape([H; 1], 3, 3)';
end