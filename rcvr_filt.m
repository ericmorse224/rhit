function output = rcvr_filt(message, filter_type, n, Rp, Wp, Ts, Ns)
%
% ECE310 Eric Morse Part 7
% returns baseband waveform
% n is order
% Rp is passband Ripple
% Wp is cutoff frequency
% need to convert it to normalized passband edge frequency
Pf = Wp/(Ns*1/Ts*1/2);
if strcmp(filter_type, 'matched_man')
    symbol1 = symbols('man', Ts, Ns);
    output = filter(-symbol1, 1, message);
elseif strcmp(filter_type, 'cheby1')
    [b, a] = cheby1(n, Rp, Pf);
    output = filter(b, a, message);
elseif strcmp(filter_type, 'matched_rrc')
    symbol1 = symbols('rrc', Ts, Ns);
    output = filter(fliplr(symbol1), 1, message);
elseif strcmp(filter_type, 'butter')
    [b, a] = butter(n, Pf);
    output = filter(b, a, message);
end