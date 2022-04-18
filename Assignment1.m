%IMPORTATION OF THE JPG FILE
i=imread("matlab.jpg");
%RESIZE
r=imresize(i,0.3,"nearest");
figure, imshow(i), figure, imshow(r);


%CONVERTION OF GRAY AND BINARY 
gray=rgb2gray(i);
binary=im2bw(gray);
figure;
subplot(1,3,1);
imshow(i);
subplot(1,3,2);
title("BGR TO GRAY");
imshow(gray);
subplot(1,3,3);
imshow(binary);

%ROTATION OF BINARY IMG
Ibinary=imrotate(binary,180,"bicubic","crop");
figure;
subplot(2,1,1);
imshow(binary);
subplot(2,1,2);
imshow(Ibinary);
 
%ROTATION OF GRAY IMG
Igray=imrotate(gray,278,"nearest","loose");
figure;
subplot(2,1,1);
imshow(gray);
subplot(2,1,2);
imshow(Igray);

%ROTATION OF COLOUR IMG
Icolour=imrotate(i,180,"bilinear","crop");
Ic=rescale(Icolour);
figure;
subplot(2,1,1);
imshow(i);
subplot(2,1,2);
imshow(Ic);

%IMAGE FILTERING
k=imnoise(i,'salt & pepper',0.02);
v=ones(6,6)/25;
fil=imfilter(k,v);
subplot(1,2,1)
imshow(k);
subplot(1,2,2);
imshow(fil);
title("filteredimage");

%BEFORE EQUALISING
figure;
subplot(2,2,1);
imshow(i);
subplot(2,2,2);
imhist(i,64);
%AFTER EQUALISING
j=histeq(i);
subplot(2,2,3);
imshow(j);
subplot(2,2,4);
imhist(j,64);

