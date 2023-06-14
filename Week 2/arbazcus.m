clc
clear all
close all
fileData = importdata('case1.txt');
header = fileData.textdata;
eegData = fileData.data;

fs = 128;  

start1 = 1.5 * fs + 1;
end1 = 5 * fs;
start2 = 5 * fs + 1;
end2 = 9 * fs;

channelfp1 = 1;  
channelo2 = 2;  

signalfp1_1 = eegData(start1:end1, channelfp1);
signalo2_1 = eegData(start1:end1, channelo2);

signalfp1_2 = eegData(start2:end2, channelfp1);
signalo2_2 = eegData(start2:end2, channelo2);



minfp1_1 = min(signalfp1_1);
minfp1_2 = min(signalfp1_2);

maxfp1_1 = max(signalfp1_1);
maxfp1_2 = max(signalfp1_2);

mino2_1 = min(signalo2_1);
mino2_2 = min(signalo2_2);

maxo2_1 = max(signalo2_1);
maxo2_2 = max(signalo2_2);


disp('Minimum and Maximum values for fp1-Case 1:');
disp(['Minimum: ', num2str(minfp1_1)]);
disp(['Maximum: ', num2str(maxfp1_1)]);

disp('Minimum and Maximum values for o2-Case 1:');
disp(['Minimum: ', num2str(mino2_1)]);
disp(['Maximum: ', num2str(maxo2_1)]);


disp('Minimum and Maximum values for fp1-Case 2:');
disp(['Minimum: ', num2str(minfp1_2)]);
disp(['Maximum: ', num2str(maxfp1_2)]);

disp('Minimum and Maximum values for o2-Case 2:');
disp(['Minimum: ', num2str(mino2_2)]);
disp(['Maximum: ', num2str(maxo2_2)]);


%yMin = min([min(signalfp1_1(:)), min(signalfp1_2(:)), min(signalo2_1(:)), min(signalo2_2(:))]);
%yMax = max([max(signalfp1_1(:)), max(signalfp1_2(:)), max(signalo2_1(:)), max(signalo2_2(:))]);


time1_fp1 = (0:length(signalfp1_1)-1) / fs;
time2_fp1 = (0:length(signalfp1_2)-1) / fs;

time1_o2 = (0:length(signalo2_1)-1) / fs;
time2_o2 = (0:length(signalo2_2)-1) / fs;



figure;
subplot(2, 1, 1);
plot(time1_fp1, signalfp1_1);
hold on;
plot(time2_fp1, signalfp1_2);
hold on;
xlabel('Time (s)');
ylabel('Amplitude');
title('fp1');
legend('rest', 'action');
%ylim([yMin, yMax]); 

subplot(2, 1, 2);
plot(time1_o2, signalo2_1);
hold on;
plot(time2_o2, signalo2_2);
hold on;

xlabel('Time (s)');
ylabel('Amplitude');
title('o2');
legend('rest', 'action');
%ylim([yMin, yMax]);