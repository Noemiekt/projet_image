function [H, Hform] = homographie_arm(XU, YU, XR, YR)
    
    % Estimer l'homographie
    tform = fitgeotrans([XU', YU'], [XR', YR'], 'projective');

    % Obtenir la matrice d'homographie
    Hform = tform.T;
    
    A = zeros(8, 8);
    B = zeros(8, 1);
    
    for i = 1:4
        A(2*i-1, :) = [XU(i), YU(i), 1, 0, 0, 0, -XU(i)*XR(i), -YU(i)*XR(i)];
        A(2*i, :) = [0, 0, 0, XU(i), YU(i), 1, -XU(i)*YR(i), -YU(i)*YR(i)];
        B(2*i-1) = XR(i);
        B(2*i) = YR(i);
    end
    
    X = A\B;
    H = reshape([X; 1], 3, 3);
end

