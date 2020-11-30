function [image] = getImage(fileName, lineLength)
% ----------------
% Parameters List:
% fileName - path of the input file
% lineLength - the line length of the input file

fileID = fopen(fileName);
A = fread(fileID, [lineLength, Inf]);
fclose(fileID);
image=uint8(A);
end

