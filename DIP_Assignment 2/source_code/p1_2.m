clear;clc;

% extract the input image
imagePath = strcat('..',filesep,'p1');
lineLength = 600;
A = getImage(imagePath, lineLength);

H = fspecial('gaussian', 5, 2);
A_imfilter = imfilter(A, H, 'same');
A_gauss = gaussConv(A, 2, 5);
    
% display the output
figure,set(gcf,'position',[150 150 1000 500])
    subplot(121),imshow(A_imfilter);
    title('imfilter''s Implementation')
    subplot(122),imshow(A_gauss);
    title('My Implementation')
    
plot_name=strcat('..',filesep,'problem_1',filesep,'1_2',filesep,'gaussConvComp.jpg');
print(gcf, '-dpng', plot_name);

output_name=strcat('..',filesep,'problem_1',filesep,'1_2',filesep,'imfilterResult.jpg');
imwrite(A_imfilter, output_name);
output_name=strcat('..',filesep,'problem_1',filesep,'1_2',filesep,'gaussConvResult.jpg');
imwrite(A_gauss, output_name);



