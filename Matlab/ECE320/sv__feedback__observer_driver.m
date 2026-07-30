%
%  run the transfer function and state variable comparison
%
%  The following is the true model
%
  A = [0 1; -2 -3];
  B = [1; 0];
  C = [1 0];
  D = [0];
%  
%  The following are what we think th model is
%
  A_obs = A*0.8;
  B_obs = B*1.2;
  C_obs = C;
%
%  determine the state variable feedback gain
%
  p = [-1, -1.5];  % the desired pole location
  K = place(A_obs, B_obs, p);
%  K = lqr(A,B,diag([1.0 0.1]),100)
%
%  determine the observer gain
%
  p_obs = p*1;
  Ke = place(A_obs',C_obs',p_obs)';
%
%  determine the prefilter, for now it is just 1
%
  num_Gpre = -1;
  den_Gpre = C_obs*inv(A_obs-B_obs*K)*B_obs;
%
%  setup the input
%
  Tf = 5.0;
  t = linspace(0,Tf,1000);
  r = ones(1,length(t));
  rt = [t' r'];
%  
%  now simulate the system in Simulink
%
  sim('sv_feedback_observer_model');
%
%  plot the results
%
  figure;
  orient landscape
  subplot(2,1,1); 
  plot(sv_time,sv_x1,'r--', sv_time, sv_x1_obs,'b:'); grid;
  xlabel('Time(sec)'); ylabel('x_1'); legend('Plant','Observer');
  subplot(2,1,2);
  plot(sv_time,sv_x2,'r--',sv_time, sv_x2_obs,'b:'); grid;
  xlabel('Time(sec)'); ylabel('x_2'); legend('Plant','Observer');
