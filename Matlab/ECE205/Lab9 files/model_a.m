function model_a(fileName, K, tau)
%model_a   Read data from fileName and fit it to a model
%
%  this routine attempts to optimize the parameters to fit a 
%  first order transfer function to measured frequency response
%  
%  Inputs: fileName, a name of an Excel spreadsheet with data.
%       See process_data.m for data format
%
%  The following two parameters are the initial estimates:
%             K       = static gain
%             tau     = time constant
%
%  Read and process the data file
  data = process_data(fileName);
%
%  Assign the global variable so we can use it in the fit function
%
global  MEASURED_FREQUENCY_RESPONSE
%
  MEASURED_FREQUENCY_RESPONSE = data;
%
%  Set the initial conditions, these are our parameters
%
  X0 = [ K tau ];
%
%  set the options for the minimization routine
%
  options = optimset(@fminsearch);
  options = optimset(options, 'Display', 'iter', 'MaxIter', 1000, ...
      'MaxFunEvals', 1000, 'TolFun', 1e-8, 'TolX', 1e-8);
%
%  do the minimization
%
  x = fminsearch(@fit,X0,options);
%
% extract our parameters
%
  K = x(1); 
  tau = x(2);
%
%  Construct the transfer function
%
  G = tf(K,[tau 1]);
%
%  get the numerator and the denominator polynomials
%
  [B,A] = tfdata(G,'v');
%
%  extract the measured data
%
  f = data(:,1);
  M = data(:,2);
  P = data(:,3);
%
%  convert to dB and rad/sec
%
  MdB = 20*log10(M);  
  w = 2*pi*f;
%
%  generate a frequency array
%
  omega_low = min(w);
  omega_high = max(w);
  omega = logspace(log10(omega_low),log10(omega_high),1e3);
%
%  Now plot the bode plot
%
  G_est = freqs(B,A,omega);
%
%  get the magnitude and the phase
%
  eM = abs(G_est);
  eP = unwrap(angle(G_est))*180/pi;
%
%  convert magnitude to dB
%
  eMdB = 20*log10(eM);
%
%  Now plot the results
%
  figure;
  orient tall
  subplot(2,1,1);
  semilogx(w,MdB,'d',omega,eMdB,'-');
  min_mag = min(min(eMdB),min(MdB));
  max_mag = max(max(eMdB),max(MdB));
  axis([floor(min(w)) floor(max(w))+2 min_mag max_mag ]);
  legend('Measured','Estimated', 'Location', 'northeast'); 
  grid on; 
  ylabel('Magnitude (dB)'); 
  xlabel('Frequency (rad/sec)')
  title(['Optimal Fit To Frequency Response:  K  = ' num2str(K,4) ...
      ', \tau = ' num2str(tau,3) ]);
  subplot(2,1,2);
  semilogx(w,P,'d',omega,eP,'-');
  min_phase = min(min(eP),min(P));
  max_phase = max(max(eP),max(P));
  axis([floor(min(w)) floor(max(w))+2 min_phase max_phase ]);
  legend('Measured','Estimated', 'Location', 'northeast'); 
  grid on; 
  ylabel('Phase (deg)'); 
  xlabel('Frequency (rad/sec)')
%
 return;
%
%  =========================================
%
%  This function is what is used to determine the fit of the transfer
%  function to the measured frequency response data
%
function J = fit(x)
%
global MEASURED_FREQUENCY_RESPONSE
%
%  extract the data
%
  f = MEASURED_FREQUENCY_RESPONSE(:,1);
  M = MEASURED_FREQUENCY_RESPONSE(:,2);
  P = MEASURED_FREQUENCY_RESPONSE(:,3);
%
%  convert to dB and rad/sec
%
  MdB = 20*log10(M);  
  w = 2*pi*f;
%
% get the parameters
% 
  K = x(1); 
  tau = x(2);
%
%  Construct the transfer function
%
  G = tf(K,[tau 1]);
%
%  get the numerator and the denominator polynomials
%
  [B,A] = tfdata(G,'v');
%
%  determine the transfer function G at the measured frequencies
%
  G_est = freqs(B,A,w);
%
%  get the magnitude and the phase
%
  eM = abs(G_est);
  eP = unwrap(angle(G_est))*180/pi;
%
%  convert magnitude to dB
%
  eMdB = 20*log10(eM);
%
%  Determine the squared error and normalize the range of each
%   to make them dimensionless
%
   J = norm(eMdB - MdB)/(max(MdB)-min(MdB))+norm(eP-P)/(max(P)-min(P));
%
%  all done
%
   return;
 