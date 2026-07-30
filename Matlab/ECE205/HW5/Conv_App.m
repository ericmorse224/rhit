%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ECE205 Convolution Application
% Written by Y.J.D. Kim on April 4, 2014
%
% Modified by Eric Morse on January 13, 2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Read .wav files into MATLAB 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% x: input speech waveform
% h: impulse response of a concert hall
% fs: sample rate of the recordings (Hz)
% N: number of bits per sample used to encode the recordings
[x,fs] = audioread('SamMagee.wav');
[h,fs_h] = audioread('concert_hall.wav');
x = sum(x,2); % L+R channels for MONO sound
h = sum(h,2); % L+R channels 
N_x = length(x);
N_h = length(h);
h = downsample(h, fs_h/fs); % downsample h to match the sample rate of x
t_x = (0:length(x)-1)/fs; % time vector for x(t)
t_h = (0:length(h)-1)/fs; % time vector for h(t)
t_y = (0:length(h)+length(x)-2)/fs; % time vector for y(t)

%%%%%%%%%%%%%%
% Convolution 
%%%%%%%%%%%%%%
    
% CONVOLVE x AND h TO PRODUCE y
y = conv(x,h);

%%%%%%%%%%%%%%%%%%%%%%%%
% Plotting and Playback 
%%%%%%%%%%%%%%%%%%%%%%%%

% PLAY THE CONVOLUTION OUTPUT y (HINT: SAMPLING FREQUENCY IS fs)
sound(y, fs);
%sound(x, fs);
% PLOT x, h, AND y. PROPERLY LABEL YOUR PLOTS USING xlabel, ylabel, title

%plot(t_x, x);
%xlabel('Time(sec)');
%ylabel('x(t) (dB)');
%title('Plot of input x(t)');

%plot(t_h, h);
%xlabel('Time(sec)');
%ylabel('h(t) (dB)');
%title('Plot of impulse response h(t)');

%plot(t_y, y);
%xlabel('Time(sec)');
%ylabel('y(t) (dB)');
%title('Plot of output y(t)');