%% Part 4
close all hidden;
clear;
clc;
%loads and prepares video files
vr=vision.VideoFileReader('soccer.mp4', 'VideoOutputDataType', 'uint8');
vw=VideoWriter('soccer-inverted.mp4','MPEG-4');
vp=vision.DeployableVideoPlayer; 
open(vw);
%inverts each frame of input file vr
while ~isDone(vr)
    x = step(vr);
    y = 255-x;
    step(vp, y);
    writeVideo(vw, y); 
end
%closes and releases files from program
close(vw);
release(vr);
release(vp);
clear vp;
%Plays inverted video
implay('soccer-inverted.mp4')