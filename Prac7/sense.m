function Z = sense(I)
% for week 7 task, detect IDs only
% input: I is an RGB image of the robot's view
% output: Z = 1xn where n is the number of beacons in the image.

%for week 8 task, detect IDs and estimate range and bearing
% input: I is an RGB image of the robot's view
% output: Z = nx3 where Z(i,:) = [id range bearing] (bearing should be in degrees)

    im = I;
    
    % filtering number of beacons
    [r, ~] = hsvRed2(im);
    se = strel('disk', 6);
    med = medfilt2(r);
    heal = imopen(med, se);
    bw = bwlabel(heal);
    uni = unique(bw);
    numBeacs = numel(uni);
    dist = zeros(numBeacs, 3);
    se = strel('disk', 4);
    
    % color filtering
    [r, ~] = hsvRed2(im);
    imR = imerode(r, se);
    statsR = regionprops('table', imR,'Centroid');
    centR = cat(1, statsR.Centroid);
    for i = 1:size(centR,1)
        dist(i,1) = hypot(centR(i,1), centR(i,2));
    end
    cents(1:size(centR,1),1:2) = centR;

    [b, ~] = rgbBlue(im);
    imB = imerode(b, se);
    statsB = regionprops('table', imB,'Centroid');
    centB = cat(1, statsB.Centroid);
    for i = 1:size(centB,1)
        dist(i,2) = hypot(centB(i,1), centB(i,2));
    end
    cents(1:size(centB,1),3:4) = centB;


    [y, ~] = hsvYellow(im);
    imY = imerode(y, se);
    statsY = regionprops('table', imY,'Centroid');
    centY = cat(1, statsY.Centroid);
    for i = 1:size(centY,1)
        dist(i,3) = hypot(centY(i,1), centY(i,2));
    end
    cents(1:size(centY,1),5:6) = centY;

    array = [];

    % labelling color and binary number
    for i = 1:size(dist,1)
        if dist(i,1) > dist(i,2)  && dist(i,1) > dist(i,3)
            color(i,3) = "red";
            array(i,5:6) = [0,1];
        elseif (dist(i,1) > dist(i,2) && dist(i,1) < dist(i,3)) || (dist(i,1) < dist(i,2) && dist(i,1) > dist(i,3))
            color(i,2) = "red";
            array(i,3:4) = [0,1];
        else
            color(i,1) = "red";
            array(i,1:2) = [0,1];
        end

        if dist(i,2) > dist(i,1)  && dist(i,2) > dist(i,3)
            color(i,3) = "blue";
            array(i,5:6) = [1,0];
        elseif (dist(i,2) > dist(i,1) && dist(i,2) < dist(i,3)) || (dist(i,2) < dist(i,1) && dist(i,2) > dist(i,3))
            color(i,2) = "blue";
            array(i,3:4) = [1,0];
        else
            color(i,1) = "blue";
            array(i,1:2) = [1,0];
        end

        if dist(i,3) > dist(i,1)  && dist(i,3) > dist(i,2)
            color(i,3) = "yellow";
            array(i,5:6) = [1,1];
        elseif (dist(i,3) > dist(i,1) && dist(i,3) < dist(i,2)) || (dist(i,3) < dist(i,1) && dist(i,3) > dist(i,2))
            color(i,2) = "yellow";
            array(i,3:4) = [1,1];
        else
            color(i,1) = "yellow";
            array(i,1:2) = [1,1];
        end
    end

    % flipping array
    array = fliplr(array); % [array(:,5:6) array(:,3:4) array(:,1:2)];
    
    if isempty(array)
        Z = [];
        return
    end

    % convert binary to decimal
    for i = 1:size(array,1)
        Z(i) = bin2dec(num2str(array(i,:)));
    end
    
end


% write all your helper functions below and call them inside the function sense

