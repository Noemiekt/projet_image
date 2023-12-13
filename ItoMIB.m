function [MIB] = ItoMIB(I)

    [h,w, ~]=size(I);
    MIB.M = ones(h,w);

    MIB.I = I;

    MIB.xmin = 1;
    MIB.ymin = 1;
    MIB.xmax = h;
    MIB.ymax = w;


end

