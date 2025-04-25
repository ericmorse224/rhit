% Eric Morse ECE310 Data Link Simulator Project
% CM2084.  This is main file
clc
clear
for SNR = -10:20
    A = 0.35; %amplitude parameter of baseband waveform
    R = 5000; Ts = 1/R; % R is information data rate
    Ndata = 31; T = Ndata/R; % Ndata is number of bits to be simulated
    Ns = 100; % Ns is number of samples in one symbol period
    % N is total number of samples deltat is time between sample
    N = Ns*Ndata; deltat = Ts/Ns; t = linspace(0,(N-1)*deltat,N);
    % line code chosen
    linecode = 'pnrz'; filter_type = 'cheby1';
    % Filter Parameters
    % If given Pf = 2/3, calculate Wp = Pf/Ts
    % Wp is cutoff frequency Rp is passband Ripple n is filter order
    Wp = 2/3*1/Ts; Rp = 1; n = 5; % pave is No/2 of noise
    pave = A^2*Ts*2/SNR; threshold = 0;
    
    %bit_array = bitstream(Ndata);
    bit_array = [1 0 0 0 0 1 0 1 0 1 1 1 0 1 1 0 0 0 1 1 1 1 1 0 0 1 ...
        1 0 1 0 0];
    impulse_array = impulses(bit_array, Ns, linecode); %stem(impulse_array)
    symbol = symbols(linecode, Ts, Ns); %stem(symbol)
    message = waveform(impulse_array, symbol, A);
    figure(1)
    plot(t,message); title('plot of massage waveform'); xlabel('time (s)');
    ylabel('amplitude');
    
    M = fftshift(fft(message))*deltat;
    deltaf = 1/(N*deltat);
    f = linspace(-(N/2)*deltaf,((N/2)-1)*deltaf,N);
    figure(2)
    plot(f, 10*log10(M)); title('fft of PN sequence'); 
    ylabel('magnitude (dB)'); xlabel('frequency (Hz)');
    xlim([-20000 20000]);
    %% Rest of digital datalink
    %%Step 8 Eye Diagram
    y = rcvr_filt(message, filter_type, n, Rp, Wp, Ts, Ns);
    %teye = linspace(0,(Ns-1)*deltat, Ns); y = y(Ns+1:end); figure(1)
    %B = reshape(y, Ns, Ndata-1); plot(teye, B, 'k'); title('Eye Diagram');
    %Step 6 Power Spectrum Calculation
    [S,f] = pwelch(message,2048,[],[],1/deltat,'twosided'); %figure(3)
    %plot(f(1:101), S(1:101)); title('Power Spectrum vs frequency of man'); 
    %xlabel('Frequency (Hz)'); ylabel('Power');
    
    %%Step 9 Noisegen
    noise = noisegen(pave, deltat, N);
    %figure(1); subplot(3,1,1)
    %plot(t, y); title('filter output without noise'); xlabel('time (s)');
    %ylabel('Amplitude'); subplot(3,1,2); plot(t, message + noise);
    %title('signal plus noise at input'); xlabel('time (s)'); 
    %ylabel('Amplitude'); subplot(3,1,3);
    y2 = rcvr_filt(message+noise, filter_type, n, Rp, Wp, Ts, Ns);
    %plot(t, y2); title('signal plus noise at output'); xlabel('time (s)');
    %ylabel('Amplitude');
    
    %%Step 10 Decision Circuit
    out = dec_ckt(y2, threshold); %figure(1)
    %subplot(2,1,1); plot(t, message); title('original line code');
    %xlabel('time (s)'); ylabel('Amplitude'); subplot(2,1,2)
    %plot(t, out); title('decision circuit output'); xlabel('time (s)');
    %ylabel('Amplitude');
    
    bit_out = sampler(out, Ns); BER(SNR+11) = 0;
    for k = 1:Ndata-1
        if bit_out(k) ~= bit_array(k)
            BER(SNR+11) = BER(SNR+11) + 1;
        end
    end
    BER(SNR+11) = BER(SNR+11)/(Ndata-1);
end
SNR = linspace(-10, 20, 31);
%semilogy(SNR, BER); xlim([-10 20]); title('BER vs SNR'); 
%ylabel('Bit Error Rate'); xlabel('SNR in dB');