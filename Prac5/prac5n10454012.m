% Make sure to name your function correctly; otherwise, the automatic marking script will not assign you the mark. 
% For example, if your student number is n12345678 and this is a solution for Prac 2, 
% then you should name this function prac2n12345678

function prac5n10454012(robot)
	% The function needs to start with the following call; 
	%otherwise, your code will not run during automarking.
	robot.powerON();
    
    t = linspace(0, 2*pi, 1000);
    x = zeros(size(t));
    y = zeros(size(t));
    for i = 1:length(t)
        
        % parametric equations
        x(i) = 1.8 * cos(t(i)) ./ (sin(t(i)).^2 + 1);
        y(i) = 3 * cos(t(i)) .* sin(t(i)) ./ (sin(t(i)).^2 + 1);
    end
    
    % path and way-points
    path = [x', y'];
    
    p = [    1.8,  0;
          0.8485,  1;
         -0.8485, -1;
            -1.8,  0;
         -0.8485,  1;
          0.8485, -1];
    
    % goal is to approach a point closer to the first way-point
    % so that robot is stable and doesn't overshoot
    goal_x = p(6,1);
    goal_y = p(6,2);
    GOAL = [goal_x goal_y];
    
    R = 0.4;
    speed = 0.8;
 
    while (true)
        
        % heading towards point
        [pos_x, pos_y, pos_theta] = robot.getTruePose();
        q = [pos_x pos_y pos_theta];
        
        [lWv, rWv] = drivePoint(q, GOAL);
        
        robot.setMotorVel(lWv, rWv);
        
        tol_x = abs(goal_x - pos_x);
        tol_y = abs(goal_y - pos_y);

        tol = hypot(tol_x, tol_y);
        
        % while within range of goal
        if tol < 1 
            tic
            
            % pure pursuit
            while (toc < 25)
                
                [x, y, theta] = robot.getTruePose();
                q = [x y theta];

                vel = control(q, R, speed, path);

                [lWv, rWv] = VtoWheels(vel(1), vel(2));

                robot.setMotorVel(lWv, rWv);
            end
            
            % robot stops 1,2 or 3 way-points after completing the track
            % but it still completes the task within the given time
            robot.setMotorVel(0,0);
            break
        end
        
    end

	%The function needs to end with the following calls; 
	%otherwise, your code will not run during automarking.
	pause(3)
	robot.powerOFF();
	disp("**********END************");
end    


function vel = control(q, R, speed, path)

    Kv = 1;
    Kh = 5;
    
    pos_x = q(1);
    pos_y = q(2);
    pos_theta = q(3);
    pos = [pos_x pos_y];

    diff = path - pos;
    diff_x = diff(:,1);
    diff_y = diff(:,2);
    dist = hypot(diff_x, diff_y);

    [~,num] = min(dist);
    dist_row = num + 1;
    condition = dist(dist_row:end, 1) >= R; num = num - 1;
    logic = find(condition);
    count = length(logic);
    
    while (count == 0)
        locs = path(end, :);
        break
    end
    
    while (count ~= 0)
        path_x = logic(1) + num;
        locs = path(path_x, :);
        break
    end

    V = Kv * speed;
    
    goal_x = locs(1); goal_y = locs(2);
    goal_theta = atan2(goal_y - pos_y, goal_x - pos_x);
    heading_error = goal_theta - pos_theta;
    heading = wrapToPi(heading_error);
    
    W = Kh * heading;
    W = min(W, 1.2);
    W = max(W, -1.2);
    
    if dist(end) < 1/100
        vel = [0 0];
    else
        vel = [V W];
    end
    
end

function [lWv, rWv] = drivePoint(q, GOAL)

    Kh = 0.8;
    Kv = 0.4; 

    pos_x = q(1); pos_y = q(2); pos_theta = q(3);
    goal_x = GOAL(1); goal_y = GOAL(2);

    goal_theta = atan2(goal_y - pos_y, goal_x - pos_x);
    heading_error = goal_theta - pos_theta;

    heading = wrapToPi(heading_error);
    
    W = Kh * heading;
    W = min(W, 0.6);
    W = max(W, -0.6);
    
    pos_error = hypot(goal_x - pos_x, goal_y - pos_y);
    V = Kv * pos_error;
    V = min(V, 0.5);
    
    [lWv, rWv] = VtoWheels(V, W);
    
end

function [lWv, rWv] = VtoWheels(V, W)

    radiusWheel = 0.0975;
    robotAxleLength = 0.331;

    lWv = (2*V - W*robotAxleLength)/(2*radiusWheel);
    rWv = (2*V + W*robotAxleLength)/(2*radiusWheel);

end
