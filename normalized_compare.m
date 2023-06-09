fileData1 = importdata('case1.txt');
fileData2 = importdata('case 2.txt');
fileData3 = importdata('case 3.txt');
header1 = fileData1.textdata;
header2 = fileData2.textdata;
header3 = fileData3.textdata;
eegData1 = fileData1.data;
eegData2 = fileData2.data;
eegData3 = fileData3.data;

fs = 128;  

start1 = 4 * fs + 1;
end1 = 9 * fs;

channelC3 = 5;  
channelC4 = 6;  

signalC3_1 = eegData1(start1:end1, channelC3);
signalC4_1 = eegData1(start1:end1, channelC4);

signalC3_2 = eegData2(start1:end1, channelC3);
signalC4_2 = eegData2(start1:end1, channelC4);

signalC3_3 = eegData3(start1:end1, channelC3);
signalC4_3 = eegData3(start1:end1, channelC4);


meanC3_1 = mean(signalC3_1);
stdC3_1 = std(signalC3_1);
normalizedC3_1 = (signalC3_1 - meanC3_1) / stdC3_1;

meanC3_2 = mean(signalC3_2);
stdC3_2 = std(signalC3_2);
normalizedC3_2 = (signalC3_2 - meanC3_2) / stdC3_2;

meanC3_3 = mean(signalC3_3);
stdC3_3 = std(signalC3_3);
normalizedC3_3 = (signalC3_3 - meanC3_3) / stdC3_3;


meanC4_1 = mean(signalC4_1);
stdC4_1 = std(signalC4_1);
normalizedC4_1 = (signalC4_1 - meanC4_1) / stdC4_1;

meanC4_2 = mean(signalC4_2);
stdC4_2 = std(signalC4_2);
normalizedC4_2 = (signalC4_2 - meanC4_2) / stdC4_2;

meanC4_3 = mean(signalC4_3);
stdC4_3 = std(signalC4_3);
normalizedC4_3 = (signalC4_3 - meanC4_3) / stdC4_3;

figure;
subplot(2, 1, 1);
plot(time1_C3, normalizedC3_1);
hold on;
plot(time2_C3, normalizedC3_2);
hold on;
plot(time3_C3, normalizedC3_3);
hold off;
xlabel('Time (s)');
ylabel('Normalized Amplitude');
title('Normalized C3');
legend('case 1', 'case 2', 'case 3');

subplot(2, 1, 2);
plot(time1_C4, normalizedC4_1);
hold on;
plot(time2_C4, normalizedC4_2);
hold on;
plot(time3_C4, normalizedC4_3);
hold off;
xlabel('Time (s)');
ylabel('Normalized Amplitude');
title('Normalized C4');
legend('case 1', 'case 2', 'case 3');


