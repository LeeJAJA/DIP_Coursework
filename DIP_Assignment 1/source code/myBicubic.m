function out=myBicubic(img,M)
    % this function inplements bicubic interpolation.
    % ----------------
    % Parameters List:
    % img - the input image
    % M - size of output image
    
    [R,C]=size(img);
    
    % apply the body of the algorithm.
    out=zeros(M,M);
    
    bic=zeros(R+3,R+3);
    bic(2:R+1,2:R+1)=img(:,:);
    bic(1,1)=bic(2,2);
    bic(R+2:R+3,R+2:R+3)=repmat(bic(R+1,R+1),2,2);
    bic(1,R+2:R+3)=repmat(bic(2,R+1),1,2);
    bic(R+2:R+3,1)=repmat(bic(R+1,2),2,1);
    bic(1,2:R+1)=bic(2,2:R+1);
    bic(2:R+1,1)=bic(2:R+1,2);
    bic(R+2:R+3,2:R+1)=repmat(bic(R+1,2:R+1),2,1);
    bic(2:R+1,R+2:R+3)=repmat(bic(2:R+1,R+1),1,2);
    
    for x=1:M
        for y=1:M
            X=(x-1)*(R-1)/(M-1)+2;
            Y=(y-1)*(C-1)/(M-1)+2;
            x0=floor(X)-1;
            y0=floor(Y)-1;         
            val_arr=bic(x0:x0+3,y0:y0+3);
            
            % get the weight matrix for the x-direction 
            % and y-direction in the region.
            arrX=[X-x0;X-x0-1;X-x0-2;X-x0-3];
            arrX=repmat(arrX,1,4);
            arrX=bicubic(arrX);
            arrY=[Y-y0 Y-y0-1 Y-y0-2 Y-y0-3];
            arrY=repmat(arrY,4,1);
            arrY=bicubic(arrY);
            
            % generate final pixel values.
            out(x,y)=sum(sum(val_arr.*arrX.*arrY));
        end
    end
end

function out = bicubic(x)
    ax=abs(x);
    out=(ax<=1).*(1.5*ax.^3-2.5*ax.^2+1)+ ...
        and(1<ax,ax<2).*(-0.5*ax.^3+2.5*ax.^2-4*ax+2);
end