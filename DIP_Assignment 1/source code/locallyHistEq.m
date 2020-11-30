function x=locallyHistEq(I,Tile,step,clipLimit)
    % ----------------
    % Parameters List:
    % I - the input image
    % Tile - a list with two integer, indicates the  NUMBER of 
    % TILES along the length and width
    % step - Partially overlapping moves are used, and STEP is a ratio
    % relative to each tile
    
    I=double(I);
    [R,C]=size(I);
    kx=round(R./Tile(1));
    ky=round(C./Tile(2));
    xStep=round(step*kx);
    yStep=round(step*ky);
    out=zeros(R,C);
    t=zeros(R,C);
    %Record the number of times each pixel is averaged.
    
    for x1 = 1:xStep:R
        for y1 = 1:yStep:C
            x2=min(x1+kx-1,R);
            y2=min(y1+ky-1,C);
            vals=double(globalHistEqWithClip(I(x1:x2,y1:y2),256,clipLimit));
            out(x1:x2,y1:y2)=out(x1:x2,y1:y2)+vals;
            t(x1:x2,y1:y2)=t(x1:x2,y1:y2)+1;
        end
    end
    out=myBilinear(out,R);
    x=uint8(out./t);
end