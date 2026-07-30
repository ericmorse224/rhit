%% Lab 9 Circuit 1 measurements
f1 = [1 10 100 1000 10000 100000 200000 300000 400000 500000 700000 ... 
    900000 1000000 1560000];
vs1 = [1.16 1.16 1.1 1.1 1.1 1.1 1.1 1.08 1.08 0.13 0.13 0.13 0.128 0.116];
vo1 = [1.16 1.16 1.1 1.1 1.1 1.1 1.1 1.04 0.9 0.11 0.104 0.1 0.1 0.082];
f1rad = f1*2*pi; gain = vo1./vs1; gaindb = 20*log10(gain); figure(1)
semilogx(f1rad, gaindb, 1560000*2*pi, -3, 'r*'); 
title('Non-Inverter gain of 1'); xlabel('frequency (rad/s)'); 
ylabel('Magnitude (dB)');
%% Circuit 2 measurements
f2 = [1 10 100 1000 10000 30000 50000 70000 90000 100000 89390 1000000];
vs2 = [0.13 0.128 0.128 0.12 0.12 0.12 0.124 0.124 0.126 0.124 0.126 0.12];
vo2 = [1.2 1.22 1.22 1.22 1.22 1.14 1.08 1 0.9 0.86 0.9 0.12]; 
f2rad = f2*2*pi; gain2 = vo2./vs2; gaindb2 = 20*log10(gain2); figure(2)
semilogx(f2rad, gaindb2, 89390*2*pi, 17.08, 'r*');
title('Non-Inverter gain of 11'); xlabel('frequency (rad/s)');
ylabel('Magnitude (dB)');
%% Circuit 3 measurements
f3 = [1 10 100 1000 3000 5000 7000 9000 10000 30000 11000 100000 1000000];
vs3 = [1.02 1.02 1 1 1 1 1 1.02 1.02 1.02 1 1.02 1.02];
vo3 = [1 1.02 1 1 0.96 0.92 0.84 0.78 0.76 0.36 0.72 0.112 0.018];
f3rad = f3*2*pi; gain3 = vo3./vs3*101; gaindb3 = 20*log10(gain3); figure(3)
semilogx(f3rad, gaindb3, 11000*2*pi, 37.23, 'r*');
title('Non-Inverter gain of 101'); xlabel('frequency (rad/s)');
ylabel('Magnitude (dB)');