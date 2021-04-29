% a few moments later
im = imread('moments.jpeg');
imtool(im);

% boring elevator music
[audio, sampleRate] = audioread('elevator.mp3');
sound(audio, sampleRate);

% play
pause(10);
close im;