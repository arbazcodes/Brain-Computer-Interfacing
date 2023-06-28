clc
clear all
close all

fileData1 = importdata('arbazmotor.txt');
header1 = fileData1.textdata;
eegData1 = fileData1.data;

fileData2 = importdata('tayyabmotor.txt');
header2 = fileData2.textdata;
eegData2 = fileData2.data;

fileData3 = importdata('tayyabmotor.txt');
header3 = fileData3.textdata;
eegData3 = fileData3.data;

originalSamplingRate = 128;
targetSamplingRate = 80; 

start1 = 1.5 * originalSamplingRate + 1;
end1 = 11 * originalSamplingRate;

channelC3 = 5;
channelC4 = 6;

signalC3_1 = eegData1(start1:end1, channelC3);
signalC4_1 = eegData1(start1:end1, channelC4);

signalC3_2 = eegData2(start1:end1, channelC3);
signalC4_2 = eegData2(start1:end1, channelC4);

signalC3_3 = eegData3(start1:end1, channelC3);
signalC4_3 = eegData3(start1:end1, channelC4);

downsampledC3_arbaz = decimate(signalC3_1, round(originalSamplingRate / targetSamplingRate));
downsampledC4_arbaz = decimate(signalC4_1, round(originalSamplingRate / targetSamplingRate));
downsampledC3_tayyab = decimate(signalC3_2, round(originalSamplingRate / targetSamplingRate));
downsampledC4_tayyab = decimate(signalC4_2, round(originalSamplingRate / targetSamplingRate));
downsampledC3_hassan = decimate(signalC3_3, round(originalSamplingRate / targetSamplingRate));
downsampledC4_hassan = decimate(signalC4_3, round(originalSamplingRate / targetSamplingRate));

downsampledLengthC3_arbaz = length(downsampledC3_arbaz);
downsampledLengthC4_arbaz = length(downsampledC4_arbaz);
downsampledLengthC3_tayyab = length(downsampledC3_tayyab);
downsampledLengthC4_tayyab = length(downsampledC4_tayyab);
downsampledLengthC3_hassan = length(downsampledC3_hassan);
downsampledLengthC4_hassan = length(downsampledC4_hassan);

downsampledTimeC3_arbaz = (0:downsampledLengthC3_arbaz-1) * (1 / targetSamplingRate);
downsampledTimeC4_arbaz = (0:downsampledLengthC4_arbaz-1) * (1 / targetSamplingRate);
downsampledTimeC3_tayyab = (0:downsampledLengthC3_tayyab-1) * (1 / targetSamplingRate);
downsampledTimeC4_tayyab = (0:downsampledLengthC4_tayyab-1) * (1 / targetSamplingRate);
downsampledTimeC3_hassan = (0:downsampledLengthC3_hassan-1) * (1 / targetSamplingRate);
downsampledTimeC4_hassan = (0:downsampledLengthC4_hassan-1) * (1 / targetSamplingRate);

figure;
subplot(2, 1, 1);
plot(downsampledTimeC3_arbaz, downsampledC3_arbaz);
hold on;
plot(downsampledTimeC3_tayyab, downsampledC3_tayyab);
hold on;
plot(downsampledTimeC3_hassan, downsampledC3_hassan);
hold on;
xlabel('Time (s)');
ylabel('Amplitude');
title('C3');
legend('arbaz', 'tayyab', 'hassan');

subplot(2, 1, 2);
plot(downsampledTimeC4_arbaz, downsampledC4_arbaz);
hold on;
plot(downsampledTimeC4_tayyab, downsampledC4_tayyab);
hold on;
plot(downsampledTimeC4_hassan, downsampledC4_hassan);
hold on;
xlabel('Time (s)');
ylabel('Amplitude');
title('C4');
legend('arbaz', 'tayyab', 'hassan');
