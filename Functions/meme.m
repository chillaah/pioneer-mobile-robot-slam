% a few moments later
im = imread('moments.jpeg');
idisp(im);

% boring elevator music
[audio, sampleRate] = audioread('elevator.mp3');
sound(audio, 0.5*sampleRate);

% play
pause(10);