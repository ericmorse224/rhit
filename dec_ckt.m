function out = dec_ckt(waveform, threshold)
%
% Input waveform is the filtered linecode waveform
% Warning: waveform can still be possibly noisy
% Input threshold is threshold value
out = zeros(1, length(waveform));
for k = 1:length(waveform)
    if waveform(k) >= threshold
        out(k) = 1;
    end
end