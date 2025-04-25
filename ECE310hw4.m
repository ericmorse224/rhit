%% Eric Morse ECE310 HW4
f = linspace(50, 5000);
plot(f, abs(1-0.9*exp(-1i*0.001*2*pi*f)))
title('Magnitude of Frequency Response')
ylabel('Magnitude')
xlabel('frequency (Hz)')
%% hw4 problem 2
k = linspace(0, 20, 21);
Q = @(k) sqrt(100*factorial(k)/(6.^k*exp(-6)));
semilogy(Q(k));
