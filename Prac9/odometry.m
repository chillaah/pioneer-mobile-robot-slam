load map1r1.mat 

num_steps = length(data);
odom_traj = zeros(3,num_steps);

for t=1:num_steps
    if (t == 1)
        old_ticks = data(t).encoders;
        odom_pose = [0 0 0]';        
    else
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



end

function next_pose = move(current_pose, d , dth)


end

% NOT REQUIRED IN GRADER     
function plot_robot(r)
 

end