%% Q1.4 Pure Pursuit

% purepursuit = load('purepursuit.mat');
% path = purepursuit.robot_traj;
path = [linspace(0, 1, 50)' linspace(0, 2, 50)';...
    linspace(1, 2, 50)' linspace(2, 0, 50)';...
    linspace(2, 1, 50)' linspace(0, -2, 50)';...
    linspace(1, 0, 50)' linspace(-2, 0, 50)'];
q = [0.2 0 0];
R = 0.3;
speed = 0.5;
dt = 0.15;

figure(1);
qplot(q);hold on;
grid on; box on;
xlim('auto'); ylim('auto');
plot(path(:,1), path(:,2));
for step = 1:150
    vel = controlll(q, R, speed, path)
    q = qupdate(q, vel, dt);
    qplot(q);
end


function qnew = qupdate(q, vel, dt)
% Inputs:
% q is the configuration vector (x, y, theta) in units of metres and radians
% vel is the velocity vector (v, omega)
% dt is the length of the integration timestep in units of seconds
% Return:
% qnew is the new configuration vector vector (x, y, theta) in units of metres and radians at the
% end of the time interval.
V = vel(1);
omega = vel(2);
theta = q(3);
xdot = V*cos(theta);
ydot = V*sin(theta);
thetadot = omega;

qdot = [xdot, ydot, thetadot];
qstep = qdot*dt;
qnew = q+qstep;
end

function qplot(q)
% use plot command to draw the triangle as shown above
% (x,y) position of the robot on the xy-plane
% theta, heading angle of the robot in radians
x = q(1);
y = q(2);
theta = q(3);
xp = [0, -0.2, -0.2, 0];
yp = [0, -0.075, 0.075, 0];
points = [xp; yp; 1 1 1 1];

% Transformation Matrix
T = [ cosd(theta) -sind(theta) x;
      sind(theta)  cosd(theta) y;
    0           0    1 ];
pp = T*points;
% clever plot stuff
plot(pp(1,:), pp(2,:))
end

function vel = controlll(q, R, speed, path)
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
    [M,num] = min(dist);
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
    if (heading_error >  pi)
        heading_error = heading_error - 2*pi;
    end

    if (heading_error < -pi)
        heading_error = heading_error + 2*pi; 
    end
    
    % controlling and clipping values
    W = Kh * heading_error;
    W = min(W, 1);
    W = max(W, -1);
    
    % pursuit or stop sequence
    if dist(end) < 1/100
        vel = [0 0];
    else
        vel = [V W];
    end
    
end



