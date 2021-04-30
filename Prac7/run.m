close all; clear; clc
% load map1r1.mat
% m1r1 = data(1).image;
% load map1r3.mat
% m1r3 = data(1).image;
load map2r1.mat

% load map2r2.mat
% m2r2 = data(1).image;
% load map2r3.mat
% m2r3 = data(1).image;

Z = sense(data(51).image);

% for i = length(data):-1:1
%     img = data(i).image;
%     Z = sense(img)
% end

