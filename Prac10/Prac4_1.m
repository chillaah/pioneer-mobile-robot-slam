% In Grader, we will load the data for you
% init;
close all; clear; clc
% when developing offline, you need to load one of the data files 
load map1r1.mat

% In Grader, we give you the map
% M is the map with size 5x3 where M(i,:) = [beacon_id, x, y]
% M = get_map();

% When developing and testing offline, you need to choose the correct map
% that matches your data.
% Map 1
M = [
    30, 0.316, 1.856;
    27, 1.716, 1.74;
    57, 0.272, 0.708;
    45, 0.944, 0.18;
    39, 1.788, 0.216;
    ];

% Map 2
% M = [
%     39, 0.968, 1.792;
%     30, 0.252, 1.336;
%     57, 0.264, 0.364;
%     27, 1.604, 0.208;
%     45, 1.832, 1.384;
%     ];

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
Sigma = diag([0.01 0.01 10*pi/180]).^2; 

% estimate the pose of the robot at each time step and store it in trj_est 
trj_est = zeros(num_steps,3);

%The first pose is known
trj_est(1,:) = mu;

% initially
old_ticks = 0;
xt = mu;
S = Sigma;
map = M(:,2:3);
sigmaV = 3;        
R = [ 0.0001     0  ;
       0     0.0027];
std = 35^2;
Q = [ std     0;
          0 std*27];
      
figure();
hold on
grid on
box on

for t =2:num_steps
    % move
    % In Grader, you have to use the function get_encoders(time_step).
    % new_ticks = get_encoders(t);    
    % when working offline, use 
    new_ticks = data(t).encoders;
    
    old_ticks = data(t-1).encoders;
    [d, dth] = get_odom(new_ticks, old_ticks);
    % old_ticks = new_ticks;
    
    [xt,S] = predict_step(xt,S,d,dth,R);
    
    % sense
    % In Grader, you get the image using the function get_image(time_step);
    % I = get_image(t);
    % when working offline you use
    I = data(t).image;
    
    Z = sense(I);
    
    if isempty(Z)
        continue;
    end
        z = Z(:,2:3); % without beacon ID
    
    [x,S] = update_step(map,z,xt,S,Q);
    
    trj_est(t, :) = x';
    
    plotTraj(trj_est(t,1), trj_est(t,2), trj_est(t,3))
    
end
% write your helper functions below

function [xt,S] = predict_step(xt,S,d,dth,R)
    
    % function accepts current pose, distance travelled and change in
    % heading angle to output the next pose
    [xt, theta] = move(xt, d, dth);
    
    % Jx is the jacobian w.r.t. to the state variables of the next pose
    Jx = [ 1 0 -d*sin(theta);
           0 1  d*cos(theta);
           0 0       1       ];
    
    % Ju is the jacobian w.r.t. to the input variables of the next pose
    Ju = [ cos(theta) 0;
           sin(theta) 0;
               0      1 ];
    
    % updating covariance matrix
    S = Jx*S*Jx' + Ju*R*Ju';
    
end

function [x,S] = update_step(map,z,x,S,Q)

    % looping over all landmarks for each beacon
    for i = 1:size(z, 1)

        % landmark locations
        xl = map(i, 1);
        yl = map(i, 2);

        % range and bearing
        r = z(i, 1);
        % b = z(:, 2);

        % robot pose
        xr = x(1);
        yr = x(2);
        thetar = x(3);

        % G matrix
        G = [  -(xl-xr)/r    -(yl-yr)/r   0;
              (yl-yr)/r^2  -(xl-xr)/r^2  -1 ];

        % kalman gain
        K = S * G' * (G * S * G' + Q)^-1;

        % range and bearing measurement model
        h = [  sqrt((xr-xl)^2 + (yr-yl)^2);
              atan2(yl-yr, xl-xr) - thetar ]';
        h(2) = wrapToPi(h(2));

        % mean of the robot
        cal = (z(i, :) - h)';
        cal(2) = wrapToPi(cal(2));
        x = x + K * cal;
        x = [      x(1); 
                   x(2); 
              wrapToPi(x(3)) ];

        % covariance of the robot
        I = eye(length(K));
        S = (I - K * G) * S;

    end
     
end

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

function [next_pose, theta] = move(current_pose, d, dth)

    currx = current_pose(1);
    curry = current_pose(2);
    currtheta = current_pose(3);

    movedx = d * cos(currtheta);
    movedy = d * sin(currtheta);
    movedtheta = dth;
    
    nextx = currx + movedx;
    nexty = curry + movedy;
    nexttheta = wrapToPi(currtheta + movedtheta);

    next_pose = [nextx; nexty; nexttheta];
    theta = currtheta;
    
end

function Z = sense(I)
% input: I is an RGB image of the robot's view
% output: Z = nx3 where Z(i,:) = [id range bearing] (bearing should be in degrees)


    % filtering number of beacons
    [r, ~] = hsvRed2(I);
    fe = strel('disk', 3);
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

function [BW,maskedRGBImage] = hsvBlue(RGB)
%createMask  Threshold RGB image using auto-generated code from colorThresholder app.
%  [BW,MASKEDRGBIMAGE] = createMask(RGB) thresholds image RGB using
%  auto-generated code from the colorThresholder app. The colorspace and
%  range for each channel of the colorspace were set within the app. The
%  segmentation mask is returned in BW, and a composite of the mask and
%  original RGB images is returned in maskedRGBImage.

% Auto-generated by colorThresholder app on 30-Apr-2021
%------------------------------------------------------


% Convert RGB image to chosen color space
I = rgb2hsv(RGB);

% Define thresholds for channel 1 based on histogram settings
channel1Min = 0.562;
channel1Max = 0.608;

% Define thresholds for channel 2 based on histogram settings
channel2Min = 0.672;
channel2Max = 0.904;

% Define thresholds for channel 3 based on histogram settings
channel3Min = 0.253;
channel3Max = 0.626;

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

function [BW,maskedRGBImage] = hsvRed2(RGB)
%createMask  Threshold RGB image using auto-generated code from colorThresholder app.
%  [BW,MASKEDRGBIMAGE] = createMask(RGB) thresholds image RGB using
%  auto-generated code from the colorThresholder app. The colorspace and
%  range for each channel of the colorspace were set within the app. The
%  segmentation mask is returned in BW, and a composite of the mask and
%  original RGB images is returned in maskedRGBImage.

% Auto-generated by colorThresholder app on 30-Apr-2021
%------------------------------------------------------


% Convert RGB image to chosen color space
I = rgb2hsv(RGB);

% Define thresholds for channel 1 based on histogram settings
channel1Min = 0.680;
channel1Max = 0.152;

% Define thresholds for channel 2 based on histogram settings
channel2Min = 0.586;
channel2Max = 1.000;

% Define thresholds for channel 3 based on histogram settings
channel3Min = 0.268;
channel3Max = 0.601;

% Create mask based on chosen histogram thresholds
sliderBW = ( (I(:,:,1) >= channel1Min) | (I(:,:,1) <= channel1Max) ) & ...
    (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
    (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);
BW = sliderBW;

% Initialize output masked image based on input image.
maskedRGBImage = RGB;

% Set background pixels where BW is false to zero.
maskedRGBImage(repmat(~BW,[1 1 3])) = 0;

end

function [BW,maskedRGBImage] = hsvYellow(RGB)
%createMask  Threshold RGB image using auto-generated code from colorThresholder app.
%  [BW,MASKEDRGBIMAGE] = createMask(RGB) thresholds image RGB using
%  auto-generated code from the colorThresholder app. The colorspace and
%  range for each channel of the colorspace were set within the app. The
%  segmentation mask is returned in BW, and a composite of the mask and
%  original RGB images is returned in maskedRGBImage.

% Auto-generated by colorThresholder app on 29-Apr-2021
%------------------------------------------------------


% Convert RGB image to chosen color space
I = rgb2hsv(RGB);

% Define thresholds for channel 1 based on histogram settings
channel1Min = 0.095;
channel1Max = 0.222;

% Define thresholds for channel 2 based on histogram settings
channel2Min = 0.793;
channel2Max = 1.000;

% Define thresholds for channel 3 based on histogram settings
channel3Min = 0.338;
channel3Max = 0.712;

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

function plotTraj(x, y, theta)

    % lines
    linex = [ 0.1;
                0;
                1 ];

    liney = [    0;
               0.1;
                 1 ];

    % rotational matrix
    rot = [ cos(theta) -sin(theta) x;
            sin(theta)  cos(theta) y;
                     0           0 1 ];

    % new position
    transx = rot * linex;
    transy = rot * liney;

    % new position plot
    plotx = [transy(1), x, transx(1)];
    ploty = [transy(2), y, transx(2)];

    % plot
    % plot(plotx(1:2), ploty(1:2), 'bo');
    plot(plotx(2:3), ploty(2:3), 'ko');

end
