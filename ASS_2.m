%image constrast using imadjust function
im=imread("as.jpeg");
ii=imadjust(im,[.2 .3 0;1 .9 .8],[]);
figure
subplot(2,2,1)
imshow(im)
subplot(2,2,2)
imshow(ii)
ig=rgb2gray(im)
iig=imadjust(ig)
subplot(2,2,3)
imshow(ig)
subplot(2,2,4)
imshow(iig)

%image constrast using histeq
figure
subplot(2,2,1)
imshow(im)
subplot(2,2,2)
imhist(im)
subplot(2,2,3)
ih=histeq(im)
imshow(ih)
subplot(2,2,4)
imhist(ih)

%image constrast using adapthisteq
ad=adapthisteq(ig);
figure
subplot(2,2,1);
imshow(ig);
subplot(2,2,2);
imhist(ig);
subplot(2,2,3);
imshow(ad);
subplot(2,2,4);
imhist(ad);

%constract streching
figure
st=imadjust(im,stretchlim(im,[0.2;.95]),[])
imshowpair(im,st,"montage")

