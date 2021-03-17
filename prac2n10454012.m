% Make sure to name your function correctly; otherwise, the automatic marking script will not assign you the mark. 
% For example, if your student number is n12345678 and this is a solution for Prac 2, 
% then you should name this function prac2n12345678

function prac2n10454012(robot)

	% The function needs to start with the following call; 
	%otherwise, your code will not run during automarking.
	robot.powerON();
    
    [x, y, theta] = robot.getTruePose();
    pause(1);
    V = 1;
    W = 1;
    [lWv, rWv] = practical2(V, W);
    robot.setMotorVel(lWv, rWv);

    figure(1);
    grid on
    box on 
    hold on
    
    for i = 1:1000
        pause(0.1);
        [x2(:,i), y2(:,i)] = robot.getTruePose();
        scatter(x2(:,i), y2(:,i), 'r');
    end
    
    hold off
    
    ylength = max(y2) - min(y2);
    xlength = max(x2) - min(x2);
    
    disp(' '); disp('y gap'); disp(ylength);
    disp(' '); disp('x gap'); disp(xlength);

	%The function needs to end with the following calls; 
	%otherwise, your code will not run during automarking.
	pause(3)
	robot.powerOFF();
	disp("**********END************");
end    


