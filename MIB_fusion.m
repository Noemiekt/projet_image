function [MIBout] = MIB_fusion(MIBin)

n=numel(MIBin);

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
w = MIBout.xmax - MIBout.xmin + 1;
h = MIBout.ymax - MIBout.ymin + 1;

MIBout.M=zeros(h,w);
MIBout.I=zeros(h,w,3);


for i=1:n
    disp("i"+i);
    xstart=MIBin{i}.xmin-MIBout.xmin+1;
    xend=xstart+MIBin{i}.xmax-MIBin{i}.xmin;
    ystart=MIBin{i}.ymin-MIBout.ymin+1;
    yend=ystart+MIBin{i}.ymax-MIBin{i}.ymin;

    disp(size(MIBout.M(ystart:yend,xstart:xend)));
    disp(size(MIBout.M( ystart:yend,xstart:xend)));
    disp(size(MIBin{i}.M));

    MIBout.M(ystart:yend,xstart:xend) = MIBout.M( ystart:yend,xstart:xend) + MIBin{i}.M;
    MIBout.I(ystart:yend,xstart:xend,: ) = MIBout.I( ystart:yend,xstart:xend,:) + MIBin{i}.I;

end

MIBout.I=MIBout.I./MIBout.M;

end

