fileData1 = importdata('case1.txt');
fileData2 = importdata('case 2.txt');
fileData3 = importdata('case 3.txt');
header1 = fileData1.textdata;
header2 = fileData2.textdata;
header3 = fileData3.textdata;
eegData1 = fileData1.data;
eegData2 = fileData2.data;
eegData3 = fileData3.data;

start1 = 1.5 * fs + 1;
end1 = 5 * fs;

start2 = 5 * fs + 1;
end2 = 9 * fs;

channelC3 = 5;  
channelC4 = 6;

signalC3_1_rest = eegData1(start1:end1, channelC3);
signalC3_1_action = eegData1(start2:end2, channelC3);

signalC4_1_rest = eegData1(start1:end1, channelC4);
signalC4_1_action = eegData1(start2:end2, channelC4);

signalC3_2_rest = eegData2(start1:end1, channelC3);
signalC3_2_action = eegData2(start2:end2, channelC3);

signalC4_2_rest = eegData2(start1:end1, channelC4);
signalC4_2_action = eegData2(start2:end2, channelC4);

signalC3_3_rest = eegData3(start1:end1, channelC3);
signalC3_3_action = eegData3(start2:end2, channelC3);

signalC4_3_rest = eegData3(start1:end1, channelC4);
signalC4_3_action = eegData3(start2:end2, channelC4);


time1_C3_rest = (0:length(signalC3_1_rest)-1) / fs;
time1_C3_action = (0:length(signalC3_1_action)-1) / fs;

time2_C3_rest = (0:length(signalC3_2_rest)-1) / fs;
time2_C3_action = (0:length(signalC3_2_action)-1) / fs;

time3_C3_rest = (0:length(signalC3_3_rest)-1) / fs;
time3_C3_action = (0:length(signalC3_3_action)-1) / fs;

time1_C4_rest = (0:length(signalC3_1_rest)-1) / fs;
time1_C4_action = (0:length(signalC3_1_action)-1) / fs;

time2_C4_rest = (0:length(signalC3_2_rest)-1) / fs;
time2_C4_action = (0:length(signalC3_2_action)-1) / fs;

time3_C4_rest = (0:length(signalC3_3_rest)-1) / fs;
time3_C4_action = (0:length(signalC3_3_action)-1) / fs;

figure;
subplot(3, 1, 1);
plot(time1_C3_rest, signalC3_1_rest);
hold on;
plot(time1_C3_action, signalC3_1_action);
hold off;
xlabel('Time (s)');
ylabel('Amplitude');
title('Case 1');
legend('rest', 'action');

subplot(3, 1, 2);
plot(time2_C3_rest, signalC3_2_rest);
hold on;
plot(time2_C3_action, signalC3_2_action);
hold off;
xlabel('Time (s)');
ylabel('Amplitude');
title('Case 2');
legend('rest', 'action');

subplot(3, 1, 3);
plot(time3_C3_rest, signalC3_3_rest);
hold on;
plot(time3_C3_action, signalC3_3_action);
hold off;
xlabel('Time (s)');
ylabel('Amplitude');
title('Case 3');
legend('rest', 'action');

sgtitle('C3 Channel');

figure;
subplot(3, 1, 1);
plot(time1_C4_rest, signalC4_1_rest);
hold on;
plot(time1_C4_action, signalC4_1_action);
hold off;
xlabel('Time (s)');
ylabel('Amplitude');
title('Case 1');
legend('rest', 'action');

subplot(3, 1, 2);
plot(time2_C4_rest, signalC4_2_rest);
hold on;
plot(time2_C4_action, signalC4_2_action);
hold off;
xlabel('Time (s)');
ylabel('Amplitude');
title('Case 2');
legend('rest', 'action');

subplot(3, 1, 3);
plot(time3_C4_rest, signalC4_3_rest);
hold on;
plot(time3_C4_action, signalC4_3_action);
hold off;
xlabel('Time (s)');
ylabel('Amplitude');
title('Case 3');
legend('rest', 'action');
sgtitle('C4 Channel');