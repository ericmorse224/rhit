%
%  Matlab driver for the for PID control of a simple wheel
%
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%  read the parameters from the file
%       
   %data = load('Step_Response.log');
   data = load('response4.log');
   t = data(:,1)/100.0;
   r = data(:,2)/100.0;
   u = data(:,3)*AD_scale/Convert_to_dutycycle;
   y = data(:,4)/100.0;
   tfix = t(1);
   t = t - tfix;
   rt = [t r];
   Tf = t(end);
%
%  now simulate the system
%
  sim('DT_PID');
%
%  plot the results
%
  figure
  orient landscape

%
%  Use the following when comparing to the measured data
%
  subplot(2,1,1);
  hold on
  title(['Reference Scaling = ' num2str(reference_scaling,4) ', k_p = ' num2str(kp,4) ', k_i = ' num2str(ki,4) ', k_d = ' num2str(kd,4)]);
  [mts, yts] = stairs(m_time,m_y); 
  [ts, ys] = stairs(t, y);
  [tr, yr] = stairs(t, r);
  plot(ts,ys,'r',mts,yts,'b',tr,yr,'k','Linewidth',1.5);
  legend('Measured','Model','Reference'); grid; xlabel('Time (sec)'); ylabel('Speed (rad/sec)');
  hold off
  subplot(2,1,2); 
  [mts, mtu] = stairs(m_time,m_u); 
  [ts, us] = stairs(t, u);
  plot(ts,us,'r',mts,mtu,'b','Linewidth',1.5); legend('Measured','Model'); grid; xlabel('Time (sec)'); ylabel('Control Effort (rad/sec)');
%   subplot(3,1,3); 
%   [mts, mis] = stairs(m_time,m_isum); 
%   [ts, sis] = stairs(t,isum);
%   plot(ts,sis,'r',mts,mis,'b','Linewidth',1.5); legend('Measured','Model'); grid; xlabel('Time (sec)'); ylabel('ISUM (rad/sec)');
