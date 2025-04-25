% Eric Morse ECE380 Quantization Noise Problem Hw5 problem 6
SNR = @(B) 20*log10(1)+20*B*log10(2)+10*log10(3/2);
x = zeros(1,28);
for i=4:32
    x(i-3) = SNR(i);
end
t = 4:32;

plot(t,x);
title('SNR vs. number of bits');
ylabel('SNR (dB)');
xlabel('number of bits');