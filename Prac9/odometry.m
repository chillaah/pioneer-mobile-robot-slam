load map1r1.mat 

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
for t=1:num_steps
    plot_robot(odom_traj(:,t));
    pause(0.1);
end

function [d , dth] = get_odom(new_ticks,old_ticks)
%inputs: new_ticks , old_ticks both are 1x2 vectors [left_ticks right_ticks]
%outputs: d  distance traveled in meters
%        dt angle rotated in radians 



end

function next_pose = move(current_pose, d , dth)
%inputs: current_pose is a 3x1 vector [x; y; theta] of the robot (theta in radians)
%        d  distance traveled in meters
%        dt angle rotated in radians 
%outputs: next_pose is a 3x1 vector [x; y; theta] of the robot (theta in radians)


end

% NOT REQUIRED IN GRADER     
function plot_robot(r)
 

end