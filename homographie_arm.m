function [H] = homographie_arm(XU, YU, XR, YR)

    % J'ai 4 points 

    A = [XU(1) YU(1) 1 0 0 0 -XU(1)*XR(1) -YU(1)*XR(1);
             0 0 0 XU(1) YU(1) 1 -XU(1)*YR(1) -YU(1)*YR(1);
             XU(2) YU(2) 1 0 0 0 -XU(2)*XR(2) -YU(2)*XR(2);
             0 0 0 XU(2) YU(2) 1 -XU(2)*YR(2) -YU(2)*YR(2);
             XU(3) YU(3) 1 0 0 0 -XU(3)*XR(3) -YU(3)*XR(3);
             0 0 0 XU(3) YU(3) 1 -XU(3)*YR(3) -YU(3)*YR(3);
             XU(4) YU(4) 1 0 0 0 -XU(4)*XR(4) -YU(4)*XR(4);
             0 0 0 XU(4) YU(4) 1 -XU(4)*YR(4) -YU(4)*YR(4);];
    
    B = [XR(1); YR(1); XR(2); YR(2); XR(3); YR(3); XR(4); YR(4)];

    X = A\B;

    H = [X(1) X(2) X(3) ; X(4) X(5) X(6) ; X(7) X(8) 1];

end

