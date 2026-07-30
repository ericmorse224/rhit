%
%  Matlab driver for the for model matching control of a simple wheel
%
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%  read the parameters from the file
%  
   data = load('Step_Response');
   % data = load('Match_Response');
   t = data(:,1)/100.0;
   r = data(:,2)/100.0;
   u = data(:,3)*AD_scale/Convert_to_dutycycle;
   y = data(:,4)/100.0;
   tfix = t(1);
   t = t - tfix;
   rt = [t r];
   Tf = t(end);
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  STEP #1:determine the desired closed loop transfer function
%
%    set the close-loop pole locations
%
     d = poly([0.8 0 0])
%
%    determine the numerator so the steady state error is zero for a step
%
     alpha = sum(d)
%
%    determine the closed loop transfer function
%
     Go = tf(alpha, d, Ts)
     [num_Go, den_Go] = tfdata(Go,'v');
%
%    simulate the closed loop transfer function
%
     sim('DT_Model_Matching_Desired');
%
%    plot the results
%
     [mts, yts] = stairs(m_time,m_y); 
     [ref_t, ref_r] = stairs(t,r);
     figure;
     orient landscape
     plot(mts, yts,'r-',ref_t,ref_r,'k--', 'Linewidth', 1.5); 
     legend('Model Output','Reference Signal');
     grid; xlabel('Time (sec)'); ylabel('Speed (rad/sec)');
     title('Desired Closedloop Response')
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % STEP #2: Determine the control signal, based on the plant model
% 
      Gp = tf(C,[1 -c], Ts);
      D = tf(1,[1 0 0], Ts); % this represents a delay of 2
      H = tf(1,[1 0],Ts);       % include the feedback delay
      Gp = Gp*D         % updata the transfer function to include the delay
      [num_Gp,den_Gp] = tfdata(Gp,'v')
%
%   now determine the controller
%
      Gc = Go/(Gp-Go*Gp*H)
      Gc = minreal(Gc)
      [num_Gc, den_Gc] = tfdata(Gc,'v');
%
%    get rid of the coefficients that are really zero
%
      tol = 1e-5
      Bc = (abs(num_Gc) > tol*ones(1,length(num_Gc))).*num_Gc
      Ac = (abs(den_Gc) > tol*ones(1,length(den_Gc))).*den_Gc
%
%    determine the new controller
%
      Gc = tf(Bc, Ac, Ts)
%
%    Is the controller implementable? 
%    Is the power of z in the denominator at least equal to that
%    in the numerator?  If not, add more poles at the origin in the
%    desired closedloop transfer function
%
%   Now simulate the system with the controller and plant model
%
      sim('DT_Model_Matching_Desired_with_Controller');
%
%    plot the results
%
     [mts, yts] = stairs(m_time,m_y); 
     [ref_t, ref_r] = stairs(t,r);
     figure;
     orient landscape
     plot(mts, yts,'r-',ref_t,ref_r,'k--', 'Linewidth', 1.5); 
     legend('Model Output','Reference Signal');
     grid; xlabel('Time (sec)'); ylabel('Speed (rad/sec)');
     title('Desired Closedloop Response with Controller');
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % STEP #3 Now simulate with all the constraints
% %
% %   Now simulate the system with the controller and plant model
% %
%       sim('DT_Model_Matching_Desired_with_Constraints');
% %
% %    plot the results
% %
%      [mts, yts] = stairs(m_time,m_y); 
%      [ref_t, ref_r] = stairs(t,r);
%      [mts, mu] = stairs(m_time, m_u);
%      
%      %
%      %  determine the maximum control effort
%      %
%      u_max = ones(1,length(m_time))*Control_effort_saturation;
%      
%      figure;
%      orient landscape
%      subplot(2,1,1); plot(mts, yts,'r-',ref_t,ref_r,'k--', 'Linewidth', 1.5); 
%      legend('Model Output','Reference Signal');
%      grid; xlabel('Time (sec)'); ylabel('Speed (rad/sec)');
%      title('Desired Closedloop Response with Constraints');
%      subplot(2,1,2); plot(mts, mu,'r-',m_time,u_max,'k--','Linewidth', 1.5); 
%      legend('Control Effort','Maximum Control Effort');
%      grid; xlabel('Time (sec)'); ylabel('Speed (rad/sec)');
% %
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % STEP 4 Now compare to the real system
% %
% %    plot the results
% %
%      [mts, yts] = stairs(m_time,m_y); 
%      [ref_t, ref_r] = stairs(t,r);
%      [mts, mu] = stairs(m_time, m_u);
%      [ts, ys] = stairs(t, y);
%      figure;
%      subplot(2,1,1);
%      plot(ref_t, ref_r,'k--', ts,ys,'r', mts,yts,'b','Linewidth',2); legend('Reference','Measured','Model'); grid; xlabel('Time (sec)'); ylabel('Speed (rad/sec)');
%      subplot(2,1,2); 
%      [mts, mtu] = stairs(m_time,m_u); 
%      [ts, us] = stairs(t, u);
%       plot(ts,us,'r',mts,mtu,'b--','Linewidth',2); legend('Measured','Model'); grid; xlabel('Time (sec)'); ylabel('Control Effort (rad/sec)');
