%
%  This file processes the input data
%   By Andrew J. Overhage           10-Feb-2017
%   Modifications by Mark A. Yoder  13-Feb-2017
%
function data = process_data(fileName);
%process_data Reads data from Excel spreadsheet fileName
%  enter the data in spreadsheet as
%  f (in Hz) Vin (in mV) Vout (in mV)  
%

% reads in data from spreadsheet into an array, skipping header
%
  measured = xlsread(fileName, 'A2:E100');
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
%  put the data into the data array
%
  data = [f mag_H];
%
  return;
  