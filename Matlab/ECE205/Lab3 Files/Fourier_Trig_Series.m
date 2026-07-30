%
%  This routine implements a trigonometric Fourier Sine Series
%
% Inputs: N is the number of terms to be used in the series
%
function Fourier_Trig_series(N)
%
%  the periodic function
%
  tol = 1e-15;
  x  = @(t) -1.*((0<=t)&(t<1e-12))+1.*((1e-12<=t)&(t<2e-12));
  low = 0; high = 2e-12;  % one period goes from low to high
%
%  the difference between low and high is one period
%
  T = high-low;
  w0 = 2*pi/T;
%
%   find a0
%
a0 = 1/T*integral(x,low,high);
%
%   find b(1) to b(N) and a(1) to a(N)
%
  for k = 1:N
      arg_ak = @(t) x(t).*cos(k*w0*t);
      a(k) = (2/T)*integral(arg_ak,low,high,'AbsTol',tol,'RelTol',tol);
      arg = @(t) x(t).*sin(k*w0*t);
      b(k) = (2/T)*integral(arg,low,high, 'AbsTol',tol,'RelTol',tol);
      d(k) = sqrt(a(k).*a(k) + b(k).*b(k));
      theta(k) = atan2(-b(k),a(k));
  end;
%
% determine d and theta for Compact Fourier Series
%
d0 = a0;
%
%  determine a time vector over one period
%
  t = linspace(low,high,1000);
%
%  Find the Compact Fourier series representation
%
  est = d0;
  for k = 1:N
      est = est + d(k)*cos(k*w0*t + theta(k)); 
  end;
%
%  plot the results
%
  plot(t,x(t),'-',t,est,'--'); grid; xlabel('Time (sec)');
  legend('Original','Fourier Series','Location','NorthWest');
  title(['Number of Terms = ', num2str(N)]);
%