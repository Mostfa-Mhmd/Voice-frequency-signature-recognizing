clc; clear;
[y,f,ref,fs1]= audioFreq('sample1.wav');
figure;
subplot(221);
plot(f, abs(y));
xlabel('Frequency (Hz)');
ylabel('Amp');
title('Refrence');
filtered_ref=fdata(ref);
audiowrite('ref.wav',filtered_ref,fs1);
[y1,f1,f_ref,fs1]= audioFreq('ref.wav');
subplot(222);
plot(f1,abs(y1));
xlabel('Frequency (Hz)');
ylabel('Amp');
title('Filtered Refrence');
file= input('Enter the audio:\n','s');
[yin,fin,audioIn,fsIn]=audioFreq(file);
subplot(223);
plot(fin, abs(yin));
xlabel('Frequency (Hz)');
ylabel('Amp');
title('Input');
filterd_audioIn=fdata(audioIn);
audiowrite('audioIn.wav',filterd_audioIn,fsIn);
[y2,f2,f_audioIn,fs2]= audioFreq('audioIn.wav');
subplot(224);
plot(f2,abs(y2));
xlabel('Frequency (Hz)');
ylabel('Amp');
title('Filtered Input');

figure;
t1=(0:length(ref)-1)/fs1;
subplot(221);
plot(t1,ref);
xlabel('Time (s)');
ylabel('Amp');
title('Refrence');

t2=(0:length(f_ref)-1)/fs1;
subplot(222);
plot(t2,f_ref);
xlabel('Time (s)');
ylabel('Amp');
title('Filered Refrence');

t3=(0:length(audioIn)-1)/fsIn;
subplot(223);
plot(t3,audioIn);
xlabel('Time (s)');
ylabel('Amp');
title('Refrence');

t4=(0:length(f_audioIn)-1)/fs2;
subplot(224);
plot(t4,f_audioIn);
xlabel('Time (s)');
ylabel('Amp');
title('Refrence');

tolerance = 1e-5;
difference = y1 - y2;
norm_diff = norm(difference);

if norm_diff < tolerance
    disp('Access Allowed');
else
    disp('Access Denied');
end

%freq_500_to_1000.wav
%freq_2000_to_2500.wav