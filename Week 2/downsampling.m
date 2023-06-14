clc
clear all
close all

fileData = importdata('hassan2.txt');
header = fileData.textdata;
eegData = fileData.data;

originalSamplingRate = 128;
targetSamplingRate = 7; 

start1 = 1.5 * originalSamplingRate + 1;
end1 = 5 * originalSamplingRate;
start2 = 5 * originalSamplingRate + 1;
end2 = 9 * originalSamplingRate;

channelC3 = 5;
channelC4 = 6;

signalC3_1 = eegData(start1:end1, channelC3);
signalC4_1 = eegData(start1:end1, channelC4);

signalC3_2 = eegData(start2:end2, channelC3);
signalC4_2 = eegData(start2:end2, channelC4);

downsampledC3_rest = decimate(signalC3_1, round(originalSamplingRate / targetSamplingRate));
downsampledC4_rest = decimate(signalC4_1, round(originalSamplingRate / targetSamplingRate));
downsampledC3_action = decimate(signalC3_2, round(originalSamplingRate / targetSamplingRate));
downsampledC4_action = decimate(signalC4_2, round(originalSamplingRate / targetSamplingRate));

downsampledLengthC3_rest = length(downsampledC3_rest);
downsampledLengthC4_rest = length(downsampledC4_rest);
downsampledLengthC3_action = length(downsampledC3_action);
downsampledLengthC4_action = length(downsampledC4_action);

downsampledTimeC3_rest = (0:downsampledLengthC3_rest-1) * (1 / targetSamplingRate);
downsampledTimeC4_rest = (0:downsampledLengthC4_rest-1) * (1 / targetSamplingRate);
downsampledTimeC3_action = (0:downsampledLengthC3_action-1) * (1 / targetSamplingRate);
downsampledTimeC4_action = (0:downsampledLengthC4_action-1) * (1 / targetSamplingRate);

figure;
subplot(2, 1, 1);
plot(downsampledTimeC3_rest, downsampledC3_rest);
hold on;
plot(downsampledTimeC4_rest, downsampledC4_rest);
hold on;
xlabel('Time (s)');
ylabel('Amplitude');
title('C3');
legend('rest', 'action');

subplot(2, 1, 2);
plot(downsampledTimeC3_action, downsampledC3_action);
hold on;
plot(downsampledTimeC4_action, downsampledC4_action);
hold on;
xlabel('Time (s)');
ylabel('Amplitude');
title('C4');
legend('rest', 'action');
