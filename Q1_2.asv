%% Q1.2

close all; clear; clc

% time vector
t = linspace(0, 2*pi, 100);

% when t = 0,2*pi -> x(t) = a*srt(2)
% a = +/-0.5/sqrt(2)
a = 0.5/sqrt(2);

% x-axis
x = a * sqrt(2) * cos(t) ./ (sin(t).^2 + 1);

% y-axis
y = a * sqrt(2) * cos(t) .* sin(t) ./ (sin(t).^2 + 1);

A = a;

% plot
figure();

% plot(t, x, 'r');
plot(x, y, 'b');
box on
grid on
ylim('auto');

