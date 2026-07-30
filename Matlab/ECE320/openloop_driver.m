%
%  driver for an IIR implementation of a plant
%
  clear variables
%
  Ts = 0.1;
  Tf = 3;
  t = [0:Ts:Tf];
  N = length(t);
%
%  determine the input (reference) signal
%
  u = ones(1,length(t));
% 
% prepare the reference signal and the corresponding time for Simulink
%
  ut = [t' u'];
%
%  determine the discrete-time transfer function, in terms of z
%
 % Gp = tf([0 1],[ 1 -0.8],Ts);        % Part A
 % Gp = tf([1 -0.2],[1 -0.8], Ts);     % Part B
  Gp = tf([0.2 0.1],[1 -0.1 0.6],Ts); % Part C
%
%  simulate the step response in Matlab
%
  yfinal = lsim(Gp, u(1:N), t(1:N));
%
%  run the simulation
%
  sim('openloop_DE_C');
%
%  Now plot the results
%
figure;
%plot(t,yfinal,'+'); grid; 
plot(ts,ys,'o',t,yfinal,'+'); grid; 
legend('Simulink ','Matlab');
xlabel('Time'); ylabel('y value');
 