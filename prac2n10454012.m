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

    x2 = size(1,100);
    y2 = size(1,100);
    
    for i = 1:100    
        [x2(:,i), y2(:,i)] = robot.getTruePose();
        pause(0.1);
    end
    
    figure();
    grid on
    box on 
    hold on
    
    for j = 1:100
        plot(x2(:,j), y2(:,j), 'ro');
    end
    
    hold off
    
    if V == 1 && W == 1
        
        ylength = max(y2) - min(y2);
        xlength = max(x2) - min(x2);
        
        yerror = (2 - ylength)/2 * 100;
        xerror = (2 - xlength)/2 * 100;
        
        disp(' '); disp('y off by'); disp(yerror); disp('[cm]');
        disp(' '); disp('x off by'); disp(xerror); disp('[cm]');
        
    end

	%The function needs to end with the following calls; 
	%otherwise, your code will not run during automarking.
	pause(3)
	robot.powerOFF();
	disp("**********END************");
end    


