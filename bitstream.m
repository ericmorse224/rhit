function bit_array = bitstream(Ndata)
%
% Generates random sequence of bits.  
% Created by Eric Morse 2018
%
% usage:  bit_array = bitstream(Ndata)
%       Ndata = number of bits to generate
%       bit_array = random sequence of bits
bit_array = randi([0 1], 1, Ndata);