% Make sure to name your function correctly; otherwise, the automatic marking script will not assign you the mark. 
% For example, if your student number is n12345678 and this is a solution for Prac 2, 
% then you should name this function prac2n12345678

function prac2n10454012(robot)

	% The function needs to start with the following call; 
	%otherwise, your code will not run during automarking.
	robot.powerON();
    
    V = 1;
    W = 1;
    [lWv, rWv] = VtoWheels(V, W);
    robot.setMotorVel(lWv, rWv);

	%The function needs to end with the following calls; 
	%otherwise, your code will not run during automarking.
	pause(3)
	robot.powerOFF();
	disp("**********END************");
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

