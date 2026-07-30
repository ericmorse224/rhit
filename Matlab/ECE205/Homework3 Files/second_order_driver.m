%
%  Second Order System Driver File
%
clear
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  In class Example
%
  y = @(t) 7.264*exp(-3.6*t).*sin(11.45*t+1.301)-6;
%
%  Estimated Parameters:
%
  %t = linspace(0,80,1000);
  t = linspace(0,2,20);
  zeta = 0.3;
  omega_n = 12;
  K = -3;
  y0 = 1;
  y0_dot = -3;
  Amp = 2;   % get the final x value (they should all be the same)
  Tf = t(end);    % get the final time for the measured data
%
%  run the simulation
%
  sim('Second_Order_System.slx');
%
%  Now plot the output
%
% td = downsample(t,20);
  td = downsample(t,1);
  hold on
  plot(td,y(td),'bo');
  plot(model_time,model_y,'r-','Linewidth',2);  % plot the model data
  hold off
  grid;
  legend('Analytical','Simulated');
  xlabel('Time (sec)'); ylabel('y(t)');
  title(['K = ',num2str(K,3),', \zeta = ',num2str(zeta,5),', \omega_n = ',num2str(omega_n,4)]);