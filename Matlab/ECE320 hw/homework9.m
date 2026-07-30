%
% computation of G and H from A and B
%
%  Continuous-time state variable model
%
%  System A
%
  A = [0 1; -100 -2];
  B = [0; 200];
  C = [1 0];
  D = [0];
%
%  System B
%
%   A = [0 50; -100 -20];
%   B = [0; 20];
%   C = [1 0];
%   D = [0];
%
%  create the system
%
  sys = ss(A,B,C,D);
%
% create the final time, time vector, and input vector
%
  Tf = 5;
  t = linspace(0,Tf,1000);
  u = ones(1,length(t));
%
%  simulate the continuous-time system
%
  y = lsim(sys,u,t);
%
%  plot the output
%
  plot(t,y,'g','Linewidth',2); xlabel('Time (sec)'); ylabel('y(t)');
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  Now create the discrete-time version
%
%  Set the sampling interval
%
  Ts = 0.05;
%
% detemrine the time vector and input, the time vector must be sampled
%  every Ts seconds
%
  t_d = [0:Ts:Tf];
  u_d = ones(1,length(t_d));
%
% Let Matlab determine the discrete-time equivalents (no fun!)
%
  [G,H] = c2d(A,B,Ts)
%
%  create the first discrete-time system
%
  sys_d = ss(G,H,C,D,Ts);
%
%  simulate this system
%
  y_d = lsim(sys_d,u_d,t_d);
%
%  prepare to plot the output
%
  [td_1, yd_1] = stairs(t_d,y_d);
%
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%  Now estimate G and H based on the infinite series expansion
%  N is the number of terms
%
  G = eye(size(A));
  H = eye(size(A))*Ts;
  product_G = eye(size(A));
  product_H = eye(size(A))*Ts;
  N = 3;
  for i = 1:N
      product_G = product_G*A*Ts/i;
      product_H = product_H*A*Ts/(i+1);
      G = G + product_G;
      H = H + product_H;
  end
  H = H*B;
%
%  write the new G and H to the screen
%
  G
  H
%
%  create the second system and simulate it
%
  sys_dd = ss(G,H,C,D,Ts);
%
%  simulate the system
%
  y_dd = lsim(sys_dd,u_d,t_d);
%
%  prepare to plot the output
%
  [td_2, yd_2] = stairs(t_d,y_dd);
%
%  Now finish plotting
%
  hold on
  plot(td_1,yd_1,'r--','Linewidth',2);
  plot(td_2,yd_2,'b:','Linewidth',2);
  grid; xlabel('Time (sec)'); ylabel('y');
  title(['Using Ts = ' num2str(Ts) ' seconds and N = ' num2str(N)]); 
  hold off;
  