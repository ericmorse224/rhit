%% Eric Morse ECE341 P6.6
ur = 600;
uo = pi*4e-7;
sigma = 0.1;
er = 4;
eo = 8.854e-12;
for i=1:10
    for k=1:10
        mo = (k+10)*(i-1);
        f = k*10^(i-1);
        w = 2*pi*f;
        A = i*(w*ur*uo);
        B = complex(sigma, w*er*eo);
        gamma = sqrt(A*B);
        alpha = real(gamma);
        beta = imag(gamma);
        eta = sqrt(A/B);
        meta = abs(eta);
        aeta = 180*angle(eta)/pi;
    end
end
subplot(3,1,1)
plot(f,alpha,'-o',f,beta,'-*');
xlabel('frequency (Hz)');
ylabel('1/m');
legend('alpha','beta');
subplot(3,1,2)
semilogx(f,meta)
ylabel('magnitude of eta(ohms)');
subplot(3,1,3)
semilogx(f,aeta)
ylabel('phase of eta(degrees)');
xlabel('frequency (Hz)');

        
        
        
        
        
