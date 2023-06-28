% Set up the display
Screen('Preference', 'SkipSyncTests', 1);
[win, rect] = Screen('OpenWindow', 0, [0 0 0]);

% Set up the squares
squareSize = 100; % size of each square in pixels
squarePos = [rect(3)/3-50, rect(4)/2, rect(3)/3+50, rect(4)/2+100; ...
            2*rect(3)/3-50, rect(4)/2, 2*rect(3)/3+50, rect(4)/2+100]; % position of each square
freqs = [10, 13]; % flicker frequencies in Hz

% Calculate the sine wave for each square
duration = 10; % in seconds
t = 0:1/60:duration; % 60 Hz refresh rate
sineWaves = sin(2*pi.*freqs'*t);

% Loop through each frame and draw the squares
for frame = 1:length(t)
    for i = 1:2 % loop through each square
        % Calculate the color of the square based on the sine wave
        color = round((sineWaves(i,frame)+1)/2*255); % convert from -1 to 1 range to 0 to 255
        
        % Draw the square
        Screen('FillRect', win, [color color color], squarePos(i,:));
    end
    
    % Flip the display
    Screen('Flip', win);
end

% Clean up
Screen('CloseAll');