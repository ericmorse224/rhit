function [S, f] = psc(message, deltat)
%Calculates power signal spectrum and plots it
[S,f] = pwelch(message,2048,[],[],1/deltat,'twosided');
%figure(2)
%plot(f(1:101), S(1:101))
%title('Power Spectrum vs frequency of man');
%xlabel('Frequency (Hz)');
%ylabel('Power');