%ECE300 FFT Eric Morse CM2084
x = @(t) sin(15*t);
%fundamental period
To = 0.1;
%fixed values
N = 1024;
deltat = To/N;
w0 = 2*pi/To;
%setup time vector
t = linspace(0,(N-1)*deltat,N);
figure(1)
plot(t, x(t))
xlabel('time (s)')
ylabel('y(t)')
title('Signal')
xlim([-0.1 0.1])
%FFT of x(t)
% 
% Find the Fourier series coefficients 
% 
X = fft(x(t))/N; 
Xshift = fftshift(X); 
XX = Xshift(((N/2)-11):((N/2)+13)); 
% 
% Plot the spectra 
% 
w = w0*(-12:12); 
% 
figure(2); 
subplot(2,1,1); 
stem(w,abs(XX)); 
title('Magnitude Spectrum'); 
xlabel('\omega (rad/s)'); 
ylabel('|Y|'); 
% 
subplot(2,1,2); 
stem(w,angle(XX)); 
title('Angle Spectrum'); 
xlabel('\omega (rad/s)'); 
ylabel('\angle(Y) (rad)');

K = 12;
k = (-K:K)';
gg = XX*exp(1i*w0*k*t);
K1 = 10;
k1 = (-K1:K1)';
XX1 = Xshift(((N/2)-9):((N/2)+11)); 
gg1 = XX1*exp(1i*w0*k1*t);
K2 = 30;
k2 = (-K2:K2)';
XX2 = Xshift(((N/2)-29):((N/2)+31)); 
gg2 = XX2*exp(1i*w0*k2*t);
figure(3);
plot(t, x(t), '-', t, gg, '--', t, gg1, '^', t, gg2, '+');
legend('initial', 'y(t)', 'y1(t) from 20 coefficients', 'y2(t) from 60')
xlabel('time (s)')
ylabel('y(t)')
title('Reconstructed Signal')
xlim([-0.1 0.1])