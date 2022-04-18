%image sharpenning
vv=imread('vf.jpg')
ib4=imsharpen(vv,'Amount',3)
figure
imshowpair(vv,ib4,'montage')

vg=rgb2gray(vv)
vs=imsharpen(vg,'Threshold',0.7)
figure
imshowpair(vg,vs,'montage')



%image smoothing using gaussian 
ii=imread("v5.jpg")
ib=imgaussfilt(ii,7)
ib2=imgaussfilt(ii,5,'Padding','circular')
ib3=imgaussfilt(ii,3,"Padding","symmetric")
figure
imshowpair(ii,ib,"montage")
figure
subplot(2,2,1)
imshow(ii)
subplot(2,2,2)
imshow(ib)
title("with sigma 7")
subplot(2,2,3)
imshow(ib2)
title('with sigma 5 and circular padding')
subplot(2,2,4)
imshow(ib3)
title('with sigma 3 and symmetric padding')

%image smooothing using imfilter 
id=imread("matlab.jpg");
v=ones(14,14)/194;
i=imfilter(id,v)
figure
imshow(i)
imshowpair(id,i,'montage')