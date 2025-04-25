function [Xmag,Xphase,df,frq] = baf_fft(x,dt)
%
% Computes FFT of input vector, returning the magnitude and phase spectra and
% a frequency vector for display.  Includes arranging the frequencies properly, proper
% scaling and units, and unwrapping the phase vector.
%  BAF  revised fall 2004
%
% usage:  [XMag,XPhase,df,frq]=baf_fft(x,dt)
%       x = function for which FFT is calculated
%       dt = time spacing bewteen samples of the function
%       XMag = vector containing magnitude of FFT (two-sided magnitude spectrum)
%       XPhase = vector containing phase of FFT (two-sided phase spectrum)
%       df = frequency spacing between FFT elements
%       frq = vector containing frequency values - for plotting
%
N=length(x);
df=1/N/dt;
% compute FFT, with proper scale factor
X1=1/N*fft(x);
% rearrange for proper sequencing of neg/pos frequency components
X=fftshift(X1);
% compute mag and phase vector, with phase unwrapping
Xmag=abs(X);
Xphase=unwrap(angle(X));
% generate frequency vector associated with FFT vectors
frq=linspace((-N/2)*df, (N/2-1)*df, N);