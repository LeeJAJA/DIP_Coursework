function x=returnHist(f)
    % This function is used to provide the return
    % value of histogram for Task 1b/1c/1d
    % ----------------
    % Parameters List:
    % f - the input image
    
    % store rows and colums in m and n
    [m,n]=size(f); 
    g=zeros(1,256);
    
    % plot the bars with x-axis ranges from 0-255
    for i=1:256 
        % display the frequencies of pixels
        g(i)=length(find(f==i-1))/(m*n); 
    end
    x=bar(0:255,g*255,'b');
    ylabel('Frequency');
    xlabel('Grayscale Value');
end