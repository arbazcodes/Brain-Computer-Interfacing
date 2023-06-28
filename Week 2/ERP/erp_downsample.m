clc
clear all
close all

fileData1 = importdata('tayyabst.txt');
header1 = fileData1.textdata;
eegData1 = fileData1.data;

fileData2 = importdata('ibtehajst.txt');
header2 = fileData2.textdata;
eegData2 = fileData2.data;

fileData3 = importdata('hassanst.txt');
header3 = fileData3.textdata;
eegData3 = fileData3.data;

originalSamplingRate = 128;
targetSamplingRate = 30; 

start1 = 3.5 * originalSamplingRate + 1;
end1 = 7 * originalSamplingRate;

channelO1 = 5;
channelO2 = 6;

signalO1_1 = eegData1(start1:end1, channelO1);
signalO2_1 = eegData1(start1:end1, channelO2);

signalO1_2 = eegData2(start1:end1, channelO1);
signalO2_2 = eegData2(start1:end1, channelO2);

signalO1_3 = eegData3(start1:end1, channelO1);
signalO2_3 = eegData3(start1:end1, channelO2);

downsampledO1_tayyab = decimate(signalO1_1, round(originalSamplingRate / targetSamplingRate));
downsampledO2_tayyab = decimate(signalO2_1, round(originalSamplingRate / targetSamplingRate));
downsampledO1_ibtehaj = decimate(signalO1_2, round(originalSamplingRate / targetSamplingRate));
downsampledO2_ibtehaj = decimate(signalO2_2, round(originalSamplingRate / targetSamplingRate));
downsampledO1_hassan = decimate(signalO1_3, round(originalSamplingRate / targetSamplingRate));
downsampledO2_hassan = decimate(signalO2_3, round(originalSamplingRate / targetSamplingRate));

downsampledLengthO1_tayyab = length(downsampledO1_tayyab);
downsampledLengthO2_tayyab = length(downsampledO2_tayyab);
downsampledLengthO1_ibtehaj = length(downsampledO1_ibtehaj);
downsampledLengthO2_ibtehaj = length(downsampledO2_ibtehaj);
downsampledLengthO1_hassan = length(downsampledO1_hassan);
downsampledLengthO2_hassan = length(downsampledO2_hassan);

downsampledTimeO1_tayyab = (0:downsampledLengthO1_tayyab-1) * (1 / targetSamplingRate);
downsampledTimeO2_tayyab = (0:downsampledLengthO2_tayyab-1) * (1 / targetSamplingRate);
downsampledTimeO1_ibtehaj = (0:downsampledLengthO1_ibtehaj-1) * (1 / targetSamplingRate);
downsampledTimeO2_ibtehaj = (0:downsampledLengthO2_ibtehaj-1) * (1 / targetSamplingRate);
downsampledTimeO1_hassan = (0:downsampledLengthO1_hassan-1) * (1 / targetSamplingRate);
downsampledTimeO2_hassan = (0:downsampledLengthO2_hassan-1) * (1 / targetSamplingRate);

figure;
subplot(2, 1, 1);
plot(downsampledTimeO1_tayyab, downsampledO1_tayyab);
hold on;
plot(downsampledTimeO1_ibtehaj, downsampledO1_ibtehaj);
hold on;
plot(downsampledTimeO1_hassan, downsampledO1_hassan);
hold on;
xlabel('Time (s)');
ylabel('Amplitude');
title('O1');
legend('tayyab', 'ibtehaj', 'hassan');

subplot(2, 1, 2);
plot(downsampledTimeO2_tayyab, downsampledO2_tayyab);
hold on;
plot(downsampledTimeO2_ibtehaj, downsampledO2_ibtehaj);
hold on;
plot(downsampledTimeO2_hassan, downsampledO2_hassan);
hold on;
xlabel('Time (s)');
ylabel('Amplitude');
title('O2');
legend('tayyab', 'ibtehaj', 'hassan');
