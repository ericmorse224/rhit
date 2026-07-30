%%ECE180 Problem Set 11 Problem 1
clear all;
clc;
hn = conv([1 -1],[1 -1.414 1]);
wh = -pi:pi/100:pi;
H = freqz(hn, 1, wh);
figure
subplot(2,1,1)
plot(wh/pi, abs(H))
subplot(2,1,2)
plot(wh/pi, angle(H))
%% Problem 2
hn = [1 0 0 0 0 0 0 0 -1];
R = roots(hn);
zplane(hn)
%% Problem 2 part e
conv(conv(conv(conv(conv([1 1], [1, -1]), [1 1.414]), [1 -1.414]), [1 j]), [1 -j])
%% Problem 3
hn = [1 0 0 0 -16.06 0 0 0 1];
wh = -pi:pi/100:pi;
H = freqz(hn, 1, wh);
figure
subplot(2,1,1)
plot(wh/pi, abs(H))
subplot(2,1,2)
plot(wh/pi, angle(H))