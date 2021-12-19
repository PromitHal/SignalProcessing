pic=imread('C:\Users\PROMIT\Desktop\contents\matlab\mine.jpg');%Loading the picture
pic_red=pic(:,:,1);%Red channel
pic_green=pic(:,:,2);%Green channel
pic_blue=pic(:,:,3);%Blue channel
%Creating an all black channel
allBlack=zeros(size(pic,1),size(pic,2),'uint8');
%Creating individual color channels
red_only=cat(3,pic_red,allBlack,allBlack);
green_only=cat(3,allBlack,pic_green,allBlack);
blue_only=cat(3,allBlack,allBlack,pic_blue);
figure,
subplot(3,1,1);
imshow(red_only);
title('Red Channel');
subplot(3,1,2);
imshow(green_only);
title('Green Channel');
subplot(3,1,3)
imshow(blue_only);
title('Blue Channel');



%For red channel:
red_compressed=compress(pic_red);
%For green channel:
green_compressed=compress(pic_green);
%For blue channel:
blue_compressed=compress(pic_blue);


%Creating individual color channels for compressed images
red_only_compressed=cat(3,red_compressed,allBlack,allBlack);
green_only_compressed=cat(3,allBlack,green_compressed,allBlack);
blue_only_compressed=cat(3,allBlack,allBlack,red_compressed);
%Reconstructed image
compressed_color_image=cat(3,red_compressed,green_compressed,blue_compressed);
%showing the compressed images 
figure,
subplot(2,2,1);
imshow(compressed_color_image);
subplot(2,2,2); 
imshow(red_only_compressed);
title('Red Channel');
subplot(2,2,3);
imshow(green_only_compressed);
title('Green Channel');
subplot(2,2,4);
imshow(blue_only_compressed);
title('Blue Channel');


%Saving the most compressed color image
imwrite(compressed_color_image,'compressed_color.jpg');



%function for FFT_Based image compression
function compressed=compress(image)
img_fft=fft2(image); %2D DFT of the image

index_pic=2;
[m,n]=size(image);

figure,
subplot(2,2,1);
imshow(image);
for thresh=0.1*[0.001 0.005 0.006]*max(max(abs(img_fft)))%Setting thresholds 
    
ind=abs(img_fft)>thresh;%Finding indices of transformed matrices having magnitude of fourier coefficient above threshold

allowed_indices=sum(sum(ind));%Number of allowed indices

count=m*n-allowed_indices;%Number of discarded indices

img_new_fft=img_fft.*ind;%New fft of image with allowed indices of fourier coefficients

percent=100*allowed_indices/(m*n);%Calculating percentage of fourier coefficients allowed to be in new fft

compressed_img=uint8(ifft2(img_new_fft)); %Taking inverse fourier transform to obtain the image back in spatial domain


subplot(2,2,index_pic);
imshow(compressed_img);
index_pic=index_pic+1;

title([num2str(percent) '% of fft coefficients']);

end

figure,
%Intensity surface diagram for original image
resize=imresize(image,0.1);%Down sampling
surf(resize);

%Intensity surface diagram for compressed image
figure,
resize_compressed=imresize(compressed_img,0.05);%Down sampling
surf(resize_compressed);
compressed=compressed_img;
end
