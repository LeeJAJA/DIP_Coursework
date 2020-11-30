clear;clc;

% extract the input image
imagePath = strcat('..',filesep,'p2d2');
lineLength = 600;
src = getImage(imagePath, lineLength);

nVec = [1, 3, 5, 7];

% display the output
for n  = nVec
    A = maxFilter(src, n);
    output_name=strcat('..',filesep,'problem_2',filesep,'2_2',filesep,'myMaxFilter_n=',num2str(n),'.jpg');
    imwrite(A, output_name);
    A = ordfilt2(src,(n*n),ones(n,n));
    output_name=strcat('..',filesep,'problem_2',filesep,'2_2',filesep,'ordfilt2_n=',num2str(n),'.jpg');
    imwrite(A, output_name);
end

