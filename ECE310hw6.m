% ECE310 Eric Morse Problem Set 6 Problem 1
t = linspace(0, 1, 5500);
m = @(t) 5*cos(2*pi*2500*t)+4*cos(2*pi*5500*t);
subplot(5,1,1)
plot(t, m(t)); title('waveform signal m(t)'); xlabel('time (seconds)');
ylabel('Amplitude');
subplot(5,1,2)
g1 = @(t) 50*(1+0.2*m(t)/9).*cos(2*pi*30000*t);
plot(t, g1(t)); title('AM waveform g(t) for u=0.2'); xlabel('time (s)');
ylabel('Amplitude');
subplot(5,1,3)
g2 = @(t) 50*(1+0.6*m(t)/9).*cos(2*pi*30000*t);
plot(t, g2(t)); title('AM waveform g(t) for u=0.6'); xlabel('time (s)');
ylabel('Amplitude');
subplot(5,1,4)
g3 = @(t) 50*(1+1*m(t)/9).*cos(2*pi*30000*t);
plot(t, g3(t)); title('AM waveform g(t) for u=1'); xlabel('time (s)');
ylabel('Amplitude');
subplot(5,1,5)
g4 = @(t) 50*(1+2*m(t)/9).*cos(2*pi*30000*t);
plot(t, g4(t)); title('AM waveform g(t) for u=2'); xlabel('time (s)');
ylabel('Amplitude');
