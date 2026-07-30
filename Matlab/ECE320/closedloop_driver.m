%
%  driver for closed loop system
%
  clear variables
%
%  for Part D
%
%  Ts = 0.1; Tf = 8.0;
%
%  Part E
% 
%  Ts = 0.1; Tf = 4.0;
%
%  Part F
%
%  Ts = 0.1; Tf = 2.5;
%
%  Part G
%  
  Ts = 0.1; Tf = 1.5;
%
%  Part H
%
%  Ts = 0.1; Tf = 2.0;
%
  t = [0:Ts:Tf];
  N = length(t);
%
%  determine the input (reference) signal
%
  r = ones(1,length(t));
% 
% prepare the reference signal and the corresponding time for Simulink
%
  rt = [t' r'];
%
%  determine the discrete-time transfer function, in terms of z
%
%  Gp = tf([0 1],[ 1 -0.8],Ts);        % Part D
%  Gp = tf([1 -0.2],[1 -0.8], Ts);     % Part E
%  Gp = tf([0.2 0.1],[1 -0.1 0.6],Ts); % Part F
Gp = tf([0.5],[1 1 1], Ts); %Part I
%
%  determine the discrete-time controller, in terms of z
%
%  Gc = tf(0.04,[1 -1],Ts);                    % part D
%  Gc = tf(0.115*[1 -0.547],[1 -1], Ts);        % part E
%  Gc = tf(1.0631*[1 -0.316 0.199],[1 -1 0],Ts);  % part F
%
%  determine the feedback delay
%
  H = tf(1,[1 0],Ts);
%
%  use this for the PI-D and I-PD controllers
%
%  C1 = tf(0.854*[1 0.734],[1 -1],Ts);  % part G
%  C2 = tf(0.278*[1 -1],[1 0], Ts);
%C2 = tf(0.048076*[1 -1],[1 0], Ts);
%
  C1 = tf(1.48*[1 0],[1 -1], Ts);
%  C2 = tf(0.15*[1 0.28],[1 0], Ts);
C2 = tf(0.057841*[1 0.28],[1 0], Ts);
%
%  determine the closed loop transfer function
%
%  Go = feedback(Gc*Gp,H);
  Go = minreal(C1*Gp/(1+H*Gp*(C1+C2)));  % for PI-D and I-PD
%
%  simulate the step response in Matlab
%
  yfinal = lsim(Go, r(1:N), t(1:N));
%
%  run the simulation
%
%  sim('closedloop_DE_C');
%  sim('PI_D_C');
   sim('I_PD_C');
%
%  Now plot the results
%
figure;
%plot(t,yfinal,'+'); grid; 
plot(ts,ys,'o',t,yfinal,'+'); grid; 
legend('Simulink ','Matlab');
xlabel('Time'); ylabel('y value');
 