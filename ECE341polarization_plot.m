%% Eric Morse ECE341
%%determines polarization and hardness from
%%E(0,t)=Exo*cos(wt+fx)ax+Eyo*cos(wt+fy)ay
%%M-file: ML0603
%%traces polarization ellipses, given amplitude and phase of a pair
%%of linearly polarized waves.
%%
%%Variables:
%%Exo,Eyo amplitudes for pair of waves
%%fxd,fyd phase angle for each wave
%%fx,fy   phase (radians)
%%wtd     ang freq * time in degrees
%%wtr     ang freq * time in radians
%%x,y     superposed position
%%x0,y0   position at wtd = 0 degrees
%%x45,y45 position at wtd = 45 degrees
%%
clc
clear

disp('Polarization Plot')
disp(' ')
Exo = input(' enter x-amplitude:');
fxd = input(' enter x-phase angle (deg):');
fx = fxd*pi/180;
Eyo = input(' enter y-amplitude:');
fyd = input(' enter y-phase angle (deg):');
fy = fyd*pi/180;
disp(' ')
disp(' To determine direction of polarization, move')
disp(' from 0 to + along the plot.')
disp(' ')

% Perform calculations
wtd=0:360;
wtr = wtd*pi/180;
x = Exo*cos(wtr+fx);
y = Eyo*cos(wtr+fy);
x0 = Exo*cos(fx);
y0 = Eyo*cos(fy);
x45 = Exo*cos(fx+pi/4);
y45 = Eyo*cos(fy+pi/4);

% Make the plot
plot(x,y,x0,y0,' ok',x45,y45,' +k')
xlabel(' x')
ylabel(' y')
title(' Polarization Plot')
axis('equal')