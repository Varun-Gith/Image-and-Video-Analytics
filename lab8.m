img=imread('cameraman.tif');  % reading the image
[M,N]=size(img); % Saving the the rows of X in M and columns in N
FFT=fftshift(fft2(img));
% %Low Pass:
% %Ideal:
% cam=webcam(1);
% i0=snapshot(cam);
% input_image = rgb2gray(i0);%imread('[name of input image file].[file format]');  
% % Saving the size of the input_image in pixels-
% % M : no of rows (height of the image)
% % N : no of columns (width of the image)
% [M, N] = size(input_image);
%   
% % Getting Fourier Transform of the input_image
% % using MATLAB library function fft2 (2D fast fourier transform)  
% FT_img = fft2(double(input_image));
%   
% % Assign Cut-off Frequency  
% D0 = 30; % one can change this value accordingly
%   
% % Designing filter
% u = 0:(M-1);
% idx = find(u>M/2);
% u(idx) = u(idx)-M;
% v = 0:(N-1);
% idy = find(v>N/2);
% v(idy) = v(idy)-N;
%   
% % MATLAB library function meshgrid(v, u) returns
% % 2D grid which contains the coordinates of vectors
% % v and u. Matrix V with each row is a copy 
% % of v, and matrix U with each column is a copy of u
% [V, U] = meshgrid(v, u);
%   
% % Calculating Euclidean Distance
% D = sqrt(U.^2+V.^2);
%   
% % Comparing with the cut-off frequency and 
% % determining the filtering mask
% H = double(D <= D0);
%   
% % Convolution between the Fourier Transformed
% % image and the mask
% G = H.*FT_img;
%   
% % Getting the resultant image by Inverse Fourier Transform
% % of the convoluted image using MATLAB library function 
% % ifft2 (2D inverse fast fourier transform)  
% output_image = real(ifft2(double(G)));
%   
% % Displaying Input Image and Output Image
% imshowpair(input_image,output_image,'montage');
% clear cam;
% 
% %Butterworth:
% %Reading input image : input_image
% cam=webcam(1);
% i0=snapshot(cam);
% input_image = rgb2gray(i0);
%   
% % Saving the size of the input_image in pixels-
% % M : no of rows (height of the image)
% % N : no of columns (width of the image)
% [M, N] = size(input_image);
%   
% % Getting Fourier Transform of the input_image
% % using MATLAB library function fft2 (2D fast fourier transform)
% FT_img = fft2(double(input_image));
%   
% % Assign the order value
% n = 2; % one can change this value accordingly
%   
% % Assign Cut-off Frequency
% D0 = 20; % one can change this value accordingly
%   
% % Designing filter
% u = 0:(M-1);
% v = 0:(N-1);
% idx = find(u > M/2);
% u(idx) = u(idx) - M;
% idy = find(v > N/2);
% v(idy) = v(idy) - N;
%   
% % MATLAB library function meshgrid(v, u) returns 
% % 2D grid which contains the coordinates of vectors 
% % v and u. Matrix V with each row is a copy of v 
% % and matrix U with each column is a copy of u 
% [V, U] = meshgrid(v, u);
%   
% % Calculating Euclidean Distance
% D = sqrt(U.^2 + V.^2);
%   
% % determining the filtering mask
% H = 1./(1 + (D./D0).^(2*n));
%   
% % Convolution between the Fourier Transformed 
% % image and the mask
% G = H.*FT_img;
%   
% % Getting the resultant image by Inverse Fourier Transform 
% % of the convoluted image using MATLAB library function  
% % ifft2 (2D inverse fast fourier transform)   
% output_image = real(ifft2(double(G))); 
%     
% % Displaying Input Image and Output Image 
% imshowpair(input_image,output_image,'montage');
% clear cam;


%Gaussian:
f=input('Enter cut-off value(0-1) : '); % takes input for cut-off value
                f1=f*sqrt(M^2+N^2); % to put pixel in centre of an image
                H3=zeros(M,N); % complete h1(filter) is zero initially (same dimension as image)
                %Guassian Low Pass Filter
                for i=1:M %iterates over the M rows
                    for j=1:N %iterates over the N columns for each row
                        D = sqrt(abs(i-M/2)^2 + abs(j-N/2)^2);
                        H3(i,j)= exp(-(D^2)/(2*f^2)); % assigns 1 if the distance is less than f if not it assigns zero 
                    end
                end %Guassian low pass filter H1 is created 
                G=H3.*FFT; % Multiplying the Fourier transformed image with H1 (the filter)
                G=ifftshift(G); % Inverse fourier transform 
                img2=uint8(real(ifft2(G))); % butter worth low pass filtered image (output)
  % displaying the images
                figure
                imshowpair(img,img2,"montage");title('Original image and Filtered image (BLP Filter)');xlabel("Cutoff - "),xlabel(f)


% %High Pass:
% %Ideal:
% % Ideal High Pass Filter
%   
% % Reading input image : input_image 
% input_image = imread('cameraman.tif');
%   
% % Saving the size of the input_image in pixels-
% % M : no of rows (height of the image)
% % N : no of columns (width of the image)
% [M, N] = size(input_image);
%   
% % Getting Fourier Transform of the input_image
% % using MATLAB library function fft2 (2D fast fourier transform)  
% FT_img = fft2(double(input_image));
%   
% % Assign Cut-off Frequency  
% D0 = 10; % one can change this value accordingly
%   
% % Designing filter
% u = 0:(M-1);
% idx = find(u>M/2);
% u(idx) = u(idx)-M;
% v = 0:(N-1);
% idy = find(v>N/2);
% v(idy) = v(idy)-N;
%   
% % MATLAB library function meshgrid(v, u) returns 2D grid
% %  which contains the coordinates of vectors v and u. 
% % Matrix V with each row is a copy of v, and matrix U 
% % with each column is a copy of u
% [V, U] = meshgrid(v, u);
%   
% % Calculating Euclidean Distance
% D = sqrt(U.^2+V.^2);
%   
% % Comparing with the cut-off frequency and 
% % determining the filtering mask
% H = double(D > D0);
%   
% % Convolution between the Fourier Transformed image and the mask
% G = H.*FT_img;
%   
% % Getting the resultant image by Inverse Fourier Transform
% % of the convoluted image using MATLAB library function
% % ifft2 (2D inverse fast fourier transform)  
% output_image = real(ifft2(double(G)));
%   
% % Displaying Input Image and Output Image
% %subplot(2, 1, 1), imshow(input_image),
% %subplot(2, 1, 2), imshow(output_image, [ ]);
% imshowpair(input_image,output_image,'montage');


% %Butterworth:
% 
% cam=webcam(1);
% i0=snapshot(cam);
% input_image = rgb2gray(i0);
%   
% % Saving the size of the input_image in pixels-
% % M : no of rows (height of the image)
% % N : no of columns (width of the image)
% [M, N] = size(input_image);
%   
% % Getting Fourier Transform of the input_image
% % using MATLAB library function fft2 (2D fast fourier transform)
% FT_img = fft2(double(input_image));
%   
% % Assign the order value
% n = 2; % one can change this value accordingly
%   
% % Assign Cut-off Frequency
% D0 = 10; % one can change this value accordingly
%   
% % Designing filter
% u = 0:(M-1);
% v = 0:(N-1);
% idx = find(u > M/2);
% u(idx) = u(idx) - M;
% idy = find(v > N/2);
% v(idy) = v(idy) - N;
%   
% % MATLAB library function meshgrid(v, u) returns 
% % 2D grid which contains the coordinates of vectors 
% % v and u. Matrix V with each row is a copy of v 
% % and matrix U with each column is a copy of u 
% [V, U] = meshgrid(v, u);
%   
% % Calculating Euclidean Distance
% D = sqrt(U.^2 + V.^2);
%   
% % determining the filtering mask
% H = 1./(1 + (D0./D).^(2*n));
%   
% % Convolution between the Fourier Transformed 
% % image and the mask
% G = H.*FT_img;
%   
% % Getting the resultant image by Inverse Fourier Transform 
% % of the convoluted image using MATLAB library function  
% % ifft2 (2D inverse fast fourier transform)   
% output_image = real(ifft2(double(G))); 
%     
% % Displaying Input Image and Output Image
% imshowpair(input_image,output_image,'montage');
% clear cam;
% % 

% %Gaussian:
% 
% f=input('Enter cut-off value(0-1) : '); % takes input for cut-off value
%                 f1=f*sqrt(M^2+N^2); % to put pixel in centre of an image
%                 H3=zeros(M,N); % complete h1(filter) is zero initially (same dimension as image)
%                 %Guassian Low Pass Filter
%                 for i=1:M %iterates over the M rows
%                     for j=1:N %iterates over the N columns for each row
%                         D = sqrt(abs(i-M/2)^2 + abs(j-N/2)^2);
%                         H3(i,j)= 1 - exp(-(D^2)/(2*f^2)); % assigns 1 if the distance is less than f if not it assigns zero 
%                     end
%                 end %Guassian high pass filter H1 is created 
%                 G=H3.*FFT; % Multiplying the Fourier transformed image with H1 (the filter)
%                 G=ifftshift(G); % Inverse fourier transform 
%                 img2=uint8(real(ifft2(G))); % Guassian high pass filtered image (output)
% 
%                 % displaying the images
%                 figure
%  imshowpair(img,img2,"montage");title('Original image and Filtered image (GHP Filter)');xlabel("Cutoff - "),xlabel(f)
