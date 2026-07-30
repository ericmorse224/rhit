%ECE300 Eric Morse and Tom Tao Prelab Lab 8

f=logspace(0,4,1000);
w=2*pi*f;
fc=250;
wc=2*pi*fc;

% First Order Filter

[Nbu1,Dbu1]=butter(1,wc,'s');

HwBu1=freqs(Nbu1,Dbu1,w);
freqx = [100 150 200 250 1000 5000 20000 31100];
ampy = [5.711/6.15 5.267/6.15 4.802/6.15 4.38/6.15 1.515/6.15 0.34/6.15 0.08884/6.15 0.06231/6.15];
dby = [-0.643 -1.34 -2.14 -2.948 -12.16 -25.11 -36.777 -39.88];
delayy = [-0.000615 -0.000528 -0.000533 -0.00048 -0.000792+0.0005 -0.0000493 -0.00001426 -0.0000099];
phasey = [22.16 31.48 38.46 44.41 74.21 91.54 104.7 111.7];
figure(1)
subplot(2,2,1), semilogx(f,abs(HwBu1),freqx, ampy,'x','LineWidth',2)
axis([1 1e4 0 1.3]);grid on;xlabel('frequency (Hz)');ylabel('|H| (V/V)')
title('Magnitude of H(\omega)')
subplot(2,2,3), semilogx(f,20*log10(abs(HwBu1)), freqx, dby,'x','LineWidth',2)
axis([1 1e4 -50 5]);grid on;xlabel('frequency (Hz)');ylabel('|H| (dB)')
subplot(2,2,2), semilogx(f,180*unwrap(angle(HwBu1))/pi, freqx, -1*phasey,'x','LineWidth',2)
axis([1 1e4 -180 180]);grid on;xlabel('frequency (Hz)');ylabel('\theta_H (deg)')
title('Phase of H(\omega)')
subplot(2,2,4), semilogx(f,unwrap(angle(HwBu1))./w, freqx, delayy,'x','LineWidth',2)
axis([1 1e4 -1e-3 1e-3]);grid on;xlabel('frequency (Hz)');ylabel('delay (s)')

figure(2)
sys=tf(Nbu1,Dbu1);
impulse(sys);

% Sixth Order Filter

[Nbu2,Dbu2]=butter(6,wc,'s');

HwBu2=freqs(Nbu2,Dbu2,w);
freqx2 = [50 100 150 238 350 400 450 570];
ampy2 = [5.974/6.15 5.668/6.15 5.469/6.15 4.342/6.15 0.948/6.15 0.458/6.15 0.235/6.15 0.0628/6.15];
dby2 = [-0.266 -0.723 -1.033 -3.023 -16.24 -22.56 -28.35 -39.818];
delayy2 = [-0.002464 -0.002553 -0.002596 -0.002819 0.0000547-0.003 0.000135-0.003 0.000245-0.003 0.001417-0.003];
phasey2 = [-44.42 -91.95 -141.7 -116-180 4.551-360 -22.18-360 -40.05-360 -69.37-360];
figure(3)
subplot(2,2,1), semilogx(f,abs(HwBu2),freqx2,ampy2,'x','LineWidth',2)
axis([1 1e3 0 1.3]);grid on;xlabel('frequency (Hz)');ylabel('|H| (V/V)')
title('Magnitude of H(\omega)')
subplot(2,2,3), semilogx(f,20*log10(abs(HwBu2)),freqx2, dby2,'x','LineWidth',2)
axis([1 1e3 -50 5]);grid on;xlabel('frequency (Hz)');ylabel('|H| (dB)')
subplot(2,2,2), semilogx(f,180*unwrap(angle(HwBu2))/pi,freqx2, phasey2,'x','LineWidth',2)
axis([1 1e4 -550 0]);grid on;xlabel('frequency (Hz)');ylabel('\theta_H (deg)')
title('Phase of H(\omega)')
subplot(2,2,4), semilogx(f,unwrap(angle(HwBu2))./w,freqx2, delayy2,'x','LineWidth',2)
axis([1 1e4 -4e-3 0]);grid on;xlabel('frequency (Hz)');ylabel('delay (s)')

figure(4)
sys=tf(Nbu2,Dbu2);
impulse(sys);

% Sixth Order Cheb Filter

[Nbu3,Dbu3]=cheby1(6, 2, wc,'s');
HwBu3=freqs(Nbu3,Dbu3,w);

freqx3 = [227 127 160 257 280 320 360 401];
ampy3 = [6.601/6.15 5.262/6.15 5.887/6.15 4.406/6.15 1.519/6.15 0.362/6.15 0.134/6.15 0.061/6.15];
dby3 = [0.6 -1.368 -0.393 -2.91 -12.16 -24.61 -33.24 -40.08];
delayy3 = [-0.000475-0.004 -0.00353 -0.00345 -0.000657-0.004 -0.002582-0.002 -0.001091-0.003 -0.001051-0.003 -0.0015-0.002];
phasey3 = [-38.9-180 -159.9 -163.9 -56.8-180 -100.1-180 -124.1-180 -135.7-180 -143.9-180];

figure(5)
subplot(2,2,1), semilogx(f,abs(HwBu3),freqx3, ampy3,'x','LineWidth',2)
axis([1 1e3 0 1.3]);grid on;xlabel('frequency (Hz)');ylabel('|H| (V/V)')
title('Magnitude of H(\omega)')
subplot(2,2,3), semilogx(f,20*log10(abs(HwBu3))+2,freqx3,dby3,'x','LineWidth',2)
axis([1 1e3 -50 5]);grid on;xlabel('frequency (Hz)');ylabel('|H| (dB)')
subplot(2,2,2), semilogx(f,180*unwrap(angle(HwBu3))/pi,freqx3,phasey3,'x','LineWidth',2)
axis([1 1e4 -360 0]);grid on;xlabel('frequency (Hz)');ylabel('\theta_H (deg)')
title('Phase of H(\omega)')
subplot(2,2,4), semilogx(f,unwrap(angle(HwBu3))./w,freqx3,delayy3,'x','LineWidth',2)
axis([1 1e4 -5e-3 0]);grid on;xlabel('frequency (Hz)');ylabel('delay (s)')

figure(6)
sys=tf(Nbu3,Dbu3);
impulse(sys);