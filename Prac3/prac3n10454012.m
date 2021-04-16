% Make sure to name your function correctly; otherwise, the automatic marking script will not assign you the mark. 
% For example, if your student number is n12345678 and this is a solution for Prac 2, 
% then you should name this function prac2n12345678

function prac3n10454012(robot)
	% The function needs to start with the following call; 
	%otherwise, your code will not run during automarking.
	robot.powerON();
    
    goal_x = 0;
    goal_y = 0;
    GOAL = [goal_x, goal_y];
    
    while(true)

        [state_x, state_y, state_theta] = robot.getTruePose();
        q = [state_x state_y state_theta];

        [lWv, rWv] = drivePoint(q, GOAL);

        robot.setMotorVel(lWv, rWv);
        pause(0.1)
        
        tol_x = abs(goal_x - state_x);
        tol_y = abs(goal_y - state_y);

        tol = sqrt(tol_x^2 + tol_y^2);

        if tol < 1/100
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
    if heading_error >  pi
        heading_error = heading_error - 2*pi;
    end

    if heading_error < -pi
        heading_error = heading_error + 2*pi; 
    end

    % controlling and clipping values
    W = Kh * heading_error;
    W = min(W, 0.5);
    W = max(W, -0.5);

    pos_error = sqrt((goal_x - pos_x)^2 + (goal_y - pos_y)^2);
    V = Kv * pos_error;
    V = min(V, 0.3);

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

