clc
clear all
close all

eegData = importdata('test3.txt');
header = eegData.textdata;
data = eegData.data;
fs = 128;

start1 = 3.5 * fs + 1;
end1 = 7 * fs;

signal1 = data(start1:end1, 5);
signal2 = data(start1:end1, 6);

difference1 = signal2 - signal1;

meandiff = mean(difference1);
stddiff = std(difference1);
normalizeddiff = (difference1 - meandiff) / stddiff;

time = (0:length(difference1)-1) / fs;

subplot(1,1,1)
plot(time, difference1)
xlabel('Time (s)')
ylabel('Difference')
title(['(O2-O1)'])
