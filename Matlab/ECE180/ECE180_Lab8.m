%%ECE180 Lab 8 Video Processing
%%By Eric Morse and Leian Xu
%% Part 1
img = imread('camera.png');
fstk = img;
fstk(:,:,256)=0;  %%makes the other frames 0 valued
%implay(fstk)
for i = 2:256
    %%causes frame to be shifted down and right from previous frame
    fstk(:,:, i) = circshift(fstk(:,:,i-1),[1 1]);
end
implay(fstk, 30)
%% Part 2
close all hidden;
clear;
img = imread('barn.png');
for i = 1:64
    fstk(:,:,:,i)=img; %loads all frames with image file
    h = fspecial('average', 65-i); %causes blur based on frame
    filteredstk(:,:,:,i) = imfilter(fstk(:,:,:,i), h, 'symmetric');
end
implay(filteredstk, 30)
%% Part 3
close all hidden;
clear;
%loads video file
vr = VideoReader('mobile.mp4');
fstk=read(vr);
%loop turns color image frames to grayscale
for i = 1:260
    fstkg(:,:,i) = rgb2gray(fstk(:,:,:,i));
end
%loop rotates each frame by 1.5 degrees
for k = 1:260
    fstkg(:,:,k) = imrotate(fstkg(:,:,k), 360*(k-1)/260, 'nearest', 'crop');
    fstk2(:,:,:,k) = fstk(:,:,k);
end

for i = 1:260
    for j = 1:3
        fstk2(:,:,j,i) = fstkg(:,:,i);
    end
end
%plays original video data
implay(fstk, 29.97)
%plays altered video data
implay(fstk2, 29.97)
%writes altered video data to file
vw=VideoWriter('mobile-rotated.mp4','MPEG-4');
open(vw); 
writeVideo(vw,fstk2);
close(vw);
