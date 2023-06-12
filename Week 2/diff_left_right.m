eegData = importdata('case1.txt');
header1 = eegData.textdata;
data1 = eegData.data;
eegData = importdata('hassancase.txt');
header2 = eegData.textdata;
data2 = eegData.data;
fs = 128;

start1 = 4 * fs + 1;
end1 = 9 * fs;

signal1 = data1(start1:end1, 5);
signal2 = data2(start1:end1, 5);
signal3 = data1(start1:end1, 6);
signal4 = data2(start1:end1, 6);

difference1 = signal2 - signal1;
difference2 = signal4 - signal3;

time = (0:length(difference1)-1) / fs;

subplot(2,1,1)
plot(time, difference1)
xlabel('Time (s)')
ylabel('Difference')
title('(C3)')

subplot(2,1,2)
plot(time, difference2)
xlabel('Time (s)')
ylabel('Difference')
title('(C4)')
