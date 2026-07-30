%ECE205 Lab 4 Eric Morse
%Part B-1
Vin = [40 80 120 160 200 240 280 320 360 400 440 480 520];
Vout = [390 792 1220 1616 1967 2320 2604 2811 2953 3029 3062 3084 3095];
N = 7;

%Part B-8
%Vin = [40 80 120 160 200 240 280 320 360 400 440 480 520];
%Vout = [276 589 859 1148 1421 1637 1862 2015 2102 2157 2189 2200 2211];
%N = 7;

p = polyfit(Vin(1:N), Vout(1:N), 1);
m = p(1); b = p(2);
est_output = m*Vin+b;
plot(Vin, Vout, 'o', Vin, est_output, '-'); grid; xlabel('V_{in} (mV)'); 
ylabel('V_{out} (mV)'); 
title('Figure 1: Measured Data and Least Squares Fit (Gain = 9.98)');
%plot(Vin, Vout, 'o', Vin, est_output, '-'); grid; xlabel('V_{in} (mV)'); 
%ylabel('V_{out} (mV)'); 
%title('Figure 4: Measured Data and Least Squares Fit (Gain = 7.1)');