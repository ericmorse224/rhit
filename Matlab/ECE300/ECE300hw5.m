%%Eric Morse CM2084 ECE300 HW5
x = @(t) exp(2*t).*(rectangularPulse(0,2,t));
To = 16;
N = 1024*To/4;
deltat = To/N;
t = linspace(0,(N-1)*deltat,N);
X = fft(x(t))/N;
Xshift = fftshift(X);
XX = Xshift((N/2)-19:((N/2)+21));
w0 = 2*pi/To;
w = w0*(-20:20);
%
g = @(w) (exp(4-2i*w)-1)./(2-1i*w);
subplot(2,1,1);
plot(w, To*abs(XX),'-', w, abs(g(w)), '.');
legend('Series', 'Transform');
grid on;
title('Magnitude Spectrum To=16');
xlabel('\omega (krad/s)');
ylabel('|X|');
xlim([-5 5]);
%
subplot(2,1,2);
plot(w,angle(XX),'-', w, angle(g(w)), '.');
legend('Series', 'Transform');
grid on;
title('Angle Spectrum');
xlabel('\omega (krad/s)');
ylabel('\angle(X) (rad)');
xlim([-5 5]);