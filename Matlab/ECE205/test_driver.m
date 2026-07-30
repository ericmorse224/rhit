% Eric Morse CM2084
% ECE205 Lab 1
% 
% Initialize all variables 
% 
clear variables 
% 
%  this program runs the file test.mdl 
% 
tau = 0.2; 
K = 3; 
A = 1; 
Tf = 2; 
y0 = 0;
% 
%  generate the input 
% 
x = @(t) 0*(t<0) ...     
    + 1 * (t>=0); 
%ya = @(t) 0*(t<0) ...     
%    + (-0.01*exp(-t/0.0001)+0.02)              .* ((t>=0)&(t<0.0001)) ...     
%    + (0.04632*exp(-(t-0.0001)/0.0001)-0.03)   .* ((t>=0.0001)&(t<0.00025))...     
%    + (-0.05966*exp(-(t-0.00025)/0.0001)+0.04) .* (t >=0.00025);

t = linspace(0, Tf, 300); 
xt = [t' x(t)']; 
sim('test.slx');
td = downsample(time, 10); 
%
%old plots
%
plot(time, y, 'b- ',time, Kx, 'r--');  
legend('y(t) ', 'y_{ss}');  
grid on; 
%
%newest plot
%plot(time, y, 'b-' ,time, Kx, 'r--', td, ya(td), 'mo');   
%legend('y(t)', 'y_{ss}', 'y_{analytical}'); 
%grid on; 
%axis([ 0 max(time) 0 max(y)*1.1]); 
xlabel('Time (sec)');  
ylabel('y(t)');  
title('First Order System'); 