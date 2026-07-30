%%Eric Morse and Tom Tao
%%Prelab Lab 5 Harmonic Distortion
clear variables;
P =  -18.75;
%signal power in V^2
PV = 10^(P/10);
%input amplitude in V for triangle wave
%X = sqrt(3*PV);
%input amplitude in V for sine wave
X = sqrt(2*PV);
%value of first series coefficient X[1] of sinusoid
X1 = X*2;
%% Power vector
%%Amplitude 1 = 1Vpp
%P11 = -15;
%P12 = -40;
%P13 = -20;
%P14 = -30;
%P15 = -40;
%P1 = [P11 P12 P13 P14 P15];
%PV = 10.^(P./10);
%answer = 10*log10((PV(2)+PV(3)+PV(4)+PV(5))/PV(1));
%%Amplitude 1 = 1Vpp
%P11 = -3.175;
%P12 = -58.7;
%P13 = -46.61;
%P14 = -61.41;
%P15 = -52.13;
%P1 = [P11 P12 P13 P14 P15];
%PV1 = 10.^(P1./10);
%A1 = 10*log10((PV1(2)+PV1(3)+PV1(4)+PV1(5))/PV1(1));
%%Amplitude 2 = 2Vpp
%P21 = 2.85;
%P22 = -54.6;
%P23 = -37.72;
%P24 = -57.27;
%P25 = -46.11;
%P2 = [P21 P22 P23 P24 P25];
%PV2 = 10.^(P2./10);
%A2 = 10*log10((PV2(2)+PV2(3)+PV2(4)+PV2(5))/PV2(1));
%%Amplitude 3 = 3Vpp
%P31 = 6.216;
%P32 = -44.07;
%P33 = -31.3;
%P34 = -41.11;
%P35 = -37.12;
%P3 = [P31 P32 P33 P34 P35];
%PV3 = 10.^(P3./10);
%A3 = 10*log10((PV3(2)+PV3(3)+PV3(4)+PV3(5))/PV3(1));
%%Amplitude 4 = 4Vpp
%P41 = 8.778;
%P42 = -43.17;
%P43 = -32.18;
%P44 = -48.07;
%P45 = -35.85;
%P4 = [P41 P42 P43 P44 P45];
%PV4 = 10.^(P4./10);
%A4 = 10*log10((PV4(2)+PV4(3)+PV4(4)+PV4(5))/PV4(1));
%%Amplitude 5 = 5Vpp
%P51 = 10.78;
%P52 = -40.21;
%P53 = -30.22;
%P54 = -50.5;
%P55 = -36.71;
%P5 = [P51 P52 P53 P54 P55];
%PV5 = 10.^(P5./10);
%A5 = 10*log10((PV5(2)+PV5(3)+PV5(4)+PV5(5))/PV5(1));
%HD = [A1 A2 A3 A4 A5];
%Amp = [1 2 3 4 5];
%plot(Amp, HD)
%title('Amplitude vs Harmonic Distortion plot')
%xlabel('Amplitude in Vpp');
%ylabel('Harmonic Distortion in dB')

