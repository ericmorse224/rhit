%
%  parameters to use for the wheel system
%
%
  Ts = 0.05;  % the sampling interval
  PERIOD = 14739;  % this corresponds to a 1000Hz pwm signal
  MAX_DUTY = 2*PERIOD;
  Convert_to_dutycycle = MAX_DUTY/1023.0;  % convert A/D value to dutycycle value
  AD_scale = 0.16;  % convert from pot value (0-1023) to radians/sec
  Convert_to_rad_per_sec = 2*pi/720/Ts;  % scaling used with encoder values
%  
  Control_effort_saturation = MAX_DUTY*AD_scale/Convert_to_dutycycle; % maximum allowable control effort
%  
  MAX_DELTA_U = 1000.0;  % the largest step change in control effort
  Max_speed = 113.0;    % the maximum possible speed
  Relay_on = 26.0;        % when does the motor turn on going up
  Relay_off = 14.0;      % when does the motor stp coming down
  Rising_slew = MAX_DELTA_U*AD_scale/(Ts*Convert_to_dutycycle);    % maximum positive slope for control effort
  Falling_slew = -MAX_DELTA_U*AD_scale/(Ts*Convert_to_dutycycle);  % maximum negative slope for control effort 
%
%  wheel system parameters
%
  C = 0.038825;         % old values 0.03096
  c = 0.96017;            % old values 0.969
  delay = 1;    
%
%  PID control parameters
%
  kp = 2.5056;           %old value = 4.462  not as old 2.5056
  ki = 0.5457;          %old value = 0.2513   not as old 0.5457
  kd = 6.8829;         %old value = -2.294   not as old 6.8829
  MAX_ISUM = 88.2744;   % maximum value of the integrator old value = 250
                        %old value = 88.2744
  
  reference_scaling = 1.0;  % used to scale the reference signal for good steady state error
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
   [z,p,k] = zpk(d)  % we don't really need this one