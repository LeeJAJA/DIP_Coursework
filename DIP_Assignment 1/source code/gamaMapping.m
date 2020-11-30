function x=gamaMapping(img,gamma)
    % ----------------
    % Parameters List:
    % img - the input image
    % gamma - value of gamma
   
    img=double(img);
    img=img/max(max(img));
    % apply gamma transformation to the image.
    img=img.^gamma;
    x=round(img*255);
end