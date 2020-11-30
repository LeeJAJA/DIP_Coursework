function out=myBilinear(img,M)
    % this function inplements bilinear interpolation.
    % ----------------
    % Parameters List:
    % img - the input image
    % M - size of output image

    [R,C]=size(img);
    
    % set the padding
    img(R+1,C+1)=img(R,C);
    img(R+1,:)=img(R,:);
    img(:,C+1)=img(:,C);
    
    % apply the body of the algorithm.
    out=zeros(M,M);
    for x=1:M
        for y=1:M
            X=(x-1)*(R-1)/(M-1)+1;
            Y=(y-1)*(C-1)/(M-1)+1;
            % get the four nearest pixel coordinates of the pixel 
            x1=floor(X);
            x2=x1+1;
            y1=floor(Y);
            y2=y1+1;
            % gets the nearest four pixel values of the pixel
            Q11=img(x1,y1);
            Q12=img(x1,y2);
            Q21=img(x2,y1);
            Q22=img(x2,y2);
            
            out(x,y)=(Q11*(x2-X)*(y2-Y)+Q12*(x2-X)*(Y-y1)+ ...
                Q21*(X-x1)*(y2-Y)+Q22*(X-x1)*(Y-y1))/(x2-x1)/(y2-y1);
        end
    end
    
end

