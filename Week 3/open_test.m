clc
clear all
close all

fileData1 = importdata('hassanfocus.txt');
header1 = fileData1.textdata;
eegData1 = fileData1.data;

fileData2 = importdata('wajidfocus.txt');
header2 = fileData2.textdata;
eegData2 = fileData2.data;

fileData3 = importdata('mehakfocus.txt');
header3 = fileData3.textdata;
eegData3 = fileData3.data;

fileData4 = importdata('tayyab512.txt');
header4 = fileData4.textdata;
eegData4 = fileData4.data;

originalSamplingRate = 512;
targetSamplingRate = 128; 

start1 = 1.5 * originalSamplingRate + 1;
end1 = 2 * originalSamplingRate;

channelO1 = 9;
channelO2 = 10;

signalO1_1 = eegData1(start1:end1, channelO1);
signalO2_1 = eegData1(start1:end1, channelO2);

signalO1_2 = eegData2(start1:end1, channelO1);
signalO2_2 = eegData2(start1:end1, channelO2);

signalO1_3 = eegData3(start1:end1, channelO1);
signalO2_3 = eegData3(start1:end1, channelO2);

signalO1_4 = eegData4(start1:end1, channelO1);
signalO2_4 = eegData4(start1:end1, channelO2);

downsampledO1_1 = decimate(signalO1_1, round(originalSamplingRate / targetSamplingRate));
downsampledO2_1 = decimate(signalO2_1, round(originalSamplingRate / targetSamplingRate));
downsampledO1_2 = decimate(signalO1_2, round(originalSamplingRate / targetSamplingRate));
downsampledO2_2 = decimate(signalO2_2, round(originalSamplingRate / targetSamplingRate));
downsampledO1_3 = decimate(signalO1_3, round(originalSamplingRate / targetSamplingRate));
downsampledO2_3 = decimate(signalO2_3, round(originalSamplingRate / targetSamplingRate));
downsampledO1_4 = decimate(signalO1_4, round(originalSamplingRate / targetSamplingRate));
downsampledO2_4 = decimate(signalO2_4, round(originalSamplingRate / targetSamplingRate));

downsampledLengthO1_1 = length(downsampledO1_1);
downsampledLengthO2_1 = length(downsampledO2_1);
downsampledLengthO1_2 = length(downsampledO1_2);
downsampledLengthO2_2 = length(downsampledO2_2);
downsampledLengthO1_3 = length(downsampledO1_3);
downsampledLengthO2_3 = length(downsampledO2_3);
downsampledLengthO1_4 = length(downsampledO1_4);
downsampledLengthO2_4 = length(downsampledO2_4);

downsampledTimeO1_1 = (0:downsampledLengthO1_1-1) * (1 / targetSamplingRate);
downsampledTimeO2_1 = (0:downsampledLengthO2_1-1) * (1 / targetSamplingRate);
downsampledTimeO1_2 = (0:downsampledLengthO1_2-1) * (1 / targetSamplingRate);
downsampledTimeO2_2 = (0:downsampledLengthO2_2-1) * (1 / targetSamplingRate);
downsampledTimeO1_3 = (0:downsampledLengthO1_3-1) * (1 / targetSamplingRate);
downsampledTimeO2_3 = (0:downsampledLengthO2_3-1) * (1 / targetSamplingRate);
downsampledTimeO1_4 = (0:downsampledLengthO1_4-1) * (1 / targetSamplingRate);
downsampledTimeO2_4 = (0:downsampledLengthO2_4-1) * (1 / targetSamplingRate);

figure;
subplot(2, 1, 1);
plot(downsampledTimeO1_1, downsampledO1_1);
hold on;
plot(downsampledTimeO1_2, downsampledO1_2);
hold on;
plot(downsampledTimeO1_3, downsampledO1_3);
hold on;
plot(downsampledTimeO1_4, downsampledO1_4);
hold on;
xlabel('Time (s)');
ylabel('Amplitude');
title('O1');
legend('hassan', 'wajid', 'mehak', 'tayyab');

subplot(2, 1, 2);
plot(downsampledTimeO2_1, downsampledO2_1);
hold on;
plot(downsampledTimeO2_2, downsampledO2_2);
hold on;
plot(downsampledTimeO2_3, downsampledO2_3);
hold on;
plot(downsampledTimeO2_4, downsampledO2_4);
hold on;
xlabel('Time (s)');
ylabel('Amplitude');
title('O2');
legend('hassan', 'wajid', 'mehak', 'tayyab');
