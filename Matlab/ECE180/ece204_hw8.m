%%Eric Morse
%%ECE204 Homework 8
%% Problem 3
%ff=(0:1000:100000);
%V0 = 5*cos(2*pi*ff);
%plot(ff,V0)
R=20000; C= 0.01*10^(-6); L = 0.001;
sys_1 = tf([1 0 1/(L*C)],[1 1/(R*C) 1/(L*C)]);
w = logspace(3, 5, 50);
bode(sys_1, w)