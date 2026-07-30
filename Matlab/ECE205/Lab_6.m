%%Eric Morse CM2084
%%ECE205 Lab 6 Transfer Functions
%%First Order System
clear variables
tau = 0.001;
K = 2.0;
Gp = tf(K, [tau 1]);
Tf = 0.01;
t = linspace(0, Tf, 1000);
x = 0.1*ones(1,length(t));
y = lsim(Gp, x, t);

ut = [t' x'];
[num_Gp, den_Gp] = tfdata(Gp, 'v');

sim('openloop');

plot(t, y, 'b-', ts, ys, 'g--');
grid on;
xlabel('Time(sec');
ylabel('y(t)');
title('Response of First Order System');
legend('Matlab', 'Simulink');

%% Part A 15 Second Order System
clear variables
damping_ratio = 0.2;
Wn = 2000;
K = 1.5;
Gp = tf(K*Wn^2, [1 2*damping_ratio*Wn Wn^2]);
Tf = 0.01;
t = linspace(0, Tf, 1000);
x = 0.1*ones(1,length(t));
y = lsim(Gp, x, t);

ut = [t' x'];
[num_Gp, den_Gp] = tfdata(Gp, 'v');

sim('openloop');

plot(t, y, 'b-', ts, ys, 'g--');
grid on;
xlabel('Time(sec');
ylabel('y(t)');
title('Response of Second Order System');
legend('Matlab', 'Simulink');
