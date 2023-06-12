clc 
clear all
close all

fileData1 = importdata('case1.txt');
fileData2 = importdata('hassancase.txt');
fileData3 = importdata('arbaz_test data.txt');

header1 = fileData1.textdata;
header2 = fileData2.textdata;
header3 = fileData3.textdata;

eegData1 = fileData1.data;
eegData2 = fileData2.data;
eegData3 = fileData3.data;


fs = 128;  

start1 = 4 * fs + 1;
end1 = 9 * fs;

channelo1 = 9;  
channelo2 = 10;  

signalo1_1 = eegData1(start1:end1, channelo1);
signalo2_1 = eegData1(start1:end1, channelo2);

signalo1_2 = eegData2(start1:end1, channelo1);
signalo2_2 = eegData2(start1:end1, channelo2);

signalo1_3 = eegData3(start1:end1, channelo1);
signalo2_3 = eegData3(start1:end1, channelo2);



time1_o1 = (0:length(signalo1_1)-1) / fs;
time1_o2 = (0:length(signalo2_1)-1) / fs;

time2_o1 = (0:length(signalo1_2)-1) / fs;
time2_o2 = (0:length(signalo2_2)-1) / fs;

time3_o1 = (0:length(signalo1_3)-1) / fs;
time3_o2 = (0:length(signalo2_3)-1) / fs;



figure;
subplot(3, 1, 1);
plot(time1_o1, signalo1_1);
hold on;
plot(time1_o2, signalo2_1);
hold on;
xlabel('Time (s)');
ylabel('Amplitude');
title('Arbaz');
legend('o1', 'o2');
%ylim([yMin, yMax]); 

subplot(3, 1, 2);
plot(time2_o1, signalo1_2);
hold on;
plot(time2_o2, signalo2_2);
hold on;
xlabel('Time (s)');
ylabel('Amplitude');
title('Hassan');
legend('o1', 'o2');
%ylim([yMin, yMax]);

subplot(3, 1, 3);
plot(time3_o1, signalo1_3);
hold on;
plot(time3_o2, signalo2_3);
hold on;
xlabel('Time (s)');
ylabel('Amplitude');
title('Tayyab');
legend('o1', 'o2');
%ylim([yMin, yMax]);