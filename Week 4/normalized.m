clc
clear all
close all

fileData1 = importdata('hassanssvep.txt');
header1 = fileData1.textdata;
eegData1 = fileData1.data;

fs = 512;  

start1 = 1.5 * fs + 1;
end1 = 10 * fs;

channelO1 = 9;
channelO2 = 10;
channelOz = 22;
channelP3 = 7;
channelP4 = 8;
channelPz = 21;
channelPo3 = 31;
channelPo4 = 32;

signalO1 = eegData1(start1:end1, channelO1);
signalO2 = eegData1(start1:end1, channelO2);
signalOz = eegData1(start1:end1, channelOz);
signalP3 = eegData1(start1:end1, channelP3);
signalP4 = eegData1(start1:end1, channelP4);
signalPz = eegData1(start1:end1, channelPz);
signalPo3 = eegData1(start1:end1, channelPo3);
signalPo4 = eegData1(start1:end1, channelPo4);

max_O1 = max(signalO1);
max_O2 = max(signalO2);
max_Oz = max(signalOz);
max_P3 = max(signalP3);
max_P4 = max(signalP4);
max_Pz = max(signalPz);
max_Po3 = max(signalPo3);
max_Po4 = max(signalPo4);

normalized_signalO1 = signalO1 / max_O1;
normalized_signalO2 = signalO2 / max_O2;
normalized_signalOz = signalOz / max_Oz;
normalized_signalP3 = signalP3 / max_P3;
normalized_signalP4 = signalP4 / max_P4;
normalized_signalPz = signalPz / max_Pz;
normalized_signalPo3 = signalPo3 / max_Po3;
normalized_signalPo4 = signalPo4 / max_Po4;

TimeO1 = (0:length(signalO1)-1) / fs;
TimeO2 = (0:length(signalO2)-1) / fs;
TimeOz = (0:length(signalOz)-1) / fs;
TimeP3 = (0:length(signalP3)-1) / fs;
TimeP4 = (0:length(signalP4)-1) / fs;
TimePz = (0:length(signalPz)-1) / fs;
TimePo3 = (0:length(signalPo3)-1) / fs;
TimePo4 = (0:length(signalPo4)-1) / fs;


figure;
subplot(3, 1, 1);
plot(TimeO1, normalized_signalO1);
hold on;
xlabel('Time (s)');
ylabel('Amplitude');
title('O1');

subplot(3, 1, 2);
plot(TimeO2, normalized_signalO2);
hold on;
xlabel('Time (s)');
ylabel('Amplitude');
title('O2');

subplot(3, 1, 3);
plot(TimeOz, normalized_signalOz);
hold on;
xlabel('Time (s)');
ylabel('Amplitude');
title('Oz');

figure;
subplot(3, 1, 1);
plot(TimeP3, normalized_signalP3);
hold on;
xlabel('Time (s)');
ylabel('Amplitude');
title('P3');

subplot(3, 1, 2);
plot(TimeP4, normalized_signalP4);
hold on;
xlabel('Time (s)');
ylabel('Amplitude');
title('P4');

subplot(3, 1, 3);
plot(TimePz, normalized_signalPz);
hold on;
xlabel('Time (s)');
ylabel('Amplitude');
title('Pz');

figure;
subplot(2, 1, 1);
plot(TimePo3, normalized_signalPo3);
hold on;
xlabel('Time (s)');
ylabel('Amplitude');
title('Po3');

subplot(2, 1, 2);
plot(TimePo4, normalized_signalPo4);
hold on;
xlabel('Time (s)');
ylabel('Amplitude');
title('Po4');

