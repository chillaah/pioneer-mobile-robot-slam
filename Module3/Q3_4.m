% measurements probabilities = [p(z=1|sign) , p(z=1|no_sign)]
measur_prob = [0.65,0.1];
% U: the motion probability [p(C2|C1,U=1), P(C1|C1,U=1)]
U = [0.9 0.1];
% signs_map : the map of where the signs are in the grid
signs_map = [0 , 1 , 0 , 0 , 1 , 0 , 0 , 0 , 0 , 0];
prior_belief   =  ones(1,length(signs_map) ) ./ length(signs_map);

for t=1:15
    % at each time step, the robot is commanded to move one cell forward
    % update the robot's belief about its location after motion
    robot_belief_after_motion = predict(prior_belief, U);
    
    % after motion, the robot sense the sign
    % z is the sign detector output. 1 sign, 0 no_sign
    z = sense_sign(t);
    % update the robot's belief about its location after sensing
    
    posterior_belief = update(robot_belief_after_motion,signs_map,measur_prob,z)';
    prior_belief = posterior_belief;
    
end

for c =1:length(posterior_belief)
    fprintf('The probability that the robot is in cell %d is %0.2f%s\n',c,posterior_belief(c)*100,'%')
end

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

function posterior_belief = update(robot_belief_after_motion,signs_map,measur_prob,z)
% signs_map : the map of where the signs are in the grid
% measur_prob: measurements probabilities = [p(z=1|sign) , p(z=1|no_sign)] 
% z is the detector output. 1 sign, 0 no_sign

    if z == 0
        measur_prob = [1 - measur_prob(1), 1 - measur_prob(2)];
    end
    
    likelihood = 0;
    len = length(signs_map);
    prior = zeros(len, 1);
    
    for i = 1:len
        
        if signs_map(i) == 1
            prior(i) = robot_belief_after_motion(i) * measur_prob(1);
        else
            prior(i) = robot_belief_after_motion(i) * measur_prob(2);
        end
        likelihood = likelihood + prior(i);
    end
    
    likelihood = 1/likelihood;
    posterior_belief = likelihood * prior;

end
