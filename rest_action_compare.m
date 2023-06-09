fileData1 = importdata('case1.txt');
fileData2 = importdata('case 2.txt');
fileData3 = importdata('case 3.txt');
header1 = fileData1.textdata;
header2 = fileData2.textdata;
header3 = fileData3.textdata;
eegData1 = fileData1.data;
eegData2 = fileData2.data;
eegData3 = fileData3.data;

start1 = 1 * fs + 1;
end1 = 4 * fs;

start2 = 4 * fs + 1;
end2 = 9 * fs;