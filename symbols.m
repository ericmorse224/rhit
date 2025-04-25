function symbol = symbols(lc, Ts, Ns)
%
% Eric Morse ECE310  Part 4
% Creates waveform of linecode
if strcmp(lc,'sinc')
    t = linspace(0,8*Ts);
    symbol = sinc((t-4*Ts)./Ts);
elseif strcmp(lc,'rc')
    t = linspace(0,8*Ts);
    %r = user defined rolloff ratio
    r = 0.3;
    symbol = sinc(t./Ts).*cos(pi.*r.*t./Ts)./(1-(2.*r.*t./Ts).^2);
elseif strcmp(lc,'rrc')
    t = linspace(0,8*Ts);
    symbol = sinc((pi.*t./(2.*Ts))+2.*t./Ts.*cos(1.5.*pi.*t./Ts))./(pi.*t./Ts.*(1-(2.*t./Ts).^2));
elseif strcmp(lc, 'unrz')
    symbol = ones(1, Ns);
elseif strcmp(lc, 'pnrz')
    symbol = ones(1, Ns);
elseif strcmp(lc, 'urz')
    symbol = [ones(1, Ns/2) zeros(1,Ns/2)];
elseif strcmp(lc, 'man')
    symbol = [ones(1,Ns/2) -ones(1,Ns/2)];
elseif strcmp(lc, 'urz')
    symbol = [ones(1, Ns/2) zeros(1,Ns/2)];
end