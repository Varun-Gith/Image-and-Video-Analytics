% %contrast stretching using built in functions
% %importing image
% I = imread('v2.jpg');
% figure
% subplot(2,2,1),imshow(I),title("Original image")
% 
% %Contrast Stretching
% %Stretchlim
% stretched_img = imadjust(I,stretchlim(I,[0.05,0.95]),[]);
% subplot(2,2,2),imshow(stretched_img),title("Stretched image")
% 
% %contrast stretching using user defined functions
% i = I(:,:,1);
% rtemp = min(i);         % find the min. value of pixels in all the columns (row vector)
% rmin = min(rtemp);      % find the min. value of pixel in the image
% rtemp = max(i);         % find the max. value of pixels in all the columns (row vector)
% rmax = max(rtemp);      % find the max. value of pixel in the image
% m = 255/(rmax - rmin);  % find the slope of line joining point (0,255) to (rmin,rmax)
% c = 255 - m*rmax;       % find the intercept of the straight line with the axis
% i_new = m*i + c;        % transform the image according to new slope
% subplot(2,2,3),imshow(i),title("Original gray scale");       % display original image
% subplot(2,2,4),imshow(i_new),title("stretched gray scale");   % display transformed image


%Gamma Correction 
% close all;
% clear all;
% F=rgb2gray(imread('v2.jpg'));
% C=input('Enter Value of C ');
% gamma=input('Enter Value of gamma ');
% G=256-F;
% H=uint8(C.*log(double(1+F)));
% I=uint8(C.*((double(F)).^gamma));
% subplot(2,2,1);
% imshow(F);
% title('Original Image');
% subplot(2,2,2);
% imshow(G);
% title('Negative Operator');
% subplot(2,2,3);
% imshow(H);
% logtext=sprintf('Logarithmic Operator for C=%2.1f and gamma=%0.2f',C,gamma);
% title(logtext);
% subplot(2,2,4);
% imshow(I);
% powtext=sprintf('Power Law Operator for C=%2.1f and gamma=%0.2f',C,gamma);
% title(powtext);
%POWER LAW TRANSFORMATION
%Transformation using user defined function
   
%for gamma value less than 1 we get Bright image
%for gamma value greater than 1 we get Dark image
%%
% Importing image in Workspace
RGB=imread('v2.jpg');
% %% RGB to gray
% I=rgb2gray(RGB);
% % In double format
% I=im2double(I);
% % computing size m,n
% [m n] = size(I);
% % Computing s = c * (r ^ gamma) where r and gamma are positive constants
% c = 2;
% g =[0.5 0.7 0.9 1 2 3 4 5 6];% Gamma Correction Array
% for r=1:length(g)
% for p = 1 : m
%    for q = 1 : n
%        I3(p, q) = c * I(p, q).^ g(r);  
%    end
% end
% figure, imshow(I3);title('Power-law transformation');xlabel('Gamma='),xlabel(g(r));
% end
% 

%GAMMA CORRECTION USING BUILT IN FUNCTION
figure
M=imread('v2.jpg')
G=rgb2gray(M)
J = imadjust(G,[],[],0.5);
imshowpair(G,J,"montage")



% %Image resizing using user defined function
% im=imread('matlab.jpg')
% 
% [origImRows, origImColumns,~] = size(im);
% 
% newImage = zeros(origImRows/2, origImColumns/2,3);
% newImRow = 1; newImColumn = 1;
% 
% for row = 1:2:origImRows
%     for column = 1:2:origImColumns
%         newImage(newImRow, newImColumn,:)=im(row, column,:);
%         newImColumn = newImColumn+1;
%     end
%     newImRow = newImRow+1;
%     newImColumn = 1;
% end
% 
% figure; 
% imshow(newImage/255);
% 
% fprintf("%d %d% %d\n",size(newImage));
% fprintf("%d %d %d\n",size(im));
