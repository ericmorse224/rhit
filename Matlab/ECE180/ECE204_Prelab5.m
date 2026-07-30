%%ECE204 Prelab for Lab 5
%% 1.5
V =1.42+sqrt(-1)*3.12;
Rth = 53.6;
Rx = 0:Rth:10*Rth;
for i=1:11
    Ix(i) = V/(Rx(i)+sqrt(-1)*118);
    Px(i) = abs(Ix(i))^2*(Rx(i)+sqrt(-1)*118);
end
plot(Rx, Px*1000) 
xlabel("Load Resistance (Ohms)");
ylabel("Load Power (mW)");
title("Thevenin Equivalent Circuit");
   

