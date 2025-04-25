function noise = noisegen(pave, deltat, N)
%
% Generates additive white Gaussian noise signal
% input pave is average noise power No/2
s = sqrt(pave/deltat);
noise = s*randn(1,N);