close all; clear; clc

pb = PiBot('192.168.50.5');

pb.setVelocity(0,30)
pause(5)
pb.setVelocity(30,0)
pause(5)
pb.setVelocity(0,0);