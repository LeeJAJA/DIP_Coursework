clear;clc;
gama = [0.9, 0.4, 0.5,  0.8, 1.2]
for i=1:5
    pic_name=strcat('..',filesep,'data1',filesep,'CT_',num2str(i),'.jpg');
    pic_temp=imread(pic_name);
    % grayImage=rgb2gray(pic_temp);
    disp(pic_name);
    official_pic_temp=histeq(pic_temp);   
    self_imp_pic=histeq(pic_temp);
    set(figure(1), 'visible', 'off');
    figure,
    subplot(221),imshow(uint8(pic_temp));
    title('Origin')
    subplot(222),imshow(uint8(gamaMapping(pic_temp,gama(i))));
    title(strcat('My Implementation',' gamma=',num2str(gama(i))))
    subplot(223),returnHist(pic_temp)
    subplot(224),returnHist(self_imp_pic)    
    
    plot_name=strcat('..',filesep,'result',filesep,'1_d',filesep,'CT_',num2str(i),'.jpg');
    plot_output_name=strcat('..',filesep,'result',filesep,'1_d',filesep,'output_CT_',num2str(i),'.jpg');
    print(gcf, '-dpng', plot_name);
    imwrite(self_imp_pic, plot_output_name);
    %paintHist(pic_temp,plot_name)
end
