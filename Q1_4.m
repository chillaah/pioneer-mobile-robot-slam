%% Q1.4

function vel = control(q, R, speed, path)
% Inputs:
%  q is a 1x3 vector giving the current configuration of the robot in units of metres and radians
%  R is the pure pursuit following distance
%  speed is the forward speed of the vehicle
%  path is an Nx2 matrix containing the path as a set of waypoints, columns are x- and y-coordinates respectively.
% Return:
%  vel is a 1x2 vector containing the requested velocity and turn rate of the robot [v, omega]

% clever stuff

pos_x = q(1);
pos_y = q(2);
pos_theta = q(3);



vel = [V W];

end