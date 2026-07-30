% Eric Morse CM2084
% Homework Set #2 Problem 2.12
% 
% Initialize all variables 
% 
clear variables 
% 
%  this program runs the file test.mdl 
% 
tau = 6.67; 
K = 4; 
A = 2; 
Tf = 30; 
y0 = 0;
% 
%  generate the input 
% 
x = @(t) 1*(t>=0); 
ya = @(t) (5.33-5.806*exp(-0.15*t)*sin(1.216*t+1.1629))*(t>=0);

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