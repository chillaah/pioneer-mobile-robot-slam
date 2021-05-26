% In Grader, we will load the data for you
% init;
close all; clear; clc
% when developing offline, you need to load one of the data files 
load map1r1.mat


% In Grader, we give you the number of steps. 
% num_steps = get_numsteps();

% When developing offline, the number of steps is the length of the run
% you loaded 
num_steps = length(data);

% In Grader, at t=1 the robot starts at x=0.4060, y=0.1800, theta=0.1244 rad; 
% mu is 3x1
% mu = [0.4060;0.1800;0.1244];
% When developing offline, mu at time t = 1 is the pose from the first time step
mu = [data(1).pose.x; data(1).pose.y ; data(1).pose.theta];

% you can choose sigma at t=1
Sigma = diag([0.1 0.1 5*pi/180]).^2; 

% estimate the pose of the robot at each time step and store it in trj_est 
trj_est = zeros(num_steps,3);

% estimate the position of the beacons and stor it in M_est
% M_est(i,:) = [beacon_id, beacon_x,beacon_y,variance_x,variance_y,covariance_xy]. 
M_est = zeros(5,6);

%The first pose is known
trj_est(1,:) = mu;

% initially
old_ticks = [ 0, 0 ];

R = [ 0.0001^2   0;
      0       0.014 ];
std = 7;
Q = [ 0.042 0;
        0 std^2 ];

for t = 2:num_steps
    % move
    % In Grader, you have to use the function get_encoders(time_step).
    % new_ticks = get_encoders(t);    
    % when working offline, use 
    new_ticks = data(t).encoders;
    
    [d, dth] = get_odom(new_ticks, old_ticks);
    old_ticks = new_ticks;
    
    [mu,Sigma] = predict_step(mu,Sigma,d,dth,R);
    
    % sense
    % In Grader, you get the image using the function get_image(time_step);
    % I = get_image(t);
    % when working offline you use
    I = data(t).image;
    
    Z = updatedSense(I);
    
%     % beacon data ordering
%     dim = 2;
%     point = [];
%     z = zeros(size(M_est,1), dim);
%     if ~isempty(Z)
%         for j = 1:size(Z, 1)
%             for i = 1:size(M_est, 1)
%                 if Z(j) == M_est(i, 1)
%                     point = [ point;
%                                 i   ];
%                 end
%             end
%         end
%     end
    
    if ~isempty(point)
        z(point, :) = Z(:, 2:3);
    end
    
    % z = Z(:, 2:3);
    
    for j = 1:size(z, 1)
        
        if j == 1
            
            [mu, Sigma] = initLandmarks(z,Q,mu,Sigma);
            
        else

            zi = z(j, :);
        
            [mu, Sigma] = update_step(j,zi,Q,mu,Sigma);
        
        end
        
    end
    
    trj_est(t, :) = mu(1:3);
    
end
% write your helper functions below

function [d, dth] = get_odom(new_ticks, old_ticks)

    newLeft = new_ticks(1);
    newRight = new_ticks(2);

    oldLeft = old_ticks(1);
    oldRight = old_ticks(2);

    leftdiff = newLeft - oldLeft;
    rightdiff = newRight - oldRight;
    
    % N - number of ticks per rotation = 370
    % D - robot wheel diameter [m] = 0.065
    % L - robot wheels axis [m] = 0.15 = 2 * R
    left = (2 * pi * 0.065/2 * leftdiff) / 370;

    right = (2 * pi * 0.065/2 * rightdiff) / 370;

    d = (left + right) / 2;

    dth = (right - left) / 0.15;

end

function nextpose = move(pose, d, dth)

    nextpose =  [ pose(1) + d * cos(pose(3));
                  pose(2) + d * sin(pose(3));
                  pose(3) + dth              ];
    
end

function [mu,Sigma] = predict_step(mu,Sigma,d,dth,R)
  
    % function accepts current pose, distance travelled and change in
    % heading angle to output the next pose
    % mu has 13 elements in SLAM
    % decompose
    pose = mu(1:3);
    remainder = mu(4:end);
    mu = [ move(pose, d, dth);
                remainder     ];
    
    % angle
    angle = mu(3);
    
    % Jx is the jacobian w.r.t. to the state variables of the next pose
    JxStep = [ 1 0 -d*sin(angle);
               0 1  d*cos(angle);
               0 0       1       ];
    
    % Ju is the jacobian w.r.t. to the input variables of the next pose
    JuStep = [ cos(angle) 0;
               sin(angle) 0;
                   0      1 ];
    
    % full Jx jacobian for SLAM
    numLand = size(Sigma, 1) - size(pose, 1);
    paddingZeros = zeros(size(JxStep, 1), numLand);
    paddingOnes = eye(numLand);
    JxSLAM = [        JxStep  paddingZeros;
               paddingZeros'   paddingOnes ];
           
   % full Ju jacobian for SLAM
   paddingZeros2 = zeros(numLand, size(JuStep, 2));
   JuSLAM = [        JuStep;
              paddingZeros2 ];
             
    % updating covariance matrix for SLAM
    Sigma = JxSLAM * Sigma * JxSLAM' + JuSLAM * R * JuSLAM'; 
    
end

function [mu, Sigma] = initLandmarks(z,Q,mu,Sigma)

    % looping over landmarks
    iter = size(z, 1);
    for i = 1:iter

        % decompose
        pose = mu(1:3);
        xr = pose(1);
        yr = pose(2);
        thetar = pose(3);

        % range and bearing measurements
        range = z(i, 1);
        bearing = z(i, 2);

        % landmark initialization
        % expanding state vector with map coordinates
        % of new landmark
        totAng = wrapToPi(thetar + bearing);
        xlnew = xr + range * cos(totAng);
        ylnew = yr + range * sin(totAng);
        lnew = [ xlnew;
                 ylnew ];
        mu = [   mu;
               lnew ];

        % jacobian of the landmark initialization 
        % function w.r.t to range and bearing
        Lz = [ cos(totAng) -range * sin(totAng);
               sin(totAng)  range * cos(totAng) ];

        % sensor noise covariance
        LQL = Lz * Q * Lz';

        % padding covariance
        paddingZeros = zeros(size(Sigma, 1), size(lnew, 1));
        Sigma = [         Sigma  paddingZeros;
                  paddingZeros'           LQL ];
    end

end

function [mu, Sigma] = update_step(j,zi,Q,mu,Sigma)
   
    % decompose
    pose = mu(1:3);
    xr = pose(1);
    yr = pose(2);
    thetar = pose(3);
    lands = 2 * j;
    posy = lands + size(pose, 1);
    posx = lands + size(pose, 1) - 1;
    
    % landmark positions
    xl = mu(posx);
    yl = mu(posy);
    
    % range and bearing measurement model
    h = [  sqrt((xr-xl)^2 + (yr-yl)^2);
          atan2(yl-yr, xl-xr) - thetar ];
    h(2) = wrapToPi(h(2));
    r = h(1);
    
    % left G matrix
    Gleft = [  -(xl-xr)/r    -(yl-yr)/r   0;
              (yl-yr)/r^2  -(xl-xr)/r^2  -1 ];
    
    % right G matrix
    Gright = [    (xl-xr)/r    (yl-yr)/r;
               -(yl-yr)/r^2  (xl-xr)/r^2 ];
            
    % G matrix in SLAM
    limitMid = lands - size(pose, 1) + 1;
    limitEnd = limitMid + size(pose, 1);
    paddingZeros = zeros(size(Gleft, 1), size(Sigma, 1) - size(pose, 1)); 
    Gslam = [ Gleft, paddingZeros(:, 1:limitMid), Gright,...
                     paddingZeros(:, limitEnd:end)          ];
    
    % kalman gain
    K = Sigma * Gslam' * (Gslam * Sigma * Gslam' + Q)^-1;
    
    % mean in SLAM
    cal = (zi' - h)';
    cal(2) = wrapToPi(cal(2));
    mu = mu + K * [ cal(1);
                    cal(2) ];
    
    % covariance in SLAM
    I = eye(length(K));
    Sigma = (I - K * Gslam) * Sigma;   
    
end

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

