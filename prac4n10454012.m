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
    % y = -(a/b)*x - c/b in y = mx + c
    m = -a/b;
    intercept = -c/b;
    
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

        tol = hypot(tol_x,tol_y);
        
        if tol < 40/100
            
            % line following
            tic
            safetyFactor = 1;
            
            while (toc + safetyFactor < 20)
                    
                [x, y, theta] = robot.getTruePose();
                q = [x y theta];
                
                [lWv, rWv] = driveLine(q, LINE);
                
                robot.setMotorVel(lWv, rWv);
                pause(0.1)
                
            end
            
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
