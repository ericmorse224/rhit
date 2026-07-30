%
%  parameters to use for the wheel system
%
%
  Ts = 0.05;  % the sampling interval
  PERIOD = 14739;  % this corresponds to a 1000Hz pwm signal
  MAX_DUTY = 2*PERIOD;
  Convert_to_dutycycle = MAX_DUTY/1023.0;  % convert A/D value to dutycycle value
  AD_scale = 1.00;  % convert from pot value (0-1023) to radians/sec
  Convert_to_rad_per_sec = 2*pi/720/Ts;  % scaling used with encoder values
%  
  Control_effort_saturation = MAX_DUTY*AD_scale/Convert_to_dutycycle; % maximum allowable control effort
%  
  MAX_DELTA_U = 10000.0;  % the largest step change in control effort
  Max_speed = 1000.0;    % the maximum possible speed
  Relay_on = 50.0;        % when does the motor turn on going up
  Relay_off = 20.0;      % when does the motor stp coming down
  Rising_slew = MAX_DELTA_U*AD_scale/(Ts*Convert_to_dutycycle);    % maximum positive slope for control effort
  Falling_slew = -MAX_DELTA_U*AD_scale/(Ts*Convert_to_dutycycle);  % maximum negative slope for control effort 
%
%  wheel system parameters
%
  C = 0.03096;
  c = 0.969; 
  delay = 1;    
%
%  PID control parameters
%
  kp = 5.0;
  ki = 0.0;
  kd = 0.0;
  MAX_ISUM = 7500.0;  % maximum value of the integrator 
  
  reference_scaling = 1.0;  % used to scale the reference signal for good steady state error
%  
%  design a lowpass filter
%
   Fs = 1/Ts;  % sampling rate in Hz
   nfilt = 3;  % filter order-1
   hp_freq = 5.0; % halfpower frequency
 
   d = designfilt('lowpassiir','FilterOrder',nfilt, ...
              'HalfPowerFrequency',hp_freq,'SampleRate',Fs);
   fvtool(d)
   [B, A] = tf(d)
   [z,p,k] = zpk(d)  % we don't really need this one