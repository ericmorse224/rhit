%%Eric Morse CM2084
%%CS250 HW5 Problem 2
close all
clear variables;
Rd = 10000;
K = 250*10^(-6);
Vin = linspace(0, 5);
for i=1:length(Vin)
    if Vin(i)<=1
        Vo(i)=5;
    elseif ((Vin(i)>1)&&(Vin(i)<2.22))
        Id1(i)=K*(Vin(i)-1)^2;
        Vo(i)=5-Rd*Id1(i);
    elseif (Vin(i)>=2.22)
        Ron(i)=1/(K*(Vin(i)-1));
        Vo(i)=(5*Ron(i))/(Ron(i)+Rd);
    end
end
plot(Vin,Vo);
grid on;
xlabel('Vin (V)');
ylabel('Vout (V)');
title('MOSFET Vout vs Vin');