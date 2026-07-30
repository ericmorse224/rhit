%% Eric Morse CM2084 ECE320 HW2 Problem 2
H = tf([1 6],[1 5 6]);      % enter Hb transfer function
t = 0:0.01:5;       
ustep = ones(1,length(t));
uramp = t;
ystep = lsim(H, ustep, t);
yramp = lsim(H,uramp, t);
figure;
orient tall
subplot(2,1,1);
plot(t,ustep, '.-',t,ystep, '-');
grid;
legend('Step Input','Step Response');
subplot(2,1,2);
plot(t,uramp,'.-',t,yramp,'-');
grid;
legend('Ramp Input', 'Ramp Response');
%% for Ha transfer function
H = tf(1,[1 2]);      % enter Ha transfer function
t = 0:0.01:5;       
ustep = ones(1,length(t));
uramp = t;
ystep = lsim(H, ustep, t);
yramp = lsim(H,uramp, t);
figure;
orient tall
subplot(2,1,1);
plot(t,ustep, '.-',t,ystep, '-');
grid;
legend('Step Input','Step Response');
subplot(2,1,2);
plot(t,uramp,'.-',t,yramp,'-');
grid;
legend('Ramp Input', 'Ramp Response');