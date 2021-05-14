function Z = sense(I)
% input: I is an RGB image of the robot's view
% output: Z = nx3 where Z(i,:) = [id range bearing] (bearing should be in degrees)


    % filtering number of beacons
    [r, ~] = hsvRed2(I);
    fe = strel('disk', 6);
    med = medfilt2(r);
    heal = imopen(med, fe);
    bw = bwlabel(heal);
    uni = unique(bw);
    nums = numel(uni);
    numBeacs = nums - 1;
    
    if numBeacs == 0
        
        Z = [];
        
    else
        
        dist = zeros(numBeacs, 3);
        fe = strel('disk', 4);

        % red filtering
        [r, ~] = hsvRed2(I);
        imR = imerode(r, fe);
        statsR = regionprops('table', imR,'Centroid');
        centR = cat(1, statsR.Centroid);
        for i = 1:size(centR,1)
            dist(i,1) = hypot(centR(i,1), centR(i,2));
        end
        r = imopen(r, ones(4));
        
        % blue filtering
        [b, ~] = hsvBlue(I);
        imB = imdilate(b, fe);
        imB = imerode(imB, fe);
        statsB = regionprops('table', imB,'Centroid');
        centB = cat(1, statsB.Centroid);
        for i = 1:size(centB,1)
            dist(i,2) = hypot(centB(i,1), centB(i,2));
        end
        b = imopen(b, ones(2));

        % yellow filtering
        [y, ~] = hsvYellow(I);
        imY = imerode(y, fe);
        statsY = regionprops('table', imY,'Centroid');
        centY = cat(1, statsY.Centroid);
        for i = 1:size(centY,1)
            dist(i,3) = hypot(centY(i,1), centY(i,2));
        end
        y = imopen(y, ones(4));

        % labelling color and assigning binary number
        array = zeros(numBeacs, 6);
        color = strings(numBeacs, 3);
        if size(dist,1) == 3
            dist = dist(1:2,:);
        end
        for i = 1:size(dist,1)
            if dist(i,1) > dist(i,2) && dist(i,1) > dist(i,3)
                color(i,3) = "red";
                array(i,5:6) = [0,1];
            elseif (dist(i,1) > dist(i,2) && dist(i,1) < dist(i,3)) || (dist(i,1) < dist(i,2) && dist(i,1) > dist(i,3))
                color(i,2) = "red";
                array(i,3:4) = [0,1];
            else
                color(i,1) = "red";
                array(i,1:2) = [0,1];
            end

            if dist(i,2) > dist(i,1) && dist(i,2) > dist(i,3)
                color(i,3) = "blue";
                array(i,5:6) = [1,0];
            elseif (dist(i,2) > dist(i,1) && dist(i,2) < dist(i,3)) || (dist(i,2) < dist(i,1) && dist(i,2) > dist(i,3))
                color(i,2) = "blue";
                array(i,3:4) = [1,0];
            else
                color(i,1) = "blue";
                array(i,1:2) = [1,0];
            end

            if dist(i,3) > dist(i,1) && dist(i,3) > dist(i,2)
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
        array1 = array(:,5:6);
        array2 = array(:,3:4);
        array3 = array(:,1:2);
        array = [array1, array2, array3];
        
        for c = 1:size(array,1)
            if array1(c,:) == [0, 0]
                array(c,:) = [];
            end
        end
        
        for d = 1:size(array,1)
            if array2(d,:) == [0, 0]
                array(d,:) = [];
            end
        end
        for e = 1:size(array,1)
            if array3(e,:) == [0, 0]
                array(e,:) = [];
            end
        end
        % params
        f = 3.6e-3; % focal length [mm]
        sensorH = 2.64e-3; % sensor height [mm]
        realH = 150e-3; % real height [mm]
        angle = 62.2; % angle of view [deg]
        imgH = size(I, 1); % image height [mm]
        imgL = size(I, 2); % image length [mm]
        
        % joining images and vision
        joined = b + y + r;
        fe = strel('disk', 7);
        imLog = logical(imdilate(joined, fe));
        
        % border closing
        imLog(:,1) = 0; imLog(:,2) = 0; imLog(:,3) = 0;
        imLog(1,:) = 0; imLog(2,:) = 0; imLog(3,:) = 0;
        imLog(end,:) = 0; imLog(end-1,:) = 0; imLog(end-2,:) = 0;
        imLog(:,end) = 0; imLog(:,end-1) = 0; imLog(:,end-2) = 0;
        
        % segment
        segment = vision.BlobAnalysis;
        [~, cents, bounds] = segment(imLog);
        objectH = double(bounds(:, 4)); % object height [px]
        shift = 0.5;
        
        % bearing
        bearing = angle * (imgL * shift - cents(:, 1)) / imgL;
        
        % range
        range = (f * realH * imgH) ./ (objectH * sensorH);

        % convert binary to decimal
        Z =  zeros(1, numBeacs);
        for i = 1:size(array, 1)
            Z(i) = bin2dec(num2str(array(i, :)));
        end
        
        % output reading
        Z = [Z', range+0.15, bearing+0.15];
    end
end
