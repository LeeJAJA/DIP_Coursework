clear;clc;

for i=1:5
    pic_name=strcat('..',filesep,'data1',filesep,'CT_',num2str(i),'.jpg');
    pic_temp=imread(pic_name);
    % grayImage=rgb2gray(pic_temp);
    disp(pic_name);
    plot_name=strcat('..',filesep,'result',filesep,'1_a',filesep,'CT_',num2str(i),'.jpg');
    paintHist(pic_temp,plot_name)
end
