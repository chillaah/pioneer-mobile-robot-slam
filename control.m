function vel = control(q, R, speed, path)
% Inputs:
%  q is a 1x3 vector giving the current configuration of the robot in units of metres and radians
%  R is the pure pursuit following distance
%  speed is the forward speed of the vehicle
%  path is an Nx2 matrix containing the path as a set of waypoints, columns are x- and y-coordinates respectively.
% Return:
%  vel is a 1x2 vector containing the requested velocity and turn rate of the robot [v, omega]

    % clever stuff

    % gain constants
    Kv = 1;
    Kh = 5;
    
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
    W = min(W, 1.2);
    W = max(W, -1.2);
    
    % pursuit or stop sequence
    if dist(end) < 1/100
        vel = [0 0];
    else
        vel = [V W];
    end
    
end


