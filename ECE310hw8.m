%Eric Morse ECE310 HW8
[m fs] = audioread('SamMagee.wav');
soundsc(m,fs);
deltat = 1/fs; N = length(m); deltaf = 1/(N*deltat);
f = linspace(-((N/2)-1)*deltaf,(N/2)*deltaf,N);
M = fftshift(fft(m))*deltat;
figure(1)
periodogram(M)
twomplus = hilbert(m);
figure(2)
periodogram(twomplus)
mh = imag(twomplus);
%soundsc(mh,fs)
figure(3)
subplot(2,1,1)
plot(f(1:101), mh(1:101)); title('plot of Hilbert transform mh');
ylabel('mh amplitude'); xlabel('time (s)');
subplot(2,1,2)
plot(f(1:101), m(1:101)); title('plot of message m');
ylabel('m amplitude'); xlabel('time (s)');
