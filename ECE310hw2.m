%Eric Morse ECE310 HW#2 Problem 2
f = linspace(-10,10);
p = exp((-(pi*f).^2)/5);
t = sinc(f);
semilogy(f, p, '-', f, t, '*-')
ylim([10^(-5) 1])
xlim([-10 10])
title('Signal Comparison')
xlabel('frequency (Hz)')
ylabel('Power Spectral Density')
legend('PAM signal', 'Rectangular signal')

%% Problem 3
f = linspace(-1000000, 1000000);
S = (70*10^(-6))^2*(sinc(5*10^(-6)*f).*sin(2.5*10^(-6)*2*pi*f)).^2/(10*10^(-6));
plot(f, S)
title('Manchester power spectrum')
xlabel('frequency (Hz)')
ylabel('Amplitude')
%% Problem 4
N = 2;
for i = 1:N
    for j=1:16384
        r1(j,i) = -1+2*rand;
    end
end
for i = 1:16384
    for j = 1:N
        y1(i) = sqrt(N)*r1(i,j)/N;
    end
end
N = 3;
for i = 1:N
    for j=1:16384
        r2(j,i) = -1+2*rand;
    end
end
for i = 1:16384
    for j = 1:N
        y2(i) = sqrt(N)*r2(i,j)/N;
    end
end
N = 5;
for i = 1:N
    for j=1:16384
        r3(j,i) = -1+2*rand;
    end
end
for i = 1:16384
    for j = 1:N
        y3(i) = sqrt(N)*r3(i,j)/N;
    end
end
N = 10;
for i = 1:N
    for j=1:16384
        r4(j,i) = -1+2*rand;
    end
end
for i = 1:16384
    for j = 1:N
        y4(i) = sqrt(N)*r4(i,j)/N;
    end
end
N = 100;
for i = 1:N
    for j=1:16384
        r5(j,i) = -1+2*rand;
    end
end
for i = 1:16384
    for j = 1:N
        y5(i) = sqrt(N)*r5(i,j)/N;
    end
end
nbins = 50;
figure(1)
hist(y1,nbins)
title('N=2 histograph')
xlabel('sample value')
figure(2)
hist(y2,nbins)
title('N=3 histograph')
xlabel('sample value')
figure(3)
hist(y3,nbins)
title('N=5 histograph')
xlabel('sample value')
figure(4)
hist(y4,nbins)
title('N=10 histograph')
xlabel('sample value')
figure(5)
hist(y5,nbins)
title('N=100 histograph')