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
    
    num = 0; 
    
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
        else
            num = num + 1;
        end

    end
    

	%The function needs to end with the following calls; 
	%otherwise, your code will not run during automarking.
	pause(3)
	robot.powerOFF();
	disp("**********END************");
end    


