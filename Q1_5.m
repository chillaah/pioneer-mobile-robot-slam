%% Q1.5
close all; clear; clc

car_l = 4;
car_w = 1.7;
wbl = 3;
steeringAngle = 15;

RB = wbl/steeringAngle;
LB = RB - car_w;

V = -0.7;
W = (V/wbl)*tand(steeringAngle);
vel = [V W];

% figure();
% rectangle('Position', [5 5 1.7 4]);
% xlim([0 10]);
% ylim([0 10]);
% hold on
% grid on
% box on

dt = 0.05;
t = 0:dt:5;

pose = zeros(length(t)-1, 3);

q = [0 0 0];
for i = 1:length(t)-1
    q = qupdate(q, vel, dt);
    pose(i,:) = [q(1) q(2) q(3)];
end

%% 
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
    qextra = dt * qd;
    qnew = q + qextra;
    
    theta = qnew(3);
    
    while theta >  pi
        theta = theta - 2*pi;
    end

    while theta < -pi
        theta = theta + 2*pi; 
    end
    
    qnew(3) = theta;
    
end

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
