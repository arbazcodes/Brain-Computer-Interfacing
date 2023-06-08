fileData = importdata('arbaz_test data.txt');
header = fileData.textdata;
data = fileData.data;
channelsToPlot = [5, 6];  
startTime = 9;              
endTime = 12;                
fs = 128;  
startSample = startTime * fs + 1;  
endSample = endTime * fs;  
time = (startSample:endSample) / fs;
eegData = data(startSample:endSample, channelsToPlot);
figure;
plot(time, eegData);
xlabel('Time (s)');
ylabel('Amplitude');
title('EEG Data');
legend(header(channelsToPlot));




