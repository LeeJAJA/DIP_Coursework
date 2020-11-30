function x=globalHistEqWithClip(I,bins,clipLimit)
    % ----------------
    % Parameters List:
    % I - the input image
    % bins - number of bins
    % clipLimit - value of bins

    [R,C]=size(I);
    I=double(I);
    count=double(zeros(1,bins+1));
    for i=1:R
        for j=1:C
            count(uint8(I(i,j)*bins./256)+1)=...
                count(uint8(I(i,j)*bins./256+1))+1;
        end
    end
    % Statistical probability of occurrence of each pixel value
    clipLimit=double(clipLimit*R*C);
    f=double(count);
    totalExcess = sum(max(f - clipLimit,0)); 
    avgBinIncr = floor(totalExcess/bins);
    upperLimit = clipLimit - avgBinIncr;
    for k=1:bins
      if f(k) > clipLimit
        f(k) = clipLimit;
      else
        if f(k) > upperLimit % high bin count
          totalExcess = totalExcess - (clipLimit - f(k));
          f(k) = clipLimit;
        else
          totalExcess = totalExcess - avgBinIncr;
          f(k) = f(k) + avgBinIncr;      
        end
      end
    end
    k = 1;
    while (totalExcess >= 0)
      %keep increasing the step as fewer and fewer pixels remain for
      %the redistribution (spread them evenly)
      stepSize = max(floor(bins/totalExcess),1);
      for m=k:stepSize:bins
        if f(m) < clipLimit*2
          f(m) = f(m)+1;
          totalExcess = totalExcess - 1; %reduce excess
          if totalExcess == 0
            break;
          end
        end
      end
      k = k+1; %prevent from always placing the pixels in bin #1
      if k > bins % start over if numBins was reached
        k = 1;
      end
    end
    
    f=double(f/(R * C));
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