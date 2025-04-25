function bit_out = sampler(out, Ns)
%Converts comparator output to bit values
%out is comparator output
for k = 1:(length(out)/Ns)-1
    bit_out(k) = out((k+1)*Ns);
end