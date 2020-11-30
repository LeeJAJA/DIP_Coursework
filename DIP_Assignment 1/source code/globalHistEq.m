function x=globalHistEq(I,bins)
    % ----------------
    % Parameters List:
    % I - the input image
    % bins - number of bins

    [R,C]=size(I);
    I=double(I);
    count=double(zeros(bins+1));
    for i=1:R
        for j=1:C
            count(uint8(I(i,j)*bins./256)+1)=...
                count(uint8(I(i,j)*bins./256+1))+1;
        end
    end
    % Statistical probability of occurrence of each pixel value
    f=double(count/(R * C)); 
    
    % Find the cumulative probability to obtain a cumulative histogram.
    for i=2:bins
        f(i)=f(i-1) + f(i);
    end
    % Complete the mapping for each pixel
    f=f*255;
    for i=1:R
        for j=1:C
            I(i,j)=f(uint8(I(i,j)*bins./256)+1);
        end
    end
    % Return the value
    x=uint8(I);
end