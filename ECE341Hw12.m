% Eric Morse ECE341 M-File: ML0804 modified
% Performs numerical integration to find beam solid
% angle, directivity, and the maximum power function
% for a given length of dipole
clc
clear
freq = 50*10^6;
%freq=10^9;
wavelength = 3*10^8/freq;
L = 3/wavelength;
%L = wavelength/2;
bL2=pi*L;
N = 90;

i=1:1:N;
dth=pi/N;
th(i)=i*pi/N;
num(i)=cos(bL2.*cos(th(i)))-cos(bL2);
den(i)=sin(th(i));
F(i)=((num(i)).^2)./den(i);
Fmax = max(F)
Pn=F./Fmax;

omegaP = 2*pi*dth*sum(Pn)
Dmax = 4*pi/omegaP
Rrad = (30/pi)*Fmax*omegaP

polar(th(i), num(i)./den(i));
title("Polar plot of 750 MHz");
xlabel("theta");
ylabel("Rrad");