function [Y,f,audio,sampleRate] = audioFreq(fileName) 
[audio, sampleRate] = audioread(fileName);
% optional
window = hamming(length(audio));
audioWindowed = audio .* window;
% Compute fft
y = fft(audioWindowed);
l = length(audioWindowed);
half_l=ceil(l/2);
Y=y(1:half_l);
% frequency vector
f = (0:half_l-1) * (sampleRate / l);
end