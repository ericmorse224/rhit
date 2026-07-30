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
%  determine the state variable feedback gain
%
  p = [-1, -1.5]*1;  % the desired pole location
  K = place(A, B, p);
%  K = lqr(A,B,diag([1.0 0.1]),100)
%
%  determine the prefilter, for now it is just 1
%
  num_Gpre = -1;
  den_Gpre = C*inv(A-B*K)*B;
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
  sim('sv_feedback_model');
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
