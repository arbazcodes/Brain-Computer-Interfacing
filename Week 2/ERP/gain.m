

clc
clear all
close all

fileData1 = importdata('test3.txt');
header1 = fileData1.textdata;
eegData1 = fileData1.data;

fileData2 = importdata('hassan2.txt');
header2 = fileData2.textdata;
eegData2 = fileData2.data;

fileData3 = importdata('hassanst.txt');
header3 = fileData3.textdata;
eegData3 = fileData3.data;

originalSamplingRate = 128;
targetSamplingRate = 128; 

start1 = 3.5 * originalSamplingRate + 1;
end1 = 7 * originalSamplingRate;

channelO1 = 5;
channelO2 = 6;

signalO1_1 = eegData1(start1:end1, channelO1);
signalO2_1 = eegData2(start1:end1, channelO1);

% Define two signals

% Divide signal1 by signal2
result = signalO1_1 ./ signalO2_1;

% Display the result
disp(result);


