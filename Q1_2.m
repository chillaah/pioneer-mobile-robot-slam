%% Q1.2

close all; clear; clc

% time vector
t = linspace(0, 2*pi, 100);

a = 1;

% x-axis
x = a * sqrt(2) * cos(t) ./ (sin(t).^2 + 1);

% y-axis
y = a * sqrt(2) * cos(t) .* sin(t) ./ (sin(t).^2 + 1);

A = 0; % find most effiecient 'a' and store in 'A'

% plot
figure();

plot(x, y, 'r');
box on
grid on
ylim('auto');
