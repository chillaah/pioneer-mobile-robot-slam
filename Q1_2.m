%%
close all; clear; clc

% time vector
t = linspace(0, 2*pi, 100 + 1); t(end) = [];

a = 0.5;

% x-axis
x(t) = (a * sqrt(2) * cos(t)) / ((sin(t))^2 + 1);

% y-axis
y(t) = (a .* sqrt(2) .* cos(t) .* sin(t))/((sin(t)).^2 + 1);

A = 0; % find most effiecient 'a' and sotre in 'A'

% plot
figure();

plot(t, x, 'red');
hold on
grid on
box on
plot(t, y, 'red');

z = tan(t);
plot(t,z, 'r');