%
%   Matlab driver for the for open loop model of a simple wheel
%
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%  Model Parameters should be read in from the workspace
%  (run wheel_paramters first)
%
%
%  read the parameters from the file
%       
%   data = load('Step_Response_50.log');
%   data = load('step_response_75.log');
%   data = load('Openloop_Response.log');
data = load('response1.log');
   
   t = data(:,1)/100.0;
   r = data(:,2)/100.0;
   u = data(:,3)*AD_scale/Convert_to_dutycycle;
   y = data(:,4)/100.0;
   
   tfix = t(1);
   t = t-tfix;
   Tf = t(end);
   ut = [t r];
%
%  the delay in the plant is an integer in the workspace (plant_delay)
%  now simulate the system
%
  sim('DT_Openloop');
%
%  plot the results
%
  figure
  orient landscape
  subplot(2,1,1); 
  [mts, yts] = stairs(m_time,m_y); 
  [ts, ys] = stairs(t, y);
  plot(ts,ys,'r',mts,yts,'b','Linewidth',1.5); legend('Measured','Model'); grid; xlabel('Time (sec)'); ylabel('Speed (rad/sec)');
  subplot(2,1,2); 
  [mts, mtu] = stairs(m_time,m_u); 
  [ts, us] = stairs(t, u);
  plot(ts,us,'r',mts,mtu,'b--','Linewidth',1.5); legend('Measured','Model'); grid; xlabel('Time (sec)'); ylabel('Control Effort (rad/sec)');
  % axis([0 Tf 0 Control_effort_saturation]);
