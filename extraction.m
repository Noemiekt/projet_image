function [extractedImg] = extraction(invH,sourceImg,h,w)

    % Function to extract a region from a source image using the inverse homography matrix
    % invH: Inverse homography matrix
    % sourceImg: The source image from which to extract the region
    % h, w: Height and width of the target (extracted) image

    % Initialize the extracted image with zeros. It has the same number of color channels as the source image.
    extractedImg = zeros(h, w, size(sourceImg, 3), 'like', sourceImg);

    for x = 1:w
        for y = 1:h
            % Apply invH to each pixel
            M = invH * double([x; y; 1]);
            
            % For each pixel in the target image, compute the corresponding
            % coordinates in the source image by applying invH
            x2 = round(M(1)/M(3));
            y2 = round(M(2)/M(3));

            % Copy the pixel value from the source image to the extracted image
            extractedImg(y, x, :) = sourceImg(y2, x2, :);
        end
    end

end

