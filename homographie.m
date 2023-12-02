function [H] = homographie(XU, YU, XR, YR)

% XU, YU: coordinates in the untransformed image
% XR, YR: coordinates in the transformed image
% H: homography matrix

    A = zeros(8, 8);
    B = zeros(8, 1);

    for i = 1:4
        % Construct A using the correspondance points 
        A(2*i-1, :) = [XU(i), YU(i), 1, 0, 0, 0, -XU(i)*XR(i), -YU(i)*XR(i)];
        A(2*i, :) = [0, 0, 0, XU(i), YU(i), 1, -XU(i)*YR(i), -YU(i)*YR(i)];

        % Construct B using destination points
        B(2*i-1) = XR(i);
        B(2*i) = YR(i);
    end

    % Solve for X using AX = B to define the elements of H matrix
    X = A\B;

    % Reshape the solution into a 3x3 matrix and add 1 at the end
    H = reshape([X; 1], 3, 3)';
end


