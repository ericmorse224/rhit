%
%  run the transfer function and state variable comparison
%
%  setup the state variable model
%
  A = [0 1; -2 -3];
  B = [1; 0];
  C = [1 0];
  D = [0];
%
%
%  Now find the state feedback vector
%
  [n,m] = size(A);
  tA = [A zeros(n,1); -C 0]
  tB = [B; 0];
  p = [-10 -20 -30];
  KK = place(tA,tB,p);
%  KK = lqr(tA,tB,diag([0.1 0 0.1]),10);
%
%  extract the feedback components
%
  K = KK(1:(end-1))
  K1 = -KK(end)
%
%  setup the input
%
  Tf = 1.0;
  t = linspace(0,Tf,1000);
  r = ones(1,length(t));
  rt = [t' r'];
%  
%  now simulate the system in Simulink
%
  sim('sv_feedback_type_one_model');
%
%  plot the results
%
  figure;
  orient landscape
  subplot(2,1,1); 
  plot(sv_time,sv_x1,'r', sv_time, sv_x2,'k'); grid;
  xlabel('Time(sec)'); ylabel('Output'); legend('x_1', 'x_2');
  subplot(2,1,2);
  plot(sv_time,sv_u,'k'); grid;
  xlabel('Time(sec)'); ylabel('Control Effort');
