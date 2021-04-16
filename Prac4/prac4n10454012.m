% Make sure to name your function correctly; otherwise, the automatic marking script will not assign you the mark. 
% For example, if your student number is n12345678 and this is a solution for Prac 2, 
% then you should name this function prac2n12345678

function prac4n10454012(robot)
	% The function needs to start with the following call; 
	%otherwise, your code will not run during automarking.
	robot.powerON();
    
    [pos_x, pos_y] = robot.getTruePose();
    
    % line equation
    % -x -y = 0 in ax+ by + c = 0
    a = -1; b = -1; c = 0;
    LINE = [a b c];
    
    % alternativelty
    % y = -(a/b)*x - c/b in y = m*x + c
    m = -a/b;
    intercept = -c/b;
    
    % closest point calculation
    syms x
    d_diff = diff(hypot((x - pos_x),(m*x + intercept - pos_y)));
    
    dist = solve(d_diff);
    
    goal_x = dist;
    goal_y = -(a/b)*dist - c/b;
    GOAL = [goal_x, goal_y];
 
    while (true)
        
        % heading towards point
        [pos_x, pos_y, pos_theta] = robot.getTruePose();
        q = [pos_x pos_y pos_theta];
        
        [lWv, rWv] = drivePoint(q, GOAL);

        robot.setMotorVel(lWv, rWv);

        tol_x = abs(goal_x - pos_x);
        tol_y = abs(goal_y - pos_y);

        tol = hypot(tol_x, tol_y)
        dif_test = [pos_x, pos_y, 1]*[a, b, c]' / sqrt(a^2 + b^2)
        tol;
        % while within 40cm of goal
        if tol < 40/100
            tol
            return
            %robot.setMotorVel(0, 0);
            %return
            % line following
            safetyFactor = 1; % +/- 1 second
            tic

            while (toc + safetyFactor < 20)
    
                [x, y, theta] = robot.getTruePose();
                q = [x y theta];
                
                [lWv, rWv] = driveLine(q, LINE);
                
                robot.setMotorVel(lWv, rWv);

            end
            
            robot.setMotorVel(0, 0);
            break

        end
    end
    
	%The function needs to end with the following calls; 
	%otherwise, your code will not run during automarking.
	pause(3)
	robot.powerOFF();
	disp("**********END************");
end

function [lWv, rWv] = driveLine(q, LINE)
    
    % gain constants
    Kh = 1.0;
    Kv = 0.3;
    Kd = 0.5;
    
    % position and line info
    pos_x = q(1); pos_y = q(2); pos_theta = q(3);
    a = LINE(1); b = LINE(2); c = LINE(3);
    
    % heading error to line
    goal_theta = atan2(-a, b);
    heading_error = goal_theta - pos_theta;
    d = (a*pos_x + b*pos_y + c)/hypot(a,b);
    
    % wrapping between [-180 180]
    heading = wrapToPi(heading_error);
    
    % controlling and clipping values
    W = (Kh * heading) - (Kd * d);
    W = min(W, 0.5);
    W = max(W, -0.5);

    V = Kv * 1;

    [lWv, rWv] = VtoWheels(V, W);
    
end

function [lWv, rWv] = drivePoint(q, GOAL)
    
    % gain constants
    Kh = 0.8;
    Kv = 0.4; 
    
    % position and goal info
    pos_x = q(1); pos_y = q(2); pos_theta = q(3);
    goal_x = GOAL(1); goal_y = GOAL(2);
    
    % heading error to goal
    goal_theta = atan2(goal_y - pos_y, goal_x - pos_x);
    heading_error = goal_theta - pos_theta;
    
    % wrapping between [-180 180]
    heading = wrapToPi(heading_error);
    
    % controlling and clipping values
    W = Kh * heading;
    W = min(W, 0.6);
    W = max(W, -0.6);

    pos_error = hypot(goal_x - pos_x, goal_y - pos_y);
    V = Kv * pos_error;
    V = min(V, 0.5);

    [lWv, rWv] = VtoWheels(V, W);

end

function [lWv, rWv] = VtoWheels(V, W)
    
    % radius of wheel [m]
    radiusWheel = 0.0975;
    
    % axle length [m]
    robotAxleLength = 0.331;
    
    % left wheel speed [rad/s]
    lWv = (2*V - W*robotAxleLength)/(2*radiusWheel);
    
    % right wheel speed [rad/s]
    rWv = (2*V + W*robotAxleLength)/(2*radiusWheel);
    
end
