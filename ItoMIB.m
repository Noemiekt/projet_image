function [MIB] = ItoMIB(I)

    [h,w, ~]=size(I);
    MIB.M = ones(h,w);

    MIB.I = I;

    MIB.x_min = 1;
    MIB.y_min = 1;
    MIB.x_max = h;
    MIB.y_max = w;


end

