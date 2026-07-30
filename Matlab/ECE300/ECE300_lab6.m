b=importdata('tek0000CH1.csv',',',21);
t = b.data(:,1);
data = b.data(:,2);
dt = t(2)-t(1);
[Xmag,Xphase,df,freq] = baf_fft(data,dt);
figure(1)
subplot(3,1,1);
dBmV=20*log10(sqrt(2)*Xmag/.001);
plot(t, data);
title('sss word time spectrum');
xlabel('time (s)')
ylabel('data')
subplot(3,1,2);
plot(freq, dBmV);
title('sss word magnitude spectrum')
xlabel('frequency (Hz)')
ylabel('|X(jw)|dBmV')
xlim([0 14000])
subplot(3,1,3);
plot(freq, Xphase);
title('sss word phase spectrum')
xlabel('frequency (Hz)')
ylabel('degrees')
xlim([0 14000])

b2=importdata('tek0001CH1.csv',',',21);
t2 = b2.data(:,1);
data2 = b2.data(:,2);
dt2 = t2(2)-t2(1);
[Xmag2,Xphase2,df2,freq2] = baf_fft(data2,dt2);
figure(2)
subplot(3,1,1);
dBmV2=20*log10(sqrt(2)*Xmag2/.001);
plot(t2, data2);
title('long a word time spectrum');
xlabel('time (s)')
ylabel('data')
subplot(3,1,2);
plot(freq2, dBmV2);
title('long a word magnitude spectrum')
xlabel('frequency (Hz)')
ylabel('|X(jw)|dBmV')
xlim([0 9000])
subplot(3,1,3);
plot(freq2, Xphase2);
title('sss word phase spectrum')
xlabel('frequency (Hz)')
ylabel('degrees')
xlim([0 9000])

b3=importdata('tek0009CH1.csv',',',21);
t3 = b3.data(:,1);
data3 = b3.data(:,2);
dt3 = t3(2)-t3(1);
[Xmag3,Xphase3,df3,freq3] = baf_fft(data3,dt3);
figure(3)
subplot(3,1,1);
dBmV3=20*log10(sqrt(2)*Xmag3/.001);
plot(t3, data3);
title('v word time spectrum');
xlabel('time (s)')
ylabel('data')
subplot(3,1,2);
plot(freq3, dBmV3);
title('v word magnitude spectrum')
xlabel('frequency (Hz)')
ylabel('|X(jw)|dBmV')
xlim([0 9000])
subplot(3,1,3);
plot(freq, Xphase);
title('v word phase spectrum')
xlabel('frequency (Hz)')
ylabel('degrees')
xlim([0 9000])

b4=importdata('tek0008CH1.csv',',',21);
t4 = b4.data(:,1);
data4 = b4.data(:,2);
dt4 = t4(2)-t4(1);
[Xmag4,Xphase4,df4,freq4] = baf_fft(data4,dt4);
figure(4)
subplot(3,1,1);
dBmV4=20*log10(sqrt(2)*Xmag4/.001);
plot(t4, data4);
title('full save word time spectrum');
xlabel('time (s)')
ylabel('data')
xlim([1.25 1.9])
subplot(3,1,2);
plot(freq4, dBmV4);
title('full save word magnitude spectrum')
xlabel('frequency (Hz)')
ylabel('|X(jw)|dBmV')
xlim([0 20000])
subplot(3,1,3);
plot(freq4, Xphase4);
title('full save word phase spectrum')
xlabel('frequency (Hz)')
ylabel('degrees')
xlim([0 20000])

 
Fs=1/dt;
figure(5)
subplot(2,1,1)
plot(t,data)
title('sss word time plot')
xlabel('time (s)')
subplot(2,1,2)
spectrogram(data,[1:2048],[],4096,Fs,'yaxis')
figure(6)
subplot(2,1,1)
plot(t2,data2)
title('long a word time plot')
xlabel('time(s)')
subplot(2,1,2)
Fs2=1/dt2;
spectrogram(data2,[1:2048],[],4096,Fs2,'yaxis')
figure(7)
subplot(2,1,1)
plot(t3,data3)
title('v word time plot')
xlabel('time(s)')
subplot(2,1,2)
Fs3=1/dt3;
spectrogram(data3,[1:2048],[],4096,Fs3,'yaxis')
figure(8)
subplot(2,1,1)
plot(t4,data4)
title('full save word time plot')
xlabel('time (s)')
subplot(2,1,2)
Fs4 = 1/dt4;
spectrogram(data4,[1:2048],[],4096,Fs4,'yaxis')
ylim([0 20])