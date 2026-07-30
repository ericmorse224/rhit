% Eric Morse and Ran Tao CM2084
% ECE300 Prelab Lab 1
% 
% Initialize all variables 
% 
clear variables 
% 
%  this program determines results for Prelab of Lab 1 
% 
f = linspace(0, 4000, 4000);
Hf = 2.38*10^21./((j*2*pi*f).^5+(61*10^3*(j*2*pi*f).^4)...
    +(1.86*10^9*(j*2*pi*f).^3)+(35.1*10^12*(j*2*pi*f).^2)...
    +(409*10^15*j*2*pi*f)+2.38*10^21);
IL = -20*log10(abs(Hf));
IA = angle(Hf);
%subplot(2,1,1);
%plot(f, IL);
%xlabel("frequency (Hz)");
%ylabel("insertion loss (dB)");
%title("insertion loss vs frequency");
%subplot(2,1,2);
%plot(f, IA);
%xlabel("frequency (Hz)");
%ylabel("phase (degrees)");
%title("phase response in degrees");

f1 = 3000;
Hf1 = 2.38*10^21/((j*2*pi*f1)^5+(61*10^3*(j*2*pi*f1)^4)...
    +(1.86*10^9*(j*2*pi*f1)^3)+(35.1*10^12*(j*2*pi*f1)^2)...
    +(409*10^15*j*2*pi*f1)+2.38*10^21);
mag = 5*abs(Hf1);
ang = angle(Hf1)+30;

%% Part 2 ECE300 Lab 1
fmeas = [100 200 300 400 500 600 700 800 900 1000 1100 1200 1300 1400 ...
    1500 1600 1700 1800 1900 2000 2100 2200 2300 2400 2500 2600 2700 ... 
    2800 2900 3000 3100 3200 3300 3400 3500 3600 3700 3800 3900 4000];
VLmeas = [0.98 0.94 0.94 0.94 0.94 0.94 0.94 0.94 0.94 0.94 0.94 0.94 ...
    0.94 0.94 0.94 0.94 0.94 0.9 0.9 0.9 0.9 0.9 0.86 0.86 0.82 ...
    0.82 0.78 0.74 0.7 0.66 0.58 0.54 0.5 0.46 0.42 0.38 0.34 0.3 ...
    0.26 0.22];
Hfmeas = 2.38*10^21./((j*2*pi*fmeas).^5+(61*10^3*(j*2*pi*fmeas).^4)...
    +(1.86*10^9*(j*2*pi*fmeas).^3)+(35.1*10^12*(j*2*pi*fmeas).^2)...
    +(409*10^15*j*2*pi*fmeas)+2.38*10^21);
ILmeas = -20*log10(abs(Hfmeas));

%plot(f, IL, '-', fmeas, ILmeas, 'x');
%xlabel('frequency (Hz)');
%ylabel('insertion loss (dB)');
%title('insertion loss vs frequency');
%legend('expected', 'measured');

%% Part 3 ECE300 lab 1
Pmeas = [-7 -11.53 -19.94 -22.25 -30.12 -34.96 -38.54 -48.09 -56.3 ...
    -61.72 -68.24 -74.63 -81.83 -82.99 -93.93 -101.8 -108.1 -111.5 ...
    -122.4 -124.1 -135.7 -140.1 -154.8 -163.1 -170 179.7 170.1 ...
    163.8 153.4 148.7 144.3 133.3 122.0 115.7 107.8 100.4 86.68 ...
    83.11 76.14 70.86];
plot(f, IA*180/(pi), '-', fmeas, Pmeas, 'x');
xlabel('frequency (Hz)');
ylabel('phase (degrees)');
title('phase vs frequency');
legend('expected', 'measured');

