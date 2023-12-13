function [MIBout] = MIB_fusion(MIBin)

n=size(MIBin);

%% Initialiser MIBout.B

MIBout.xmin=NaN;
MIBout.xmax=NaN;
MIBout.ymin=NaN;
MIBout.ymax=NaN;

for i = 1:length(MIBin)
    MIBout.xmin=min(MIBout.xmin,MIBin{i}.xmin);
    MIBout.xmax=max(MIBout.xmax,MIBin{i}.xmax);
    MIBout.ymin=min(MIBout.ymin,MIBin{i}.ymin);
    MIBout.ymax=max(MIBout.ymax,MIBin{i}.ymax);
end

%% Déterminer le masque et l'image résultante
h = MIBout.xmax - MIBout.xmin + 1;
w = MIBout.ymax - MIBout.ymin + 1;

MIBout.M=zeros(h,w);
MIBout.I=zeros(h,w);

for i=1:n
    xstart=MIBin{i}.xmin-MIBout.xmin+1;
    xend=xstart+MIBin{i}.xmax-MIBin{i}.xmin-1;
    ystart=MIBin{i}.ymin-MIBout.ymin+1;
    yend=ystart+MIBin{i}.ymax-MIBin{i}.ymin-1;
    MIBout.M(xstart:xend, ystart:yend) = MIBout.M(xstart:xend, ystart:yend) + MIBin{i}.M;
    MIBout.I(xstart:xend, ystart:yend) = MIBout.I(xstart:xend, ystart:yend) + MIBin{i}.I;

end

MIBout.I=MIBout.I/MIBout.M;

end

