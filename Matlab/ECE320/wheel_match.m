%
%  match step response of wheel
%
%  inputs:  t = sample times, y = output at those times
%
function [B,b,Ts]= wheel_match;
%
%  load the data
%
  %data = load('Step_Response_50.log');
  data = load('Step_Response_75.log');
  t = data(:,1)/100.0; 
  R = data(2,2)/100.0;
  u = data(:,3);
  y = data(:,4)/100.0; 
%
% adjust for the starting time
%
 tfix = t(1);
 t = t-tfix;
%
%  determine how many samples to use
%
  Tmax = 100.0;  % the last time to look at
  if(Tmax < t(end))
      temp = find(t>=Tmax);
      N = temp(1);
  else
      N = length(t);
  end;
  
  t = t(1:N);
  y = y(1:N);
%
%  guess the parameters
%
  D = 72; c = 0.968;
  delay = 1;
  
%  plot the measured and estimated values
%
  est_y = zeros(1,N);
%
  for i = delay:N
       n = i-delay;
       est_y(i) = D*(1-c^n);
  end;
  plot(t, y, 'r', t, est_y, 'b','Linewidth',1.5); grid; xlabel('Time (sec)');ylabel('radians/sec)')
  title(['R = ', num2str(R,3) ', delay = ', num2str(delay,3) ', D = ', num2str(D,3) ', C = ', num2str(D*(1-c)/R,5) ', c = ', num2str(c,5)]);
   legend('Mesaured','Estimated');