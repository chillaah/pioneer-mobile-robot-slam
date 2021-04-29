% function Z = sense(I)
% for week 7 task, detect IDs only
% input: I is an RGB image of the robot's view
% output: Z = 1xn where n is the number of beacons in the image.

%for week 8 task, detect IDs and estimate range and bearing
% input: I is an RGB image of the robot's view
% output: Z = nx3 where Z(i,:) = [id range bearing] (bearing should be in degrees)

load map1r1.mat
m1r1 = data(1).image;
load map1r3.mat
m1r3 = data(1).image;
load map2r1.mat
m2r1 = data(1).image;
load map2r2.mat
m2r2 = data(1).image;
load map2r3.mat
m2r3 = data(1).image;

[r, red] = hsvRed(m1r1);
countr = 0; sumri = 0; sumrj = 0;

for i = 1:size(m1r1, 1)
    for j = 1:size(m1r1, 2)
        if r(i, j) == 1
            sumri = sumri + 1;
            sumrj = sumrj + 1;
            countr = countr + 1;
        end
    end
end

if countr >= 15
    isRed = true;
    avgri = sumri/countr; avgj = sumrj/countj;
end


[b, blue] = hsvBlue(m1r1);

for i = 1:size(m1r1, 1)
    for j = 1:size(m1r1, 2)
        if b(i, j) == 1
            sumbi = sumbi + 1;
            sumbj = sumbj + 1;
            countb = countb + 1;
        end
    end
end

if countb >= 15
    isBlue = true;
    avgbi = sumbi/countb; avgbj = sumbj/countbj;
end

yellow = hsvYellow(m1r1);

% idisp(red);

% end
% write all your helper functions below and call them inside the function sense
