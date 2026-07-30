%ECE300 Prelab 7 Eric Morse and Tom Tao
clear variables;
T0 = 0.01;
N = 2048;
deltat = T0/N;
t = linspace(0,(N-1)*deltat,N);
x1 = cos(2*pi*1000*t).*sinc(t/(250*10e-6));
x2 = cos(2*pi*1000*t+pi/3).*sinc(t/(250*10e-6));
x3 = cos(2*pi*1000*t+pi/2).*sinc(t/(250*10e-6));
%setup time vector
X1 = fft(x1)/N; 
Xshift1 = fftshift(X1); 
XX1 = Xshift1(((N/2)-29):((N/2)+31)); 
X2 = fft(x2)/N; 
Xshift2 = fftshift(X2); 
XX2 = Xshift2(((N/2)-29):((N/2)+31)); 
X3 = fft(x3)/N; 
Xshift3 = fftshift(X3); 
XX3 = Xshift3(((N/2)-29):((N/2)+31)); 

w0 = 2*pi/T0;
w = w0*(-30:30); 
%
figure(1)
plot(w, abs(10*log10(XX1)), '-', w, abs(10*log10(XX2)), '.-', w, abs(10*log10(XX3)), 'x-');
title('Magnitude Spectrum');
legend('phase = 0','phase = pi/3', 'phase = pi/2');
xlabel('\omega (rad/s)'); 
ylabel('|Y|'); 
% 


