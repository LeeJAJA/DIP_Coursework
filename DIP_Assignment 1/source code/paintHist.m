function paintHist(f,pic_name)
    % This function is used to provide 
    % the output histogram function for Task 1a
    % ----------------
    % Parameters List:
    % f - the input image
    % pic_name - file path to store the histogram
    
    % store rows and colums in m and n
    [m,n]=size(f); 
    g=zeros(1,256);
    
    % plot the bars with x-axis ranges from 0-255
    for i=1:256 
        % display the frequencies of pixels
        g(i)=length(find(f==i-1))/(m*n); 
    end
    
    set(figure(1), 'visible', 'off');
    bar(0:255,g*255,'b');
    ylabel('Frequency');
    xlabel('Grayscale Value');
    disp(pic_name);
    print(gcf, '-dpng', pic_name);
end