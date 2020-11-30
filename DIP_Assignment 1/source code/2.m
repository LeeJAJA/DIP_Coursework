clear;clc;
dirs=dir(strcat('..',filesep,'data2'));
    
for i=3:numel(dirs)
    pic_name=fullfile('..',filesep,'data2',filesep,dirs(i).name);
    pic_temp=double(imread(pic_name));
    pic_out_name_a=strcat('..',filesep,'result',filesep,'2_a',filesep,dirs(i).name);
    pic_out_name_b=strcat('..',filesep,'result',filesep,'2_b',filesep,dirs(i).name);
    pic_out_name_c=strcat('..',filesep,'result',filesep,'2_c',filesep,dirs(i).name);
    if ~exist(pic_out_name_a,'file')
        imwrite(uint8(myNearest(pic_temp,1024)),pic_out_name_a);
    end
    if ~exist(pic_out_name_b,'file')
        imwrite(uint8(myBilinear(pic_temp,1024)),pic_out_name_b);
    end
    if ~exist(pic_out_name_c,'file')  
        imwrite(uint8(myBicubic(pic_temp,1024)),pic_out_name_c);
    end
    disp(i)
end
    
