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


minC3_1 = min(signalC3_1);
minC3_2 = min(signalC3_2);
minC3_3 = min(signalC3_3);

maxC3_1 = max(signalC3_1);
maxC3_2 = max(signalC3_2);
maxC3_3 = max(signalC3_3);

minC4_1 = min(signalC4_1);
minC4_2 = min(signalC4_2);
minC4_3 = min(signalC4_3);

maxC4_1 = max(signalC4_1);
maxC4_2 = max(signalC4_2);
maxC4_3 = max(signalC4_3);


disp('Minimum and Maximum values for C3-Case 1:');
disp(['Minimum: ', num2str(minC3_1)]);
disp(['Maximum: ', num2str(maxC3_1)]);

disp('Minimum and Maximum values for C4-Case 1:');
disp(['Minimum: ', num2str(minC4_1)]);
disp(['Maximum: ', num2str(maxC4_1)]);


disp('Minimum and Maximum values for C3-Case 2:');
disp(['Minimum: ', num2str(minC3_2)]);
disp(['Maximum: ', num2str(maxC3_2)]);

disp('Minimum and Maximum values for C4-Case 2:');
disp(['Minimum: ', num2str(minC4_2)]);
disp(['Maximum: ', num2str(maxC4_2)]);

disp('Minimum and Maximum values for C3-Case 3:');
disp(['Minimum: ', num2str(minC3_3)]);
disp(['Maximum: ', num2str(maxC3_3)]);

disp('Minimum and Maximum values for C4-Case 3:');
disp(['Minimum: ', num2str(minC4_3)]);
disp(['Maximum: ', num2str(maxC4_3)]);

%yMin = min([min(signalC3_1(:)), min(signalC3_2(:)), min(signalC4_1(:)), min(signalC4_2(:))]);
%yMax = max([max(signalC3_1(:)), max(signalC3_2(:)), max(signalC4_1(:)), max(signalC4_2(:))]);


time1_C3 = (0:length(signalC3_1)-1) / fs;
time2_C3 = (0:length(signalC3_2)-1) / fs;
time3_C3 = (0:length(signalC3_3)-1) / fs;

time1_C4 = (0:length(signalC4_1)-1) / fs;
time2_C4 = (0:length(signalC4_2)-1) / fs;
time3_C4 = (0:length(signalC4_3)-1) / fs;



figure;
subplot(2, 1, 1);
plot(time1_C3, signalC3_1);
hold on;
plot(time2_C3, signalC3_2);
hold on;
plot(time3_C3, signalC3_3);
hold off;
xlabel('Time (s)');
ylabel('Amplitude');
title('C3');
legend('case 1', 'case 2', 'case 3');
%ylim([yMin, yMax]); 

subplot(2, 1, 2);
plot(time1_C4, signalC4_1);
hold on;
plot(time2_C4, signalC4_2);
hold on;
plot(time3_C4, signalC4_3);
hold off;
xlabel('Time (s)');
ylabel('Amplitude');
title('C4');
legend('case 1', 'case 2', 'case 3');
%ylim([yMin, yMax]);