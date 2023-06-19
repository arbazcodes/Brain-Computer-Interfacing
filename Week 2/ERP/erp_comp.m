clc 
clear all
close all

fileData1 = importdata('tayyabst.txt');
fileData2 = importdata('ibtehajst.txt');
fileData3 = importdata('hassanst.txt');

header1 = fileData1.textdata;
header2 = fileData2.textdata;
header3 = fileData3.textdata;

eegData1 = fileData1.data;
eegData2 = fileData2.data;
eegData3 = fileData3.data;


fs = 128;  

start1 = 3.5 * fs + 1;
end1 = 7 * fs;

channelO1 = 7;  
channelO2 = 8;  

signalO1_1 = eegData1(start1:end1, channelO1);
signalO2_1 = eegData1(start1:end1, channelO2);

signalO1_2 = eegData2(start1:end1, channelO1);
signalO2_2 = eegData2(start1:end1, channelO2);

signalO1_3 = eegData3(start1:end1, channelO1);
signalO2_3 = eegData3(start1:end1, channelO2);



time1_O1 = (0:length(signalO1_1)-1) / fs;
time1_O2 = (0:length(signalO2_1)-1) / fs;

time2_O1 = (0:length(signalO1_2)-1) / fs;
time2_O2 = (0:length(signalO2_2)-1) / fs;

time3_O1 = (0:length(signalO1_3)-1) / fs;
time3_O2 = (0:length(signalO2_3)-1) / fs;



figure;
subplot(3, 1, 1);
plot(time1_O1, signalO1_1);
hold on;
plot(time1_O2, signalO2_1);
hold on;
xlabel('Time (s)');
ylabel('Amplitude');
title('Tayyab');
legend('O1', 'O2');
%ylim([yMin, yMax]); 

subplot(3, 1, 2);
plot(time2_O1, signalO1_2);
hold on;
plot(time2_O2, signalO2_2);
hold on;
xlabel('Time (s)');
ylabel('Amplitude');
title('Ibtehaj');
legend('O1', 'O2');
%ylim([yMin, yMax]);

subplot(3, 1, 3);
plot(time3_O1, signalO1_3);
hold on;
plot(time3_O2, signalO2_3);
hold on;
xlabel('Time (s)');
ylabel('Amplitude');
title('Hassan');
legend('O1', 'O2');
%ylim([yMin, yMax]);