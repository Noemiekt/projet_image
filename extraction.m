function [extractedImg] = extraction(invH, sourceImg, extractedImg)
    
    [h, w] = size(extractedImg);
    
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

