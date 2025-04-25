%ECE310 Lab 6 Part 4 Eric Morse and Jianken Dong
f = [2000 3000 4000 5000 6000 7000 8000 9000 10000];
Vb = [0.27 0.324 0.32 0.32 0.272 0.298 0.322 0.336 0.346];
Vw = [0.27 0.266 0.242 0.238 0.216 0.144 0.088 0.04 0];
Eye = 2*Vw./(Vb+Vw);
plot(f, Eye)
title('Eye Opening versus data rate');
xlabel('data rate (bits/second)');
ylabel('Eye Opening (1-D)');
