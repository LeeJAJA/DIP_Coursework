clear;clc;

% get the input image
bestPath = strcat('..',filesep,'problem_1',filesep,'1_1',filesep,'conv2_n=',num2str(4),'.jpg');
img = imread(bestPath);

laplacianMask = [0,-1,0;-1,5,-1;0,-1,0]

edge = conv2(img, laplacianMask, 'same');

result = uint8(edge);

% display the output
figure,set(gcf,'position',[150 150 1000 500])
    subplot(121),imshow(img);
    title('Origin')
    subplot(122),imshow(result);
    title(['Sharpened'])
    
output_name=strcat('..',filesep,'problem_3',filesep,'3_1',filesep,'origin.jpg');
imwrite(img, output_name);
output_name=strcat('..',filesep,'problem_3',filesep,'3_1',filesep,'sharpened.jpg');
imwrite(result, output_name);