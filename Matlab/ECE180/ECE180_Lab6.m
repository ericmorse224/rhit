%%Created by Eric Morse and Leian Xu
%%Lab6/7 Audio Effects "Demo Tape"
%% 1 Convolution Reverb
clear;
clc;
close all;
sx = audioread('s1.wav');
s1 = sx;
%audioinfo('s1.wav')
s1 = resample(s1, 6,1);
s1 = s1 / max(abs(s1(:)));
%soundsc(s1, 48000);
IR1 = audioread('grange-centre-paperbangermic5m.wav');
%audioinfo('grange-centre-paperbangermic5m.wav')
s1 = conv(IR1, s1);
soundsc(s1, 48000);
%audiowrite('1grange.wav',s1,48000);
IR2 = audioread('pacmanout.wav');
%audioinfo('pacmanout.wav')
s2 = sx;
s2 = resample(s2, 24, 1);
s2 = s2 / max(abs(s2(:)));
s2 = conv(IR2, s2);
%soundsc(s2, 192000);
%audiowrite('1pacman.wav',s2,192000);
IR3 = audioread('slinky_ir.wav');
%audioinfo('slinky_ir.wav')
s3 = sx;
s3 = resample(s3, 441, 80);
s3 = s3 / max(abs(s3(:)));
s3 = conv(s3, IR3);
%soundsc(s3, 44100);
%audiowrite('1slinky.wav',s3,44100);
%% 2 Time-reversed Convolution
clear;
clc;
close all;
sx = audioread('s1.wav');
s1f = sx;
%audioinfo('s1.wav')
s1f = flip(s1f);
s1f = resample(s1f, 6,1);
s1f = s1f / max(abs(s1f(:)));
%soundsc(s1f, 48000);
IR1 = audioread('grange-centre-paperbangermic5m.wav');
%audioinfo('grange-centre-paperbangermic5m.wav')
%audioinfo('s1.wav')
s1f = conv(IR1, s1f);
s1f = flip(s1f);
%soundsc(s1f, 48000);
audiowrite('2grange.wav',s1f,48000);
IR2 = audioread('pacmanout.wav');
%audioinfo('pacmanout.wav')
s2f = sx;
s2f = flip(s2f);
s2f = resample(s2f, 24, 1);
s2f = s2f / max(abs(s2f(:)));
s2f = conv(IR2, s2f);
s2f = flip(s2f);
%soundsc(s2f, 192000);
%audiowrite('2pacman.wav',s2f,192000);
IR3 = audioread('slinky_ir.wav');
%audioinfo('slinky_ir.wav')
s3f = sx;
s3f = flip(s3f);
s3f = resample(s3f, 441, 80);
s3f = s3f / max(abs(s3f(:)));
s3f = conv(s3f, IR3);
s3f = flip(s3f);
%soundsc(s3f, 44100);
%% 3 Wet/Dry Mix
clear;
clc;
close all;
s1d = audioread('s1.wav');
%wet/dry ratio set to 0.6
m = 0.6;
%audioinfo('s1.wav')
s1d = resample(s1d, 6,1);
s1d = s1d / max(abs(s1d(:)));
%soundsc(s1d, 48000);
IR1 = audioread('grange-centre-paperbangermic5m.wav');
%audioinfo('grange-centre-paperbangermic5m.wav')
s1w = conv(IR1, s1d);
wsum = m*s1d+(1-m)*s1w(1:end - 53183, :);
%soundsc(wsum, 48000);
audiowrite('3_0.6.wav', wsum, 48000);
%wet/dry ratio changed to 0.8
m = 0.8;
wsum = m*s1d+(1-m)*s1w(1:end - 53183, :);
%soundsc(wsum, 48000);
audiowrite('3_0.8.wav', wsum, 48000);
%wet/dry ratio changed to 0.2
m = 0.2;
wsum = m*s1d+(1-m)*s1w(1:end - 53183, :);
%soundsc(wsum, 48000);
audiowrite('3_0.2.wav', wsum, 48000);
%% 4 Stereo Convolution Reverb
clear;
clc;
close all;
s1s = audioread('s1.wav');
%audioinfo('s1s.wav')
s1s = resample(s1s, 6,1);
s1s = s1s / max(abs(s1s(:)));
%soundsc(s1s, 48000);
IR1 = audioread('abernyte_grain_silo.wav');
%audioinfo('abernyte_grain_silo.wav')
s11(:,1) = conv(IR1(:,1), s1s);
s11(:,2) = conv(IR1(:,2), s1s);
%soundsc(s11, 48000);
audiowrite('4stereo.wav', s11, 48000);
%% 5 Echo Chambers
clear;
clc;
close all;
sx = audioread('s1.wav');
s1e = sx;
%audioinfo('s1.wav')
IR1 = audioread('tyndall_bruce_omni.wav');
%audioinfo('tyndall_bruce_omni.wav')
s1e = resample(s1e, 6,1);
s1e = s1e / max(abs(s1e(:)));
s1e = conv(IR1, s1e);
%soundsc(s1e, 48000);
audiowrite('5_tyndall.wav', s1e, 48000);
IR2 = audioread('carpark_balloon.wav');
%audioinfo('carpark_balloon.wav')
s2e = sx;
s2e = resample(s2e, 441, 80);
s2e = s2e / max(abs(s2e(:)));
s2e = conv(IR2(:,1), s2e);
%soundsc(s2e, 44100);
%audiowrite('5_carpark.wav', s2e, 44100);
IR3 = audioread('ir1_-_scoppioinferiore.wav');
%audioinfo('ir1_-_scoppioinferiore.wav')
s3e = sx;
s3e = resample(s3e, 441, 80);
s3e = s3e / max(abs(s3e(:)));
s3e = conv(s3e, IR3);
%soundsc(s3e, 44100);
%audiowrite('5_Pozelle.wav', s3e, 44100);
%% 6 Modulation effect
clear;
clc;
close all;
sx = audioread('s1.wav');
%first frequency modulation f0=1000Hz
s1 = sx;
%audioinfo('s1.wav')
fs=8000;
D=3;
tt=(0:fs*D-1)'/fs;
f0 = 1000; 
x = sin(2*pi*f0*tt);
s1 = s1 / max(abs(s1(:)));
s1 = x.*s1(1:end - 576, :);
%soundsc(s1, fs);
%audiowrite('6_1k.wav', s1, fs);
%second frequency modulation f0 = 100Hz
s2 = sx;
f0 = 100; 
x = sin(2*pi*f0*tt);
s2 = s2 / max(abs(s2(:)));
s2 = x.*s2(1:end - 576, :);
soundsc(s2, fs);
%audiowrite('6_100.wav', s2, fs);
%third frequency modulation f0 = 20hz
s3 = sx;
f0 = 20; 
x = sin(2*pi*f0*tt);
s3 = s3 / max(abs(s3(:)));
%soundsc(x, fs);
s3 = x.*s3(1:end-576,:);
%soundsc(s3, fs);
%audiowrite('6_20.wav',s3,fs);
%% 7 Haas Effect
clc;
clear;
close all;
sx = audioread('s1.wav');
s1 = sx;
s2 = sx;
%first delay of 356 ms
s1(end+1:end+356)=0;
s2(1+356:end+356) = s2(1:end);
s2(1:356)=0;
s1s = s1 + s2;
%soundsc(s1s);
audiowrite('7_356.wav',s1s, 8000);
%second delay of 1s
s3 = sx;
s4 = sx;
s3(end+1:end+1000)=0;
s4(1+1000:end+1000) = s4(1:end);
s4(1:1000)=0;
s2s = s3 + s4;
%soundsc(s2s);
audiowrite('7_1s.wav',s2s, 8000);
%third delay of 4s
s5 = sx;
s6 = sx;
s5(end+1:end+4000)=0;
s6(1+4000:end+4000) = s6(1:end);
s6(1:4000)=0;
s3s = s5 + s6;
%soundsc(s3s);
audiowrite('7_4s.wav', s3s, 8000);