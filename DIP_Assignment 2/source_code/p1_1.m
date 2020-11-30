clear;clc;

% extract the input image
imagePath = strcat('..',filesep,'p1');
lineLength = 600;
A = getImage(imagePath, lineLength);

for i=1:6
kernel = fspecial('average',[i,i]);
A_filter = uint8(filter2(kernel,A,'same'));
A_conv = uint8(conv2(A,kernel,'same'));
    
% display the output
figure,set(gcf,'position',[150 150 1500 500])
    subplot(131),imshow(A);
    title('Origin')
    subplot(132),imshow(A_filter);
    title(['Filter2d(mask size ',num2str(i),'*',num2str(i),')'])
    subplot(133),imshow(A_conv);
    title(['Conv2d(mask size',num2str(i),'*',num2str(i),')'])
    
plot_name=strcat('..',filesep,'problem_1',filesep,'1_1',filesep,num2str(i),'x',num2str(i),'.jpg');
print(gcf, '-dpng', plot_name);
output_name=strcat('..',filesep,'problem_1',filesep,'1_1',filesep,'filter2_n=',num2str(i),'.jpg');
imwrite(A_filter, output_name);
output_name=strcat('..',filesep,'problem_1',filesep,'1_1',filesep,'conv2_n=',num2str(i),'.jpg');
imwrite(A_conv, output_name);
end