%
%  run the transfer function and state variable comparison
%
%  The following is the true model
%
  A = [0 1; -2 -3];
  B = [1; 0];
  C = [0 1];
  D = [0];
  Cy = [1 0];
%  
%  The following are what we think the model is
%
  A_obs = A*0.8;
  B_obs = B*1.2;
  C_obs = C;
%
%  Now find the state feedback vector
%
  [n,m] = size(A_obs);
  tA = [A_obs zeros(n,1); -Cy 0]
  tB = [B_obs; 0];
  p = [-1 -2 -3];
  KK = place(tA,tB,p);
%  KK = lqr(tA,tB,diag([0.1 0 0.1]),10);
%
%  extract the feedback components
%
  K = KK(1:(end-1))
  K1 = -KK(end)
%
%  determine the observer gain
%
  p_obs = [-1 -2]*3;
  Ke = place(A_obs',C_obs',p_obs)';
%
%  setup the input
%
  Tf = 10.0;
  t = linspace(0,Tf,1000);
  r = ones(1,length(t));
  rt = [t' r'];
%  
%  now simulate the system in Simulink
%
  sim('sv_feedback_observer_type1_model');
%
%  plot the results
%
  figure;
  orient landscape
  subplot(2,1,1); 
  plot(sv_time,sv_x1,'r--', sv_time, sv_x1_obs,'b:'); grid;
  xlabel('Time(sec)'); ylabel('x_1'); legend('Real','Observer');
  subplot(2,1,2);
  plot(sv_time,sv_x2,'r--',sv_time, sv_x2_obs,'b:'); grid;
  xlabel('Time(sec)'); ylabel('x_2'); legend('Real','Observer');
