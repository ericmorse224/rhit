%
%  check the filtering routine
%
%  Read int the data
%
  data = load('filter_response.log');
  t = data(:,1)/100.0;
  y_original = data(:,2);
  y_filtered = data(:,3);
%
%  correct for time measurements
%
  t_fix = t(1);  % starting time
  t = t- t_fix; 
%
%  plot the original and filtered response as a first check
%
  figure;
  plot(t,y_original,'k-',t,y_filtered,'r-','Linewidth',2); grid;
  xlabel('Time (sec)'); legend('Unfiltered','Filtered');
%
%  run the signal and filter through Simulink as a check
%
%   be sure you have run wheel_parameters.m so the A abd B vectors
%   are in the workspace
%
%   get the input ready for Simulink
%
  rt = [t y_original];
  Tf = t(end);
  Ts = t(2)-t(1);
%
  sim('simulate_filter');
%
 figure
 plot(t,y_original,'k-',t,y_filtered,'r-',t_simulated,y_simulated,'o'); grid;
 xlabel('Time (sec)'); legend('Unfiltered','Filtered','Simulated');