clc 
clear all
close all

fileData1 = importdata('case1.txt');
fileData2 = importdata('hassancase.txt');
header1 = fileData1.textdata;
header2 = fileData2.textdata;
eegData1 = fileData1.data;
eegData2 = fileData2.data;

fs = 128;  

start1 = 4 * fs + 1;
end1 = 9 * fs;

channelC3 = 5;  
channelC4 = 6;  

signalC3_1 = eegData1(start1:end1, channelC3);
signalC4_1 = eegData1(start1:end1, channelC4);

signalC3_2 = eegData2(start1:end1, channelC3);
signalC4_2 = eegData2(start1:end1, channelC4);



meanC3_1 = mean(signalC3_1);
stdC3_1 = std(signalC3_1);
normalizedC3_1 = (signalC3_1 - meanC3_1) / stdC3_1;

meanC3_2 = mean(signalC3_2);
stdC3_2 = std(signalC3_2);
normalizedC3_2 = (signalC3_2 - meanC3_2) / stdC3_2;



meanC4_1 = mean(signalC4_1);
stdC4_1 = std(signalC4_1);
normalizedC4_1 = (signalC4_1 - meanC4_1) / stdC4_1;

meanC4_2 = mean(signalC4_2);
stdC4_2 = std(signalC4_2);
normalizedC4_2 = (signalC4_2 - meanC4_2) / stdC4_2;

time1_C3 = (0:length(normalizedC3_1) - 1) / fs;
time2_C3 = (0:length(normalizedC3_2) - 1) / fs;
time1_C4 = (0:length(normalizedC4_1) - 1) / fs;
time2_C4 = (0:length(normalizedC4_2) - 1) / fs;


figure;
subplot(2, 1, 1);
plot(time1_C3, normalizedC3_1);
hold on;
plot(time2_C3, normalizedC3_2);
hold on;
xlabel('Time (s)');
ylabel('Normalized Amplitude');
title('Normalized C3');
legend('right', 'left');

subplot(2, 1, 2);
plot(time1_C4, normalizedC4_1);
hold on;
plot(time2_C4, normalizedC4_2);
hold on;
xlabel('Time (s)');
ylabel('Normalized Amplitude');
title('Normalized C4');
legend('right', 'left');


