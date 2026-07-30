%%ECE180 Lab 9
clear;
close all;
clc;
%Opens various files for reading or writing
vr=vision.VideoFileReader('hall.mp4');
%vr.info.VideoFrameRate;
%implay('hall.mp4')
vw1=VideoWriter('hall-binary.mp4','MPEG-4');
vw2=VideoWriter('hall-color.mp4', 'MPEG-4');
vw1.FrameRate=29.97;
vw1.Quality=100;
vw2.FrameRate=29.97;
vw2.Quality=100;
vp_binary=vision.DeployableVideoPlayer;
vp_color=vision.DeployableVideoPlayer;
open(vw1);
open(vw2);
%Grabs initial frame
vr_frame = rgb2gray(step(vr));
%Loops through every frame of movie until last frame is reached
while ~isDone(vr)
    vw11 = step(vr);
    vw22 = vw11;
    vw11 = rgb2gray(vw11);
    vr_compare = abs(vr_frame - vw11);
    vr_threshold = .3;
    %filtering techniques
    vr2 = vr_compare > vr_threshold;
    bw = bwareaopen(vr2, 30);
    SQ = strel('square', 25);
    closeBW = imclose(bw, SQ);
    %Defines connected components for shapes in later step
    CC = bwconncomp(closeBW);
    R = regionprops(CC);
    %Creates rectangle shapes in video
    for n = 1:length(R)
        vw22 = insertShape(vw22,'Rectangle',R(n).BoundingBox);
    end
    %Video steps for testing purposes
    %step(vp_binary, vw2)
    %step(vp_binary, vw1)
    %Writes videos to file
    writeVideo(vw1, vw11);
    writeVideo(vw2, vw22);
end
%closes video files
release(vr);
release(vp_binary);
release(vp_color);
close(vw1);
close(vw2);
%Plays created video files
implay('hall-binary.mp4');
implay('hall-color.mp4');