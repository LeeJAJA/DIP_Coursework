clear;clc;

for i=1:5
    pic_name=strcat('..',filesep,'data1',filesep,'CT_',num2str(i),'.jpg');
    pic_temp=imread(pic_name);
    % grayImage=rgb2gray(pic_temp);
    disp(pic_name);
    official_pic_temp=adapthisteq(pic_temp, 'NumTiles', [5 5], 'ClipLimit', 0.05);   
    self_imp_pic=locallyHistEq(pic_temp,[5 5], 0.1, 0.05);
    set(figure(1), 'visible', 'off');
    figure,
    subplot(231),imshow(uint8(pic_temp));
    title('Origin')
    subplot(232),imshow(uint8(official_pic_temp));
    title('Official Implementation')
    subplot(233),imshow(uint8(self_imp_pic));
    title('My Implementation')
    subplot(234),returnHist(pic_temp);
    subplot(235),returnHist(official_pic_temp);
    subplot(236),returnHist(self_imp_pic);    
    
    plot_name=strcat('..',filesep,'result',filesep,'1_c',filesep,'CT_',num2str(i),'.jpg');
    plot_output_name=strcat('..',filesep,'result',filesep,'1_c',filesep,'output_CT_',num2str(i),'.jpg');
    print(gcf, '-dpng', plot_name);
    imwrite(self_imp_pic, plot_output_name);
    %paintHist(pic_temp,plot_name)
end
