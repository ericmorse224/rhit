clear

sim('ECE371_Lab9.slx');

%plots for lambda vs Cp
%plot(lambda, Cp);
%xlim([0 15]);
%ylim([0 0.5]);
%title('Cp vs lambda');
%legend('0 degrees', '5 degrees', '10 degrees', '15 degrees', '20 degrees', '25 degrees', '30 degrees');
%xlabel('lambda');
%ylabel('Cp');
%
%plot for P vs Windspeed as a function of tip speed
%plot(Windspeed, P);
%xlim([0 25]);
%ylim([0 0.6]);
%title('P vs Windspeed');
%legend('10 rpm', '8 rpm', '6 rpm', '4 rpm', '2 rpm');
%ylabel('Power (W)');
%xlabel('Windspeed (m/s)');


%Plot of Power vs Windspeed as a function of Rotor Diameter.
plot(Windspeed, P);
xlim([0 25]);
ylim([0 0.3]);
title('P vs Windspeed as function of Rotor Diameter');
legend('77 m', '50 m', '35 m');
ylabel('Power (W)');
xlabel('Windspeed (m/s)');