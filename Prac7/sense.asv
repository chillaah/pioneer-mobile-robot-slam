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
imRGB = rgbRGB(im);
stats = regionprops('table', imRGB,'Centroid',...
    'MajorAxisLength','MinorAxisLength');
check = cat(1, stats.Centroid);
numBeacs = round(check/2);

[r, red] = hsvRed2(im);
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

se = strel('disk', 4);
imR = imerode(r, se);

statsR = regionprops('table', imR,'Centroid',...
    'MajorAxisLength','MinorAxisLength');
centR = cat(1, statsR.Centroid);
for i = 1:size(centR,1)
    dist(i,1) = hypot(centR(i,1), centR(i,2));
end
cents(1:size(centR,1),1:2) = centR;


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

se = strel('disk', 4);
imB = imerode(b, se);

statsB = regionprops('table', imB,'Centroid',...
    'MajorAxisLength','MinorAxisLength');
centB = cat(1, statsB.Centroid);
for i = 1:size(centB,1)
    dist(i,2) = hypot(centB(i,1), centB(i,2));
end
cents(1:size(centB,1),3:4) = centB;


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

se = strel('disk', 4);
imY = imerode(y, se);

statsY = regionprops('table', imY,'Centroid',...
    'MajorAxisLength','MinorAxisLength');
centY = cat(1, statsY.Centroid);
for i = 1:size(centY,1)
    dist(i,3) = hypot(centY(i,1), centY(i,2));
end
cents(1:size(centY,1),5:6) = centY;

colorString = ["red", "blue", "yellow"];
array = [];

% labelling color and binary number
for i = 1:size(dist,1)
    if dist(i,1) > dist(i,2)  && dist(i,1) > dist(i,3)
        color(i,3) = "red";
        array(i,5:6) = [0,1]; 
    elseif dist(i,1) > dist(i,2) && dist(i,1) < dist(i,3)
        color(i,2) = "red";
        array(i,3:4) = [0,1]; 
    else
        color(i,1) = "red";
        array(i,1:2) = [0,1];  
    end
    
    if dist(i,2) > dist(i,1)  && dist(i,2) > dist(i,3)
        color(i,3) = "blue";
        array(i,5:6) = [1,0]; 
    elseif dist(i,2) > dist(i,1) && dist(i,2) < dist(i,3)
        color(i,2) = "blue";
        array(i,3:4) = [1,0]; 
    else
        color(i,1) = "blue";
        array(i,1:2) = [1,0];
    end
    
    if dist(i,3) > dist(i,1)  && dist(i,3) > dist(i,2)
        color(i,3) = "yellow";
        array(i,5:6) = [1,1]; 
    elseif dist(i,3) > dist(i,1) && dist(i,3) < dist(i,2)
        color(i,2) = "yellow";
        array(i,3:4) = [1,1];  
    else
        color(i,1) = "yellow";
        array(i,1:2) = [1,1];  
    end
end

% flipping array
array = [array(:,5:6) array(:,3:4) array(:,1:2)];

% convert binary to decimal
for i = 1:size(array,1)
    sensee(i) = bin2dec(num2str(array(i,:)));
end


% write all your helper functions below and call them inside the function sense

