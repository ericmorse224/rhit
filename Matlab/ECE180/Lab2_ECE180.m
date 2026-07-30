%%Lab2 Audio Spectrogram
%%Eric Morse and Leian Xu
%% 1.2
fs=8000;
D=2;
tt=(0:fs*D-1)'/fs;
f0 = 7900; 
x = sin(2*pi*f0*tt);
%%spectro(x,fs);
%% 2.1
D=10;
x = chirp(tt,40,D,4000); 
%%spectro(x,fs);
%% 2.3
D = 5;
x = chirp(tt,40,D,4000, 'lo');
%%spectro(x,fs);
%% 2.7
%%colormap('jet');
%%spectro(x,fs);
%% 2.8
colormap(spectral);
%%spectro(x,fs);
%% 3.1
f0 = 50; 
n = 30; 
x = diric(2*pi*f0*tt,2*n+1);
%%spectro(x,fs);
%% 3.5
%%figure
%%plot(tt,x)
%% 4.1
n = dsp.ColoredNoise(-1.5,length(tt),1); 
x = step(n); 
%%spectro(x,fs);
%%figure
%%plot(tt,x)
%% 5.1
%%[x,fs] = audioread('s1.wav');
colormap(spectral);
%%spectro(x,fs);
%% 5.2
%%reads audiofile and plots it
[x, fs] =audioread('s1.wav');
D=length(x)/fs;
tt=(0:fs*D-1)'/fs;
plot(tt,x)
grid on;
xlabel('time (s)');
title('s1.wav audio file');
%%snippet(x, fs);
%% 5.4
%%runs snippet tool for sampling intervals
%%snippet(x, fs);
%%spectro(x, fs, 30);
%% 5.10
%%runs various audio files for comparison
[x, fs] =audioread('s9.wav');
spectro(x, fs, 30);