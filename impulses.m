function impulse_array = impulses(bit_array, Ns, linecode)
%
% Generates random sequence of bits.  
% Created by Eric Morse 2018
%
% usage:  bit_array = bitstream(Ndata)
%       Ndata = number of bits to generate
%       bit_array = random sequence of bits
if (strcmp(linecode,'unrz')) || (strcmp(linecode,'urz'))
    impulse_array = upsample(bit_array, Ns);
else
    bit_array(~bit_array) = -1;
    impulse_array = upsample(bit_array, Ns);
end