%
%  parameters to use for the wheel system
%
%
  Ts = 0.05;  % the sampling interval
  PERIOD = 14739;
  MAX_DUTY = 2*PERIOD;
  Convert_to_dutycycle = MAX_DUTY/1023.0;  % convert A/D value to dutycycle value
  AD_scale = 1.0;
  Convert_to_rad_per_sec = 2*pi/720/Ts;
%  
%  design a lowpass filter
%
   Fs = 1/Ts;  % sampling rate in Hz
   nfilt = 3;  % filter order-1
   hp_freq = 2.5; % halfpower frequency
 
   d = designfilt('lowpassiir','FilterOrder',nfilt, ...
              'HalfPowerFrequency',hp_freq,'SampleRate',Fs);
   fvtool(d)
   [B, A] = tf(d)
   [z,p,k] = zpk(d)