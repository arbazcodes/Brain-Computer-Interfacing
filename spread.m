fileData = importdata('case1.txt');
header = fileData.textdata;
eegData = fileData.data;

fs = 128;  

start1 = 1.5 * fs + 1;
end1 = 2.5 * fs;

start2 = 5 * fs + 1;
end2 = 6 * fs;


channelC3 = 5;  
channelC4 = 6;  

signalC3_1 = eegData(start1:end1, channelC3);
signalC3_2 = eegData(start2:end2, channelC3);

signalC4_1 = eegData(start1:end1, channelC4);
signalC4_2 = eegData(start2:end2, channelC4);

minC3 = min([min(signalC3_1), min(signalC3_2)]);
maxC3 = max([max(signalC3_1), max(signalC3_2)]);

minC4 = min([min(signalC4_1), min(signalC4_2)]);
maxC4 = max([max(signalC4_1), max(signalC4_2)]);

disp('Minimum and Maximum values for C3:');
disp(['Minimum: ', num2str(minC3)]);
disp(['Maximum: ', num2str(maxC3)]);

disp('Minimum and Maximum values for C4:');
disp(['Minimum: ', num2str(minC4)]);
disp(['Maximum: ', num2str(maxC4)]);

time1 = (0:length(signalC3_1)-1) / fs;
time2 = (0:length(signalC3_2)-1) / fs;

figure;
subplot(2, 1, 1);
plot(time1, signalC3_1);
hold on;
plot(time2, signalC3_2);
hold off;
xlabel('Time (s)');
ylabel('Amplitude');
title('C3');
legend('6-9s', '9-12s'); 

subplot(2, 1, 2);
plot(time1, signalC4_1);
hold on;
plot(time2, signalC4_2);
hold off;
xlabel('Time (s)');
ylabel('Amplitude');
title('C4');
legend('6-9s', '9-12s');