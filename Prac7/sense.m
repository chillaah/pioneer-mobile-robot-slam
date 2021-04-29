% function Z = sense(I)
% for week 7 task, detect IDs only
% input: I is an RGB image of the robot's view
% output: Z = 1xn where n is the number of beacons in the image.

%for week 8 task, detect IDs and estimate range and bearing
% input: I is an RGB image of the robot's view
% output: Z = nx3 where Z(i,:) = [id range bearing] (bearing should be in degrees)

close all; clear; clc
load map1r1.mat
m1r1 = data(1).image;
load map1r3.mat
m1r3 = data(1).image;
% load map2r1.mat
% m2r1 = data(1).image;
% load map2r2.mat
% m2r2 = data(1).image;
% load map2r3.mat
% m2r3 = data(1).image;
im = m1r1;
[r, red] = rgbRed(im);
countr = 0; sumri = 0; sumrj = 0;

for i = 1:size(m1r1, 1)
    for j = 1:size(m1r1, 2)
        if r(i, j) == 1
            sumri = sumri + i;
            sumrj = sumrj + j;
            countr = countr + 1;
        end
    end
end
avgri = sumri/countr; avgrj = sumrj/countr;
distR = hypot(avgri, avgrj);

[b, blue] = rgbBlue(im);
countb = 0; sumbi = 0; sumbj = 0;
for i = 1:size(m1r1, 1)
    for j = 1:size(m1r1, 2)
        if b(i, j) == 1
            sumbi = sumbi + i;
            sumbj = sumbj + j;
            countb = countb + 1;
        end
    end
end
avgbi = sumbi/countb; avgbj = sumbj/countb;
distB = hypot(avgbi, avgbj);


[y, yellow] = hsvYellow(im);
county = 0; sumyi = 0; sumyj = 0;
for i = 1:size(m1r1, 1)
    for j = 1:size(m1r1, 2)
        if y(i, j) == 1
            sumyi = sumyi + i;
            sumyj = sumyj + j;
            county = county + 1;
        end
    end
end
avgyi = sumyi/county; avgyj = sumyj/county;
distY = hypot(avgyi, avgyj);

for i = 1:3
    if i == 1; c = r; g = red;
    elseif i == 2; c = b; g = blue;
    else; c = y; g = yellow;
    end
    
    stats = regionprops('table', c,'Centroid',...
        'MajorAxisLength','MinorAxisLength');
    bb = cat(1,stats.Centroid);
    imshow(g)
    hold on
    plot(bb(:,1), bb(:,2),'y*')
    hold off
end

% end
% write all your helper functions below and call them inside the function sense

