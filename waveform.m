function message = waveform(impulse_array, symbol, A)
%
% ECE310 Eric Morse Part 5
% returns baseband waveform
message = A*filter(symbol, 1, impulse_array);