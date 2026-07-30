% Eric Morse CM2084
% Homework Set #2 Problem 2.12
% 
% Initialize all variables 
% 
clear variables 
% 
%  this program runs the file test.mdl 
% 
tau = 0.000375; 
K = 0.01; 
A = 0.5; 
Tf = 0.005; 
y0 = 0;
% 
%  generate the input 
% 
x = @(t) 0*(t<0) ...     
    + 1 * ((t>=0)      & (t<0.0006 ))...     
    - 2 * ((t>=0.0006) & (t<0.002)) ...     
    + 6 *  (t>=0.002); 
ya = @(t) 0*(t<0) ...     
    + ((0-(0.01))*exp(-t/tau)+(0.01))              .* ((t>=0)&(t<0.0006)) ...     
    + ((0.01-(-0.02))*exp(-(t-0.0006)/tau)+(-0.02))   .* ((t>=0.0006)&(t<0.002))...     
    + ((-0.0193-(0.06))*exp(-(t-0.002)/tau)+(0.06)) .* (t >=0.002);

t = linspace(0, Tf, 300); 
xt = [t' x(t)']; 
sim('test.slx');
td = downsample(time, 10); 
%
%old plots
%
%plot(time, y, 'b- ',time, Kx, 'r--');  
%legend('y(t) ', 'y_{ss}');  
%grid on; 
%
%newest plot
%
plot(time, y, 'b-' ,time, Kx, 'r--', td, ya(td), 'mo');   
legend('Il(t)', 'Il_{ss}', 'Il_{analytical}'); 
grid on; 
%axis([ 0 max(time) 0 max(y)*1.1]); 
xlabel('Time (sec)');  
ylabel('Il(t) (A)');  
title('2.12 First Order System'); 