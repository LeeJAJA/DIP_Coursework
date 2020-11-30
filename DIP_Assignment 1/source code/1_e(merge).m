clear;clc;
gama = [0.9, 0.4, 0.5,  0.8, 1.2]
for i=1:5
    pic_name=strcat('..',filesep,'data1',filesep,'CT_',num2str(i),'.jpg');
    pic_temp=imread(pic_name);
    % grayImage=rgb2gray(pic_temp);
    disp(pic_name);
    my_global=globalHistEq(pic_temp,256);
    my_local=locallyHistEq(pic_temp,[5 5], 0.1, 0.05);
    my_gama=gamaMapping(pic_temp,gama(i));
    set(figure(1), 'visible', 'off');
    figure,set(gcf,'position',[150 150 1000 500])
    subplot(241),imshow(uint8(pic_temp));
    title('Origin')
    subplot(242),imshow(uint8(my_global));
    title('Global')
    subplot(243),imshow(uint8(my_local));
    title('Locally')
    subplot(244),imshow(uint8(my_gama));
    title('Gama')
    subplot(245),returnHist(pic_temp)
    subplot(246),returnHist(my_global)    
    subplot(247),returnHist(my_local)
    subplot(248),returnHist(my_gama)    
    plot_name=strcat('..',filesep,'result',filesep,'1_all',filesep,'CT_',num2str(i),'.jpg');
    print(gcf, '-dpng', plot_name);
    %paintHist(pic_temp,plot_name)
end
