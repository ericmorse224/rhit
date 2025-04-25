%% Circuit 1
c1 = 0.1e-6;
r1 = 10e3;
r2 = 100;

H = tf([r1*r2*c1 r2],[r1*r2*c1 r2+r1]);
bodemag(H)

%% Circuit 2
c1 = 1e-6;
c2 = 10e-9;
r1 = 1e3;
r2 = 1e3;

H = tf([1/(c2*r1) 0], [1 (c1*r2+c1*r1+c2*r2)/(r1*r2*c1*c2) 1/(r1*r2*c1*c2)]);
bodemag(H)