%% Lab 3 Eric Morse
%% Part B
%clear screen
clear all;
%input x(t) below
x = @(t) t.*cos(t);
%parameter a<t<b
a = -1;
b = 1;
%variables for computation
C = 1/(b-a);
Z = @(t) x(t).*x(t);
% I is average value
I = C*integral(x,a,b)
% RMS is rms value
RMS = sqrt(C*integral(Z,a,b))