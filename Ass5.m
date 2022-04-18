% % 1. Frequency of a given pixel occurring in an image
% pix = input('\nEnter the pixel value: ');
% freq = 0;
% img = rgb2gray(imread('matlab.jpg'));
% figure
% imshow(img)
% fprintf('The size of input image is : %d x %d \n', size(img));
% 
% [m,n] = size(img);
% for i = 1:m
%     for j = 1:n
%         if (img(i,j) == pix)
%             freq = freq +1;
%         end
%     end
% end
% fprintf('The frequency of the pixel is: %d \n',freq);

% % 2. Calculate the global mean value in a two-dimensional matrix M * N
% [m,n] = size(img);
% sum = 0;
% SUM = double(sum);
% for i = 1:m
%     for j =1:n
%         SUM = SUM + double(img(i,j));
%     end
% end
% globalmean = SUM/double(m*n);
% fprintf('The global mean is : %d \n',globalmean);
% 
% 3. Calculate the mean value of every row in a two-dimensional matrix M * 
img=rgb2gray(imread('v5.jpg'))
[m,n] = size(img);
sum = 0;
SUM = double(sum);
for i = 1:m
    for j = 1:n
        row_sum = SUM + double(img(i,j));
    end
    row_mean = row_sum/double(n);
    fprintf('The mean of row %d is %d \n',i,row_mean);
end

% %4Write a Matlab program to determine the frequency of each pixel occurring in a column of an image.
% cm = imread('tire.tif'); 
% [m,n] = size(cm);
% crr=[];
% arr=[];
% visited=-1;
% for i=1:m
%     frequency = 1;
%     k=1;
%     for j=i+1:n
%         if(cm(i,k)==cm(i,j))
%             frequency = frequency+1;
%             arr(j) = visited;
%             
%         end
%     k=k+1;
%     end
%     if(arr(i)~=visited)
%         crr(i)=cm(i,k);
%         arr(i) = frequency;
%     end    
% 
% end
% for i=1:m
%     for j=1:n
%         if(arr(i)~=visited)
%             fprintf('Pixel %d = %d ',cm(i,j),arr(i));
%             fprintf('\n');
%         end
%        
%     end
% end

% 
% 5. Total number of pixels which has less than the given intensity
% intensity = input('\nIntensity value: ');
% [m,n] = size(img);
% count = 0;
% for i = 1:m
%     for j = 1:n
%         if (img(i,j) < intensity)
%             count = count + 1;
%         end 
%     end
% end
% fprintf('Total no. of pixels having intensity value less than %d are %d',intensity,count)
