fileData1 = importdata('test2.txt');
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

channelO1 = 9;  
channelO2 = 10;

signalO1_1 = eegData1(start1:end1, channelO1);
signalO2_1 = eegData1(start1:end1, channelO2);

time1_O1 = (0:length(signalO1_1)-1) / fs;
time1_O2 = (0:length(signalO2_1)-1) / fs;

figure;
subplot(2, 1, 1);
plot(time1_O1, signalO1_1);
hold on;

xlabel('Time (s)');
ylabel('Amplitude');
title('Tayyab');
legend('O1', 'O2');

subplot(2, 1, 2);
plot(time1_O2, signalO2_1);
hold on;
xlabel('Time (s)');
ylabel('Amplitude');
title('Ibtehaj');
legend('O1', 'O2');
%ylim([yMin, yMax]);