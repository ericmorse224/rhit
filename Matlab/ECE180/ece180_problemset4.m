%%Eric Morse
%%Problem Set 4
%% P-3.1(b)
tt=(0:0.01:0.1); 
x = 11+14*cos(2*pi*50*tt-pi/3)+8*cos(2*pi*175*tt-pi/2);
%figure
%plot(tt,x)
%title('Problem 3.1(b)');
%xlabel('time in s');
%% P-3.20 (a,b,c)
tt=(0:0.01:1);
x=0.5+1.2*cos(40*tt-1.4)+0.8*cos(90*tt+2);
%%figure
%%plot(tt,x)
%%title('Problem 3.20');
%%xlabel('time in s');
%% P-3.26
tt = (0:0.01:2);
x=-2+4*cos(2*pi*2*tt+pi);
figure
plot(tt,x)