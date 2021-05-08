load map2r3.mat

N = 370; % number of ticks per rotation
D = 0.065; % robot wheel diameter [m]
L = 0.15; % robot wheels axis [m]

num_steps = length(data);
odom_traj = zeros(3,num_steps);

for t=1:num_steps
    if (t == 1)
        old_ticks = data(t).encoders;
        odom_pose = [0 0 0]';        
    else
        % odomTestData(t).encoders is [left_ticks right_ticks]
        new_ticks = data(t).encoders;
        [d , dth] = get_odom(new_ticks,old_ticks);        
        odom_pose = move(odom_pose,d,dth);
        old_ticks = new_ticks;
    end
    odom_traj(:,t) = odom_pose;
end

% NOT REQUIRED IN GRADER
figure();
hold on
grid on
box on

for t=1:num_steps
    
    r = odom_traj(:,t);
    plotTraj(r(1), r(2), r(3));
    pause(0.01);
    
end
hold off

function [d , dth] = get_odom(new_ticks, old_ticks)
%inputs: new_ticks , old_ticks both are 1x2 vectors [left_ticks right_ticks]
%outputs: d  distance traveled in meters
%        dt angle rotated in radians 

    newLeft = new_ticks(1);
    newRight = new_ticks(2);

    oldLeft = old_ticks(1);
    oldRight = old_ticks(2);

    leftdiff = newLeft - oldLeft;
    rightdiff = newRight - oldRight;

    left = (2 * pi * 0.065/2 * leftdiff) / 370;

    right = (2 * pi * 0.065/2 * rightdiff) / 370;

    d = (left + right)  / 2;

    dth = (right - left) / 0.15; % assuming L is 2r

end

function next_pose = move(current_pose, d, dth)
%inputs: current_pose is a 3x1 vector [x; y; theta] of the robot (theta in radians)
%        d  distance traveled in meters
%        dt angle rotated in radians 
%outputs: next_pose is a 3x1 vector [x; y; theta] of the robot (theta in radians)

    currx = current_pose(1);
    curry = current_pose(2);
    currtheta = current_pose(3);

    movedx = d * cos(currtheta);
    movedy = d * sin(currtheta);
    movedtheta = dth;

    nextx = currx + movedx;
    nexty = curry + movedy;
    nexttheta = currtheta + movedtheta;

    next_pose = [nextx; nexty; nexttheta];

end