% Make sure to name your function correctly; otherwise, the automatic marking script will not assign you the mark. 
% For example, if your student number is n12345678 and this is a solution for Prac 2, 
% then you should name this function prac2n12345678

function prac4n10454012(robot)
	% The function needs to start with the following call; 
	%otherwise, your code will not run during automarking.
	robot.powerON();
    
    goal_x = 0;
    goal_y = 0;
    GOAL = [goal_x, goal_y];
    
    while (true)
        
        % heading towards point
        [x, y, theta] = robot.getTruePose();
        q = [x y theta];

        [lWv, rWv] = drivePoint(q, GOAL);

        robot.setMotorVel(lWv, rWv);

        tol_x = abs(goal_x - x);
        tol_y = abs(goal_y - y);

        tol = hypot(tol_x,tol_y);
        
        
        if tol < 50/100
            
            % line following
            tic
            while (toc <= 20)
                
                [x, y, theta] = robot.getTruePose();
                q = [x y theta];
                
                % line equation
                % -x -y = 0 in ax+ by + c = 0
                a = -1; b = -1; c = 0;
                L = [a b c];
                
                [lWv, rWv] = driveLine2(q, L);
                
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
