% Eric Morse and Tom Tao CM2084
% ECE300 Prelab Lab 4 Part b
% 
% Initialize all variables 
% 
clear variables 
% 
%  this program determines results for Prelab of Lab 4
% 
T = 1;
N = 100;
n=1:N; 
t=-0.1:1/100:3.1; 
% Define time range with time step size T/100 
x=zeros(1,length(t)); 
% zeroeth-order truncted Fourier series 
for k=1:N 
% loop through all N Fourier coefficients     
x = x + exp(sqrt(-1)*2*pi*k*t)/100;
end 
plot(t,x)  
xlabel('Time, t, sec') 
ylabel('x(t)') 
title('Truncated Fourier Series of Impulse Train') 