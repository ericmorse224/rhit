%
%  check the filtering routine
%
%  Read int the data
%
  data = load('from_pot_1a');
  t = data(:,1)/100.0;
  y_original = data(:,2);
%
%  correct for time measurements
%
  t_fix = t(1);  % starting time
  t = t- t_fix; 
%
%   get the input ready for Simulink
%
  rt = [t y_original];
  Tf = t(end);
  Ts = t(2)-t(1);
%
  sim('simulate_filter');
%
%  plot the original and filtered signals
%
  figure
  orient tall
  subplot(2,1,1);
  plot(t,y_original,'k-',t_filtered,y_filtered,'r--'); grid;
  xlabel('Time (sec)'); ylabel('y(t)');legend('Unfiltered','Filtered');
  title('Original and Filtered Signals');
%
%  estimate the derivatives for the original and filtered signals.
%  Note that we are not dividing by dt, and just using a simple difference
%
  N = length(t);
  y_dot_original = y_original(2:end)-y_original(1:N-1);
  N = length(t_filtered);
  y_dot_filtered = y_filtered(2:end)-y_filtered(1:N-1);
  t = t(2:end);
  t_filtered = t_filtered(2:N);
  subplot(2,1,2);
  plot(t,y_dot_original,'k--',t_filtered,y_dot_filtered,'r--'); grid;
  xlabel('Time (sec)'); ylabel('dy/dt'); legend('Unfiltered','Filtered');
  title('Derivatives of Original and Filtered Signals');