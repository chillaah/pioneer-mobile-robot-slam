close all; clear; clc

pb = PiBot('192.168.50.5');

pb.setVelocity(0,20);
pause(3)
pb.setVelocity(20,0);
pb.setLED(2);
pause(3)
pb.setVelocity(0,0);