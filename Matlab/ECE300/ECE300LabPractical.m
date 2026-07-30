%Eric Morse ECE300 Lab Practical
x = @(t) sin(2*pi*t).*(t>=0).*(t<0.25) ...
    + 16*(t-0.5).^2.*(t>=0.25).*(t<0.5);
To = 0.5;
N= 1024;
t = linspace(0,To,N);
figure(1)
plot(t,x(t))
xlabel('time (s)');
ylabel('x(t)');
title('plot of one period of x(t)');
X = fft(x(t))/N; 
Xshift = fftshift(X); 
XX = Xshift(((N/2)-4):((N/2)+6));
w0 = 2*pi/To;
k = [-5:5];
w = w0*k;
figure(2)
subplot(2,1,1)
plot(w, abs(XX))
xlabel('omega (rad/s)')
ylabel('magnitude of X[k] (dB)')
title('magnitude spectrum of X[k]')

subplot(2,1,2)
plot(w, angle(XX))
xlabel('omega (rad/s)')
ylabel('angle in rad')
title('angle spectrum')