% Make sure to name your function correctly; otherwise, the automatic marking script will not assign you the mark. 
% For example, if your student number is n12345678 and this is a solution for Prac 2, 
% then you should name this function prac2n12345678

function prac6n10454012(robot)
	% The function needs to start with the following call; 
	%otherwise, your code will not run during automarking.
	robot.powerON();
    
    img = robot.getArenaImage();
    pause(0.1)
    
    % changing boundry color to obstacle color
    for i = 1:size(img,1)
        for j = 1:size(img,2)
            for k = 1:3
                if img(i,j,k) == 0
                    img(i,j,k) = 188;
                end
            end
        end
    end
    
    % vision
    maskedImg = mask(img);
    se = strel('disk', 11);
    map = imdilate(maskedImg, se);
    % idisp(map);
    
    % scaling, path planning and unscaling
    scale = 128/5; % pixels/meter
    [x, y] = robot.getTruePose();
    start = round([x+2.5, 2.5-y] * scale);
    goal = round([0.5, 0.5] * scale);
    path = findPath(map, start, goal);
    path = path/scale;
    path = [path(:,1)-2.5, 2.5-path(:,2)];
    
    R = 0.65;
    speed = 0.7;
    
    while (true)
        
        % pure pursuit
        [x, y, theta] = robot.getTruePose();
        q = [x, y, theta];
        vel = control(q, R, speed, path);
        [lWv, rWv] = VtoWheels(vel(1), vel(2));
        robot.setMotorVel(lWv, rWv);
        cond = hypot((x+2.5)-goal(1)/scale, (2.5-y)-goal(2)/scale);
        
        % stopping
        if (cond < 5/100)
            robot.setMotorVel(0, 0);
            pause(0.1)
            break;
        end
    end

	%The function needs to end with the following calls; 
	%otherwise, your code will not run during automarking.
	pause(3)
	robot.powerOFF();
	disp("**********END************");
end    

function [BW,maskedRGBImage] = mask(RGB)

    % Convert RGB image to chosen color space
    I = rgb2hsv(RGB);

    % Define thresholds for channel 1 based on histogram settings
    channel1Min = 0.000;
    channel1Max = 0.156;

    % Define thresholds for channel 2 based on histogram settings
    channel2Min = 0.000;
    channel2Max = 0.283;

    % Define thresholds for channel 3 based on histogram settings
    channel3Min = 0.657;
    channel3Max = 1.000;

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

function path = findPath(map, start, goal)
    
    % distance transform
    dtransform = distanceTransform(map, goal);
    
    % goal
    goalx = goal(1); goaly = goal(2);
    
    % begin at start coordinates
    path(1,:) = start;
    i = 2;
    
    % loop until goal is reached
    while (true)
        
        % creating 3x3 window around current cell
        lastx = path(end, 1);
        lasty = path(end, 2);
        M = window(dtransform, lastx, lasty);
        
        % getting new coordinate change
        change = minval(M);
        changex = change(1);
        changey = change(2);
        
        % updating to next coordinates
        nextx = lastx + changex;
        nexty = lasty + changey;
        path(i,:) = [nextx, nexty];
        
        % if goal has been reached
        if (path(end,1) == goalx && path(end,2) == goaly)
            break;
        else
            i = i + 1;
        end
        
    end
end

function dtransform = distanceTransform(map, goal)
    
    % initializing
    mapx = size(map,1); mapy = size(map,2);
    goalx = goal(1); goaly = goal(2);
    dtransform = zeros(mapx,mapy);
    
    % assigning inf and NaN values according to map
    for n = 1:mapx
        for m = 1:mapy
            
            if map(n,m) == 1
                dtransform(n,m) = NaN;
            else
                dtransform(n,m) = inf;
            end
        end
    end
    
    % goal
    dtransform(goaly,goalx) = 0;
    
    % compare with cityblock matrix
    manhattan = [inf, 1, inf;
                  1,  0,  1;
                 inf, 1, inf];
    
    % looping to assign distance values
    cellsTotal = sum((dtransform == inf), 'all') + 1;
    
    while (true)
        
        % cell check
        cellsNotFilled = sum((dtransform == inf), 'all');
        
        if (cellsNotFilled >= cellsTotal)
            break;
        else
            cellsTotal = cellsNotFilled;
        end
        
        % iterating and updating cells with window
        for i = 1:mapy
            for j = 1:mapx
                
                if isnan(dtransform(j, i))
                    continue;
                else
                    W = window(dtransform, i, j);
                    
                    C = W + manhattan;
                
                    dtransform(j, i) = min(C, [], 'all');
                end
            end
        end
    end
end

function next = minval(M)
    
   % manhattan filtering
   M(1,1) = NaN; M(1,3) = NaN;
   M(3,1) = NaN; M(3,3) = NaN;
   
   % minimum number coordinates
   minNum = min(M,[],'all');
   [posy,posx] = find(M == minNum);
   
   % center coordinates
   mid = M(2,2);
   [ceny,cenx] = find(M == mid);
   
   % coordinate difference of set [-1 0 1]
   next = [posx-cenx, posy-ceny];
   
   % if there are many, since distances are the same, pick the 2nd one
   if size(next,1) >= 2; next = next(2,:); end
   
end

function M = window(A, x, y)
    
    % top and bottom NaN row boundry
    A2 = [NaN(1,size(A,2));
                 A
          NaN(1,size(A,2))];
    
    % right and left NaN column boundry
    A3 = [NaN(1,size(A2,1))' A2 NaN(1,size(A2,1))'];
    
    % change due to NaN boundries
    M = [   A3(y,x)   A3(y,x+1)   A3(y,x+2)
          A3(y+1,x) A3(y+1,x+1) A3(y+1,x+2)
          A3(y+2,x) A3(y+2,x+1) A3(y+2,x+2)];
end

function vel = control(q, R, speed, path)

    % gain constants
    Kv = 1;
    Kh = 2;
    
    % initializing
    pos_x = q(1);
    pos_y = q(2);
    pos_theta = q(3);
    pos = [pos_x pos_y];

    % minimum distance calculation
    diff = path - pos;
    diff_x = diff(:,1);
    diff_y = diff(:,2);
    dist = hypot(diff_x, diff_y);

    % finding path
    [~,num] = min(dist);
    dist_row = num + 1;
    condition = dist(dist_row:end, 1) >= R; num = num - 1;
    logic = find(condition);
    count = length(logic);
    
    % condition not met
    while (count == 0)
        locs = path(end, :);
        break
    end
    
    % condition met
    while (count ~= 0)
        path_x = logic(1) + num;
        locs = path(path_x, :);
        break
    end

    % calculating V and W
    V = Kv * speed; % constant
    
    % heading error to goal
    goal_x = locs(1); goal_y = locs(2);
    goal_theta = atan2(goal_y - pos_y, goal_x - pos_x);
    heading_error = goal_theta - pos_theta;
    
    % wrapping between [-180 180]
    heading = wrapToPi(heading_error);
    
    % controlling and clipping values
    W = Kh * heading;
    W = min(W, 3);
    W = max(W, -3);
    
    % pursuit or stop sequence
    if dist(end) < 1/100
        vel = [0 0];
    else
        vel = [V W];
    end
    
end

function [lWv, rWv] = VtoWheels(V, W)
    
    % radius of wheel [m]
    radiusWheel = 0.0975;
    
    % axle length [m]
    robotAxleLength = 0.331;
    
    % left wheel speed [rad/s]
    lWv = (2*V - W*robotAxleLength)/(2*radiusWheel);
    
    % right wheel speed [rad/s]
    rWv = (2*V + W*robotAxleLength)/(2*radiusWheel);
    
end
