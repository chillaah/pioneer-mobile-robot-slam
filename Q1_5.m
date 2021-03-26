%% Q1.5
close all; clear; clc

% info
car_l = 4;
car_w = 1.7;
wbl = 3;
steeringAngle = 15;

V = -0.7;
W = (V/wbl)*tand(steeringAngle);
vel = [V W];

% car position coordinates (origin @ mid rear axle)
car_pos = [  3.5  0.85;
             3.5 -0.85;
            -0.5 -0.85;
            -0.5  0.85;
             3.5  0.85 ];
         
car_pos = [car_pos.'; 1 1 1 1 1];         

dt = 0.05;
t = 0:dt:5;

% initial pose of robot
pose = zeros(length(t)-1, 3);
pose(1,:) = [0 0 0];
q = [0 0 0];
pose(2,:) = qupdate(q, vel, dt);

% iterating over poses using previous pose
for i = 3:length(t)   
    pose(i,:) = qupdate(pose(i-1,:), vel, dt);
end

pointx = zeros(length(t), length(car_pos));
pointy = zeros(length(t), length(car_pos));

% pose coordinate location
for i = 1:length(t)
    H = [ cos(pose(i,3)) -sin(pose(i,3)) pose(i,1);
          sin(pose(i,3))  cos(pose(i,3)) pose(i,2);
                       0                0         1 ];
                    
    coordinates = H * car_pos;
    
    pointx(i,:) = coordinates(1,:);
    pointy(i,:) = coordinates(2,:);
end

% plot
figure();
hold on
grid on
box on
plot(pointx(1,:), pointy(1,:), 'Tag', 'Car');
plot(pointx(:,4), pointy(:,4), 'Tag', 'Left');
plot(pointx(:,3), pointy(:,3), 'Tag', 'Right');
linex = [pointx((1+dt)/dt,3), pointx((1+dt)/dt,4)];
liney = [pointy((1+dt)/dt,3), pointy((1+dt)/dt,4)];
plot(linex, liney, 'Tag', '1Second');
hold off
 
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
