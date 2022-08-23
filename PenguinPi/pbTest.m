close all; clear; clc

pb = PiBot('192.168.50.5');

pb.setVelocity(20,20);
pause(3)
v = pb.getVoltage();

% pb.setVelocity(0,20);
% pause(3)
% pb.setVelocity(20,0);
% pb.setLED(2);
% pause(3)
% pb.setVelocity(0,0);

% r = zeros(size(1,5));

tic
for i = 1:10
    im = pb.getImage();
    r(i).image = im;
    figure(i)
    idisp(r(i).image);
end
toc

pb.setVelocity(0,0);
