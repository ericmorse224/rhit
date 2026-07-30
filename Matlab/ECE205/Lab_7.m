%%Eric Morse CM2084
%%ECE205 Lab 7 Feedback Control Systems
%%First Order System
clear variables
tau = 0.001;
K = 2.0;
Gp = tf(K, [tau 1]);
Tf = 0.01;
t = linspace(0, Tf, 1000);
r = 0.1*ones(1,length(t));
kp = 5;
Gc = tf(kp,1);
%Gc = tf(500, [1 0]);
%Gc = tf(kp*[1 10], [1 0]);
Go = minreal(Gc*Gp/(1+Gc*Gp))
[num_Go, den_Go] = tfdata(Go, 'v');
num_Gpf = den_Go(end);
den_Gpf = num_Go(end);
Go = Go*num_Gpf/den_Gpf;
y = lsim(Go, r, t);

xt = [t' r'];
[num_Gp, den_Gp] = tfdata(Gp, 'v');
[num_Gc, den_Gc] = tfdata(Gc, 'v');
sim('closedloop');

plot(t, y, 'b-', ts, ys, 'g--');
grid on;
xlabel('Time(sec)');
ylabel('y(t)');
title('Response of First Order Closed Loop System');
legend('Matlab', 'Simulink');

%% Part A 15 Second Order System
clear variables
damping_ratio = 0.2;
Wn = 2000;
K = 1.5;
Gp = tf(K*Wn^2, [1 2*damping_ratio*Wn Wn^2]);
Gc = tf(250, [1 0]);
Tf = 0.02;
t = linspace(0, Tf, 1000);
r = 0.1*ones(1,length(t));
Go = minreal(Gc*Gp/(1+Gc*Gp))
[num_Go, den_Go] = tfdata(Go, 'v');
num_Gpf = den_Go(end);
den_Gpf = num_Go(end);
Go = Go*num_Gpf/den_Gpf;

y = lsim(Go, r, t);

xt = [t' r'];
[num_Gp, den_Gp] = tfdata(Gp, 'v');
[num_Gc, den_Gc] = tfdata(Gc, 'v');

sim('closedloop');

plot(t, y, 'b-', ts, ys, 'g--');
grid on;
xlabel('Time(sec)');
ylabel('y(t)');
title('Response of Second Order Closed Loop System');
legend('Matlab', 'Simulink');
