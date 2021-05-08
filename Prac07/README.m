load map1r1.mat

time_step = 1;

step = data(time_step);

%struct with fields:
%       image: [240×320×3 uint8]
%    encoders: [75 73]
%      beacon: [5×3 double]
%        pose: [1×1 struct]

% the image captured at that step
imshow(step.image)

% step.encoders is [left_ticks right_ticks]
% number of ticks per rotation is 370.
% Robot's wheel diameter 0.065 [m]
% Robot wheels axis 0.15 [m]
tickscount =  step.encoders;

% step.beacon is a 5x3
% the first column is the ID
% the second column is the range to the beacon in meters
% the third column is the bearing to the beacon in radians
% % Note: you are given the range and bearing of all the beacons even if they are not in the image.
oracl_id_range_bearing = step.beacon;


% step.pose is [x  y theta] the pose of the robot at that timestep. 
% x y  are in meters and theta is in radians
oracle_pose = step.pose;


