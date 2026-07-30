%% ECE180 P-4.13
%% part a
%%answer 1600 Hz
nn = 0:2190099;
xx = (7/pi)*cos(1.8*pi*nn + 2.03);
soundsc(xx, 16000);
%% part b
%%answer 9600 samples per second
fsamp = 9600;
tt = 0:1/2400:10000;
xx = cos(2*pi*1800*tt+pi/3);
soundsc(xx,fsamp);
%% part c
%%answer f = 2200 Hz duration = 12.8s
tt = 0:(1/8000):64;
xx = 1.23*cos(2*pi*440*tt);
soundsc(xx, 40000);