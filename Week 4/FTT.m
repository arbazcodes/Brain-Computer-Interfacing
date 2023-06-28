fileData1 = importdata('mehakssvep2.txt');
header1 = fileData1.textdata;
data = fileData1.data;

channel_numbers = [9, 10, 22, 7, 8, 21, 31, 32];

sampling_rate = 512;
frequency_range = [5 100];

figure;
for i = 1:numel(channel_numbers)
    channel_data = data(:, channel_numbers(i));
    n = length(channel_data);
    f = (0:(n/2)) * (sampling_rate / n);
    
    channel_fft = abs(fft(channel_data));
    channel_fft = channel_fft(1:numel(f));
    
    subplot(4, 2, i);
    plot(f, channel_fft);
    title(['Channel ', num2str(channel_numbers(i))]);
    xlabel('Frequency (Hz)');
    ylabel('Magnitude');
    xlim(frequency_range);
    grid on;
end