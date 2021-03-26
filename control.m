%% Q1.4 Pure Pursuit
close all; clear; clc

path = [linspace(0, 1, 50)' linspace(0, 2, 50)'; ...
    linspace(1, 2, 50)' linspace(2, 0, 50)'; ...
    linspace(2, 1, 50)' linspace(0, -2, 50)'; ...
    linspace(1, 0, 50)' linspace(-2, 0, 50)']; 
q = [0.2 0 0];
R = 0.3;
speed = 0.5;
dt = 0.15;

figure(1);
qplot(q);hold on;
grid on; box on
xlim('auto');
ylim('auto');
plot(path(:,1), path(:,2));
for step = 1:150
    vel = controlll(q, R, speed, path);
    q = qupdate(q, vel, dt);
    qplot(q);
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

% qupdate function
function qnew = qupdate(q, vel, dt)
    % Inputs:
    % q is the configuration vector (x, y, theta) in units of metres and radians
    % vel is the velocity vector (v, omega)
    % dt is the length of the integration timestep in units of seconds
    % Return:
    % qnew is the new configuration vector vector (x, y, theta) in units of metres and radians at the
    % end of the time interval.
    
    % qdot
    qd = qdot(q, vel);
    
    % end of time
    qint = dt * qd;
    qnew = q + qint;
    
    theta = qnew(3);
    
    if (theta >  pi)
        theta = theta - 2*pi;
    end

    if (theta < -pi)
        theta = theta + 2*pi; 
    end
    
    qnew(3) = theta;
    
end

% qdot function
function qd = qdot(q, vel)
    % Inputs:
    % q is the configuration vector (x, y, theta) in units of metres and radians
    % vel is the velocity vector (v, omega)
    % Return:
    % qd is the vector (xdot, ydot, thetadot) in units of metres/s and radians/s
    
    V = vel(1);
    W = vel(2);
    theta = q(3);
    
    x_dot = V * cos(theta);
    y_dot = V * sin(theta);
    theta_dot = W;
    
    qd = [x_dot y_dot theta_dot];
    
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

%     Kh = 0.8;
%     Kv = 0.4;
% 
%     for i=1:length(path)
% 
%         [x, y, theta] = robot.getTruePose();
%         pos_x = x; pos_y = y; pos_theta = theta;
% 
%         goal_x = path(i,1); goal_y = path(i,2);
% 
%         goal_theta = atan2(goal_y - pos_y, goal_x - pos_x);
%         heading_error = goal_theta - pos_theta;
% 
%         while heading_error >  pi
%             heading_error = heading_error - 2*pi;
%         end
% 
%         while heading_error < -pi
%             heading_error = heading_error + 2*pi; 
%         end
% 
%         W = Kh * heading_error;
%         W = min(W, 1);
%         W = max(W, -1);
% 
%         pos_error = sqrt((goal_x - pos_x)^2 + (goal_y - pos_y)^2);
%         V = Kv * pos_error;
%         V = min(V, 0.3);
% 
%         if V > speed
%             V = speed;
%         end
% 
%         vel = [V W];
% 
%     end

% Initialization
goal_x = path(:,1);
goal_y = path(:,2);

pos_x = q(1);
pos_y = q(2);

% first find if the car is in the path:
Lia = ismember(path,[pos_x pos_y],'row');
counter=find(Lia==1);

% find the closest distance:
distances = sqrt((goal_x-pos_x).^ 2 + (goal_y-pos_y).^ 2);
[~, location] = min(distances);
final_x = goal_x(location);
final_y = goal_y(location);


% find the closest point within 0.3m radius:
D=sqrt((goal_x-final_x).^2+(goal_y-final_y).^2)-R;
filter=find((D<=R));

if(counter~=0)
    idx=find(filter<counter);
    filter(idx)=[];
end

% find the location
DIFF=diff(filter);

% find the location
if all(DIFF==1)==1
    L = filter(end);
    counter=L;
elseif all(DIFF==1)==0
    L = find(DIFF>1);
    L=filter(L);
    counter=L;
end
final_x=goal_x(L);
final_y=goal_y(L);


xg=final_x;
yg=final_y;


% vel
x=q(1); y=q(2); theta=q(3);
theta_g = atan2((yg-y),(xg-x));

gamma = angdiff(theta,(theta_g));
w=gamma;

%condtion for clipping speed
if speed<-0.5
    speed=-0.5;
elseif speed>0.5
    speed=0.5;
end
%condtion for clipping W
if w<-1
    w=-1;
elseif w>1
    w=1;
end

v=speed;
vel=[v,w];


end

