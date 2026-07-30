%
%  This file processes the data from the first order system from Excel
%   By Andrew J. Overhage
%   13-Feb-2017
%
function data = process_data(fileName);
%process_data Reads data from Excel spreadsheet fileName
%  enter the data in spreadsheet as
%  f (in Hz) Vin (in mV) Vout (in mV) Phase (in degrees); 
%
% reads in data from spreadsheet into an array
%
  measured = xlsread(fileName, 'A2:F100');
%
%  Be sure the rows are sorted by frequency
%
   measured = sortrows(measured,1);
%
%  get the frequency of the measurement
%
  f = measured(:,1); 
%
%  get the magnitude of the transfer function
%
  mag_H = measured(:,3)./measured(:,2);
%
%  get the phase (in degrees) of the transfer function
%
  phase_H = measured(:,4);
%
%  put the data into the data array
%
  data = [f mag_H phase_H];
%
  return;