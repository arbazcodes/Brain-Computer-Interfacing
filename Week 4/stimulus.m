clc;
clear videoFile
clear all
close all


videoDuration = 10; % Duration of the video in seconds
flickerFrequency = 10; % Flickering frequency in Hz
frameRate = 30; % Frame rate of the video

% Calculate the number of frames
numFrames = videoDuration * frameRate;

% Create a VideoWriter object
videoFile = 'flickering_square.avi';
video = VideoWriter(videoFile);
video.FrameRate = frameRate;
open(video);

% Set up the figure and axis
figure;
axis tight;
axis off;

% Generate and write each frame
for frame = 1:numFrames
    % Create the flickering square color
    squareColor = mod(frame / frameRate * flickerFrequency, 1);
    
    % Clear the figure and set background color to black
    cla;
    
    if frame <= frameRate * 3
        set(gcf, 'Color', 'black');
    else
        set(gcf, 'Color', 'none'); % Transparent background
    end
    
    % Draw the square
    squareSize = 0.5;
    squarePosition = [0 0];
    square = rectangle('Position', [squarePosition squareSize squareSize], ...
        'FaceColor', [squareColor squareColor squareColor]);
    
    % Capture the frame and write to the video
    frameImage = getframe(gcf);
    writeVideo(video, frameImage);
end

% Close the video file
close(video);
