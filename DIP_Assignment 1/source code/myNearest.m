function out=myNearest(img,M)
    % this function implements nearest neighbor interpolation.
    % ----------------
    % Parameters List:
    % img - the input image
    % M - size of output image
    
    [R,C]=size(img);
    
    % apply the body of the algorithm.
    out=zeros(M,M);
    for x=1:M
        for y=1:M
            % assign the nearest pixel value to the pixel.
            out(x,y)=img(round((x-1)*(R-1)/(M-1))+1,round((y-1)*(C-1)/(M-1))+1);
        end
    end
end