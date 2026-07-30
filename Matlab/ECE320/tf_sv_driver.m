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
%  determine the transfer function model
%
  [num_Gp,den_Gp] = ss2tf(A,B,C,D);
   Gp = tf(num_Gp, den_Gp);
%  
%  enter the controller
%
  Gc = tf([6.825 6.825],[1 0]);  % this is an I controller
  [num_Gc, den_Gc] = tfdata(Gc,'v');
%
%  determine the prefilter, for now it is just 1
%
  num_Gpre = 1;
  den_Gpre = 1;
%
%  setup the input
%
  Tf = 2.0;
  t = linspace(0,Tf,1000);
  r = ones(1,length(t));
  rt = [t' r'];
%  
%  now simulate the systems in Simulink
%
  sim('tf_model');
  sim('sv_model');
%
%  plot the results
%
  figure;
  orient landscape
  subplot(2,1,1); 
  plot(tf_time, tf_y,'k--',sv_time,sv_y,'r:'); grid;
  xlabel('Time(sec)'); ylabel('Output'); legend('Transfer Function Model', 'State Variable Model');
  subplot(2,1,2);
  plot(tf_time, tf_u, 'k--', sv_time,sv_u,'r:'); grid;
  xlabel('Time(sec)'); ylabel('Control Effort'); legend('Transfer Function Model', 'State Variable Model');
