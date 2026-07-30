%
%  This routine implements a trigonometric Fourier Sine Series
%
% Inputs: N is the number of terms to be used in the series
%
function Fourier_Sine_series(N)
%
%  the periodic function
%
  x  = @(t) 0.*(t<-1)+t.*((-1<=t)&(t<1))+0.*(t>=1);
  low = -2; high = 2;  % one period goes from low to high
%
%  the difference between low and high is one period
%
  T = high-low;
  w0 = 2*pi/T;
%
%   find b(1) to b(N)
%
  for k = 1:N
      arg = @(t) x(t).*sin(k*w0*t);
      b(k) = (2/T)*integral(arg,low,high);
  end;
%
%  determine a time vector over one period
%
  t = linspace(low,high,1000);
%
%  Find the Fourier series representation
%
  est = 0;
  for k = 1:N
      est = est + b(k)*sin(k*w0*t);
  end;
%
%  plot the results
%
  plot(t,x(t),'-',t,est,'--'); grid; xlabel('Time (sec)');
  legend('Original','Fourier Series','Location','NorthWest');
  title(['Number of Terms = ', num2str(N)]);
%