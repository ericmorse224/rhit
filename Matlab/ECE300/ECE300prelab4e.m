% Eric Morse and Tom Tao CM2084
% ECE300 Prelab Lab 4 Part e
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
f=10:10:20000; 
rc1 = 0.00016;
rc2 = 0.0016;
rc3 = 0.016;
% Define time range with time step size T/100 
h1 = -1./(1+sqrt(-1)*2*pi*f*rc1); 
h2 = -1./(1+sqrt(-1)*2*pi*f*rc2);
h3 = -1./(1+sqrt(-1)*2*pi*f*rc3);
% zeroeth-order truncted Fourier series 
figure(1)
subplot(2,1,1)
semilogx(f, 10*log(abs(h1.^2)), f, 10*log(abs(h2.^2)), f, 10*log(abs(h3.^2)))
xlabel('Frequency, Hz') 
ylabel('Gain(dB)') 
legend('10nF', '100nF', '1uF')
title('Magnitude of Gain of User3') 
subplot(2,1,2)
semilogx(f,unwrap(angle(h1)), f, unwrap(angle(h2)), f, unwrap(angle(h3)))
xlabel('Frequency, Hz')
ylabel('angle radians')
legend('10nF', '100nF', '1uF')
title('Phase plot of User3')

