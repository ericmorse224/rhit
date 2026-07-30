%%Lab 3
%%Eric Morse
%% Step 3
[x,fs] = audioread('Water Faucet.m4a');
x = x(:,1);
D=length(x)/fs;
tt=(0:fs*D-1)'/fs;
plot(tt,x)
grid on;
xlabel('time (s)');
title('Water Faucet.m4a');
colormap(spectral);
spectro(x,fs);
