%
%  Second Order System Driver File
%
clear
%  Load the "measured" data
%
  %file = 'measured_1';
  %data = load(file);
  %t = data(:,1);  % the time
  %x = data(:,2);  % the input
  %y = data(:,3);  % the outp
y = 
%  
%  Estimated Parameters:
%
zeta = 0.3965;
omega_n = 0.378;
K = 4;
Amp = x(end);   % get the final x value (they should all be the same)
Tf = t(end);    % get the final time for the measured data
%
%  run the simulation
%
  sim('Second_Order_System.slx');
%
%  Now plot the output
%
  close  % close the current figure
  hold on
  plot(t,x,'g-','Linewidth',2);    % plot the input
  plot(model_time,model_y,'r-','Linewidth',2);  % plot the model data
  plot(t,y,'b--','Linewidth',2);   % plot the measured data
  hold off
  grid; legend('Meaured Input', 'Model Output', 'Measured Output');
  xlabel('Time (sec)'); ylabel(['y(t) - ' file]);
  title(['K = ',num2str(K,3),', \zeta = ',num2str(zeta,5),', \omega_n = ',num2str(omega_n,4)]);