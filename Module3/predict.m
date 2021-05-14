function robot_belief_after_motion = predict(robot_belief_before_motion,U)
% inputs: robot_belief_before_motion is the probability distribution of the robot's location over the cells
%       : U is the motion probability [p(C2|C1,U=1), P(C1|C1,U=1)]
% output: robot_belief_after_motion is the probability distribution of the robot's location over the cells after executing the motions

    before = robot_belief_before_motion;
    len = length(before);
    point = size(1,len);

    for j = 1:len

        pr = U(2) * before(j);
        
        if j == 1
            point(j) = U(1) * before(end) + pr;
        else
            point(j) = U(1) * before(j - 1) + pr;

            if j == len
                robot_belief_after_motion = point;
            end
        end
    end

end