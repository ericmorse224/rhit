%% ECE351 Eric Morse Problem 1 HW2
B = 5.23*10^15;
K = 86.2*10^(-6);
Eg=ones(1,181).*1.12;
X = 218.15:398.15;
Y = B * X.^(3/2)*exp(-Eg/(2*K*X));
semilogy(X,Y)
title('Concentration vs temperature Plot');
xlabel('Temperature in K');
ylabel('Concentration');
plot(X,Y)