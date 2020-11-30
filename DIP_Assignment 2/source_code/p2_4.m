clear;clc;

% extract the input image
imagePath = strcat('..',filesep,'p2d1');
lineLength = 600;
srcD1 = getImage(imagePath, lineLength);

% extract the input image
imagePath = strcat('..',filesep,'p2d2');
lineLength = 600;
srcD2 = getImage(imagePath, lineLength);

nVec = [1, 3, 5, 7];

% display the output
for n  = nVec
    A = maxFilter(srcD1, n);
    output_name=strcat('..',filesep,'problem_2',filesep,'2_4',filesep,'p2d1_MinFilter_n=',num2str(n),'.jpg');
    imwrite(A, output_name);
    A = minFilter(srcD2, n);
    output_name=strcat('..',filesep,'problem_2',filesep,'2_4',filesep,'p2d2_MaxFilter_n=',num2str(n),'.jpg');
    imwrite(A, output_name);
end

