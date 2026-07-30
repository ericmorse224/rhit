close all;
%
% plot results of controller
%
  data = load('results_on_off.log');
  t = data(:,1)/100.0;  % time signal
  r = data(:,2)/100.0;  % reference (input) signal
%  u = data(:,3)/MAX_DUTY;  % control effort
  y = data(:,3)/100.0;  % output signal
%
%  correct for time measurements
%
  t_fix = t(1);  % starting time
  t = t- t_fix;
%
%  Now plot
%
%  convert for discrete-time plot
%
  [tr, yr] = stairs(t, r);
  [ts, ys] = stairs(t, y);
  
  figure;
%
  orient landscape
%
  plot(tr,yr,'r:',ts,ys,'b','Linewidth',1.5);
  legend('Reference Speed (Input)','Actual Speed (Output)'); 
  grid; xlabel('Time (sec)');ylabel('Speed (rad/sec)');
 % title('Open Loop Control');
 % title('u = 0.2*U_{max}');
 % title('k_p = 10.0');
  title('k_p = 8.0, reference_scaling = 0.84');


  
  
 