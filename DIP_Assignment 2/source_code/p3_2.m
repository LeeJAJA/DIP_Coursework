clear;clc;

% extract the input images
imagePath = strcat('..',filesep,'p3');
lineLength = 600;
img = getImage(imagePath, lineLength);

% define the filter masks
laplacianMask = [-1,-1,-1;-1,8,-1;-1,-1,-1];
mask = fspecial('gaussian', 3, 4);
edgeLaplacian = imfilter(img, laplacianMask, 'same');
edgeLog = imfilter(img, conv2(laplacianMask, mask), 'same');

conv2(mask, laplacianMask)
conv2(laplacianMask, mask)

% get the edges and compute the sharpened image
resultLaplacian = uint8(img) + uint8(edgeLaplacian);
resultLog = uint8(img) + uint8(edgeLog);

% display the output
figure,set(gcf,'position',[150 150 2400 800])
    subplot(131),imshow(img);
    title('Origin')
    subplot(132),imshow(resultLaplacian);
    title(['Sharpened'])
    subplot(133),imshow(resultLog);
    title(['Sharpened'])
    
output_name=strcat('..',filesep,'problem_3',filesep,'3_2',filesep,'origin.jpg');
imwrite(img, output_name);
output_name=strcat('..',filesep,'problem_3',filesep,'3_2',filesep,'sharpenedLaplacian.jpg');
imwrite(resultLaplacian, output_name);
output_name=strcat('..',filesep,'problem_3',filesep,'3_2',filesep,'sharpenedLog.jpg');
imwrite(resultLog, output_name);