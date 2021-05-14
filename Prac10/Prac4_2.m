% In Grader, we will load the data for you
% init;

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
Sigma = diag([0.01 0.01 10*pi/180]).^2; 

% estimate the pose of the robot at each time step and store it in trj_est 
trj_est = zeros(num_steps,3);

% estimate the position of the beacons and stor it in M_est
% M_est(i,:) = [beacon_id, beacon_x,beacon_y,variance_x,variance_y,covariance_xy]. 
M_est = zeros(5,6);

%The first pose is known
trj_est(1,:) = mu;

for t =2:num_steps
    % move
    % In Grader, you have to use the function get_encoders(time_step).
    % new_ticks = get_encoders(t);    
    % when working offline, use 
    new_ticks = data(t).encoders;
    
    % sense
    % In Grader, you get the image using the function get_image(time_step);
    % I = get_image(t);
    % when working offline you use
    I = data(t).image;
    
end
% write your helper functions below