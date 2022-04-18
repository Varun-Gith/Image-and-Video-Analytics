i=imread("v4.jpg")
j=rgb2gray(i)
ii=imnoise(j,"gaussian")
iq=imnoise(j,"salt & pepper",0.05)
iw=imnoise(j,"speckle",0.05)
figure
subplot(1,3,1)
imshow(ii)
title('Noise added with Gaussian Method')
subplot(1,3,2)
imshow(iq)
title('Noise added with Salt & pepper')
subplot(1,3,3)
imshow(iw)
title('Noise added with Speckle')

%Linear Filtering 
t=fspecial('average',4)
u=imfilter(iq,t)
figure
subplot(1,2,1)
imshow(iq)
subplot(1,2,2)
imshow(u)
title('Filtering Using Average Method')

y=fspecial('disk',4)
x=imfilter(ii,y)
figure
subplot(1,2,1)
imshow(ii)
subplot(1,2,2)
imshow(x)
title('Filtering using Disk Method')

%nonlinear filtering 
median = medfilt2(iq);
figure
subplot(1,2,1)
imshow(u)
subplot(1,2,2)
imshow(median)
title('Non Linear Filtering using Median filtering method')

o=medfilt2(iw,[4 4],'indexed')
figure
subplot(1,2,1)
imshow(iw)
subplot(1,2,2)
imshow(o)
title('Non linear Filtering with [4 4] & Symmetric padding')