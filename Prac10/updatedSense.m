function Z = updatedSense(I)
% input: I is an RGB image of the robot's view
% output: Z = nx3 where Z(i,:) = [id range bearing] (bearing should be in degrees)

    % initialize
    Z = [];
    fe = [ 5, 5 ];
    dist = zeros(3 ,1);

    % red filtering
    [r, ~] = maskRed(I);
    imR = medfilt2(r, fe);
    statsR = regionprops('table', imR, 'Centroid', 'BoundingBox', 'Area');
    boxR = cat(1, statsR.BoundingBox);
    areaR = cat(1, statsR.Area);
    centR = cat(1, statsR.Centroid);
    for i = 1:size(centR,1)
        dist(i,1) = hypot(centR(i,1), centR(i,2));
    end
    % r = imopen(r, ones(4));

    % blue filtering
    [b, ~] = maskBlue(I);
    imB = medfilt2(b, fe);
    statsB = regionprops('table', imB, 'Centroid', 'BoundingBox', 'Area');
    boxB = cat(1, statsB.BoundingBox);
    areaB = cat(1, statsB.Area);
    centB = cat(1, statsB.Centroid);
    for i = 1:size(centB,1)
        dist(i,2) = hypot(centB(i,1), centB(i,2));
    end
    % b = imopen(b, ones(4));

    % yellow filtering
    [y, ~] = maskYellow(I);
    imY = medfilt2(y, fe);
    statsY = regionprops('table', imY, 'Centroid', 'BoundingBox', 'Area');
    boxY = cat(1, statsY.BoundingBox);
    areaY = cat(1, statsY.Area);
    centY = cat(1, statsY.Centroid);
    for i = 1:size(centY,1)
        dist(i,3) = hypot(centY(i,1), centY(i,2));
    end
    % y = imopen(y, ones(4));
    
    % beacon check
    redEmpty = isempty(areaR);
    yellowEmpty = isempty(areaY);
    blueEmpty = isempty(areaB);
    empty = [ redEmpty, yellowEmpty, blueEmpty ];
    emptySum = sum(empty, 'all');
    
    % beacon exists
    if emptySum == 0
        
        % number of beacons
        numBeacs = size(boxR, 1);
        numCodes = 3; % r y b
        
        % params
        f = 3.6e-3; % focal length [mm]
        sensorH = 2.64e-3; % sensor height [mm]
        realH = 150e-3; % real height [mm]
        angle = 62.2; % angle of view [deg]
        imgH = size(I, 1); % image height [mm]
        imgL = size(I, 2); % image length [mm]
        shift = 0.5;
        color = strings(numBeacs, 3);
        order = 'descend';
        array = "";
        
        % looping over each beacon
        for i = 1:numBeacs
            
            % mid-centroid
            cents = [ centR(i, :); 
                      centY(i, :);
                      centB(i, :) ];
            
            sortCents = sortrows(cents, 1);
            beacX = 1;
            beacMidcent1 = sortCents(1, beacX);
            beacMidcent2 = sortCents(2, beacX);
            beacMidcent3 = sortCents(3, beacX);
            combinedMidcent = beacMidcent1 + beacMidcent2 + beacMidcent3;
            midCent = combinedMidcent / 3; 
            
            % object height
            hs = [ boxY(i, :);
                   boxR(i, :);
                   boxB(i, :) ];
            
            sortHs = sortrows(hs, 2, order);
            tVal = 2; bVal = 2; wbVal = 4;
            top = sortHs(1, tVal);
            bottom = sortHs(3, bVal);
            whiteBottom = sortHs(1, wbVal);
            h = top - bottom; % color height
            objectH = whiteBottom + h; % actual height

            % bearing
            bearing = angle * (imgL * shift - midCent) / imgL;
        
            % range
            range = (f * realH * imgH) ./ (objectH * sensorH);
            
            % beacon coding
            centBlue = cents(3, :);
            centRed = cents(1, :);
            centYellow = cents(2,  :);
            
            allBeacs = [ 10, centBlue; 
                         01, centRed; 
                         11, centYellow ];
            allBeacs = sortrows(allBeacs, 3, order);
            
            % labelling color and assigning binary number
            for j = 1:numCodes
                
                switch allBeacs(j, 1)
                    case 10
                        array(j) = "10";
                        color(j) = "blue";    
                    case 01
                        array(j) = "01";
                        color(j) = "red";   
                    case 11
                        array(j) = "11";
                        color(j) = "yellow";
                end
                
            end
            
            % convert binary to decimal
            array = strjoin(array, '');
            ID = bin2dec(array);
            
            % output reading
            Z(i,:) = [ ID', range, bearing ];
            
            % numBeacs over check
            lenR = length(areaR);
            lenY = length(areaY);
            lenB = length(areaB);
            len = [ lenR, lenY, lenB ];
            sumLen = sum(len, 'all');
            
            if sumLen == 1
                break;
            end
            
        end
    end
end

function [BW,maskedRGBImage] = maskBlue(RGB)
%createMask  Threshold RGB image using auto-generated code from colorThresholder app.
%  [BW,MASKEDRGBIMAGE] = createMask(RGB) thresholds image RGB using
%  auto-generated code from the colorThresholder app. The colorspace and
%  range for each channel of the colorspace were set within the app. The
%  segmentation mask is returned in BW, and a composite of the mask and
%  original RGB images is returned in maskedRGBImage.

% Auto-generated by colorThresholder app on 27-May-2021
%------------------------------------------------------


% Convert RGB image to chosen color space
I = RGB;

% Define thresholds for channel 1 based on histogram settings
channel1Min = 16.000;
channel1Max = 40.000;

% Define thresholds for channel 2 based on histogram settings
channel2Min = 18.000;
channel2Max = 77.000;

% Define thresholds for channel 3 based on histogram settings
channel3Min = 56.000;
channel3Max = 127.000;

% Create mask based on chosen histogram thresholds
sliderBW = (I(:,:,1) >= channel1Min ) & (I(:,:,1) <= channel1Max) & ...
    (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
    (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);
BW = sliderBW;

% Initialize output masked image based on input image.
maskedRGBImage = RGB;

% Set background pixels where BW is false to zero.
maskedRGBImage(repmat(~BW,[1 1 3])) = 0;

end

function [BW,maskedRGBImage] = maskRed(RGB)
%createMask  Threshold RGB image using auto-generated code from colorThresholder app.
%  [BW,MASKEDRGBIMAGE] = createMask(RGB) thresholds image RGB using
%  auto-generated code from the colorThresholder app. The colorspace and
%  range for each channel of the colorspace were set within the app. The
%  segmentation mask is returned in BW, and a composite of the mask and
%  original RGB images is returned in maskedRGBImage.

% Auto-generated by colorThresholder app on 27-May-2021
%------------------------------------------------------


% Convert RGB image to chosen color space
I = RGB;

% Define thresholds for channel 1 based on histogram settings
channel1Min = 70.000;
channel1Max = 181.000;

% Define thresholds for channel 2 based on histogram settings
channel2Min = 2.000;
channel2Max = 50.000;

% Define thresholds for channel 3 based on histogram settings
channel3Min = 2.000;
channel3Max = 71.000;

% Create mask based on chosen histogram thresholds
sliderBW = (I(:,:,1) >= channel1Min ) & (I(:,:,1) <= channel1Max) & ...
    (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
    (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);
BW = sliderBW;

% Initialize output masked image based on input image.
maskedRGBImage = RGB;

% Set background pixels where BW is false to zero.
maskedRGBImage(repmat(~BW,[1 1 3])) = 0;

end

function [BW,maskedRGBImage] = maskYellow(RGB)
%createMask  Threshold RGB image using auto-generated code from colorThresholder app.
%  [BW,MASKEDRGBIMAGE] = createMask(RGB) thresholds image RGB using
%  auto-generated code from the colorThresholder app. The colorspace and
%  range for each channel of the colorspace were set within the app. The
%  segmentation mask is returned in BW, and a composite of the mask and
%  original RGB images is returned in maskedRGBImage.

% Auto-generated by colorThresholder app on 27-May-2021
%------------------------------------------------------


% Convert RGB image to chosen color space
I = RGB;

% Define thresholds for channel 1 based on histogram settings
channel1Min = 101.000;
channel1Max = 200.000;

% Define thresholds for channel 2 based on histogram settings
channel2Min = 100.000;
channel2Max = 184.000;

% Define thresholds for channel 3 based on histogram settings
channel3Min = 0.000;
channel3Max = 85.000;


% Create mask based on chosen histogram thresholds
sliderBW = (I(:,:,1) >= channel1Min ) & (I(:,:,1) <= channel1Max) & ...
    (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
    (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);
BW = sliderBW;

% Initialize output masked image based on input image.
maskedRGBImage = RGB;

% Set background pixels where BW is false to zero.
maskedRGBImage(repmat(~BW,[1 1 3])) = 0;

end