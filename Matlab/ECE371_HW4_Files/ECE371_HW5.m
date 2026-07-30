%%ECE371 Hw5 Problem 1
%%Eric Morse

%% Part b
x = 0.1:0.1:1;
y = 0.9:0.9:9;
plot(x,y);
xlabel('Irradiance (kW/m^2)');
ylabel('Current (A)');
title('Isc vs Irradiance');

%% Part c
x = 0.1:0.1:1;
y = [41 42.3 43.2 44 44.5 45 45.4 45.7 45.9 46];
plot(x,y);
xlabel('Irradiance (kW/m^2)');
ylabel('Voltage (V)');
title('Voc vs Irradiance');

%% Part d
x = 0.1:0.1:1;
y = [35.5*0.9 36.5*1.8 36.7*2.7 37*3.6 37.1*4.5 37.1*5.4 37.1*6.3 37.1*7.2 37.2*8.1 37.1*9];
plot(x,y);
xlabel('Irradiance (kW/m^2)');
ylabel('Power (W)');
title('Power vs Irradiance');
%% Problem 2 part b
x = 0:20:80;
y = [8.9 9 9.1 9.2 9.3];
plot(x,y);
xlabel('Temperature (degrees C)');
ylabel('Current (A)');
title('Isc vs Temperature');
%% Problem 2 part c
x = 0:20:80;
y = [50 47 44 41 37.5];
plot(x,y);
xlabel('Temperature (degrees C)');
ylabel('Voltage (V)');
title('Voc vs Temperature');
%% Problem 2 part d
x = 0:20:80
y = [350 325 300 275 250];
plot(x,y)'
xlabel('Temperature (degrees C)');
ylabel('Power (W)');
title('Pmax vs Temperature');