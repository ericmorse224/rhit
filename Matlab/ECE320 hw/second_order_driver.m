%
%  Second Order System Driver File
%
clear
%  Load the "measured" data
%
  data = load('measured_1');
  t = data(:,1);  % the time
  x = data(:,2);  % the input
  y = data(:,3);  % the output
%  
%  Estimated Parameters:
%
zeta = 0.05;
omega_n = 10.0;
K = 1.5;
Amp = x(end);   % get the final x value (they should all be the same)
Tf = t(end);    % get the final time for the measured data
%
%  run the simulation
%
  sim('Second_Order_System.mdl');
%
%  Now plot the output
%
  close  % close the current figure
  hold on
  plot(t,x,'g-','Linewidth',2);    % plot the input
  plot(t,y,'b--','Linewidth',2);   % plot the measured data
  plot(model_time,model_y,'r-','Linewidth',2);  % plot the model data
  hold off
  grid; legend('Meaured Input', 'Measured Output','Model Output');
  xlabel('Time (sec)'); ylabel('y(t)');
  title(['K = ',num2str(K,3),', \zeta = ',num2str(zeta,5),', \omega_n = ',num2str(omega_n,4)]);