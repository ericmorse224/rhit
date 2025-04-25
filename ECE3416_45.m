%%ECE341 P6.45 Eric Morse
eo = 8.854e-12;
uo = pi*4e-7;
er1 = input('input material1 relative permitivity er1= ');
ur1 = input('input material1 relative permiability ur1= ');
o1 = input('input material1 conductivity o1= ');
er2 = input('input material1 relative permitivity er2= ');
ur2 = input('input material1 relative permiability ur2= ');
o2 = input('input material1 conductivity o2= ');
n = 2:.5:10;
f = 10.^n;
w = 2*pi.*f;
n1 = sqrt(1i*w*ur1*uo./(o1+1i*w*er1*eo));
n2 = sqrt(1i*w*ur2*uo./(o2+1i*w*er2*eo));
Gamma = (n2-n1)./(n2+n1);
Tau = 1 + Gamma;
subplot(2,1,1)
semilogx(f,abs(Gamma),'-o', f, abs(Tau),'-*')
ylabel('magnitude')
xlabel('frequency(Hz)')
legend('reflection','transmission')
subplot(2,1,2)
semilogx(f,180/pi*angle(Gamma),'-o',f,180/pi*angle(Tau),'-*')
ylabel('phase angle (degrees)')
xlabel('frequency (Hz)')
legend('reflection', 'transmission')