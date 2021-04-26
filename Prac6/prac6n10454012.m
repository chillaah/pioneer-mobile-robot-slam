% Make sure to name your function correctly; otherwise, the automatic marking script will not assign you the mark. 
% For example, if your student number is n12345678 and this is a solution for Prac 2, 
% then you should name this function prac2n12345678

function prac6n10454012(robot)
	% The function needs to start with the following call; 
	%otherwise, your code will not run during automarking.
	robot.powerON();
    
    img = robot.getArenaImage();
    pause(0.1)
    
    % changing boundry color to obstacle color
    for i = 1:size(img,1)
        for j = 1:size(img,2)
            for k = 1:3
                if img(i,j,k) == 0
                    img(i,j,k) = 188;
                end
            end
        end
    end
    
    % vision
    maskedImg = obstacleMask(img);
    se = strel('disk', 11);
    map = imdilate(maskedImg, se);
    idisp(map);
    
    % scaling, path planning and unscaling
    scale = 128/5; % pixels per meter
    [x, y] = robot.getTruePose(); 
    start = round([x+2.5, 2.5-y] * scale);
    goal = round([0.5, 0.5] * scale);
    path = findPath(map, start, goal);
    path = path/scale;
    path = [path(:,1)-2.5, 2.5-path(:,2)];
    
    R = 0.65;
    speed = 0.7;
    
    while (true)
        
        % pure pursuit
        [x, y, theta] = robot.getTruePose();
        q = [x, y, theta];
        vel = control(q, R, speed, path);
        [lWv, rWv] = VtoWheels(vel(1), vel(2));
        robot.setMotorVel(lWv, rWv);
        cond = hypot((x+2.5)-goal(1)/scale,(2.5-y)-goal(2)/scale);
        
        % stopping
        if (cond < 5/100)
            robot.setMotorVel(0, 0);
            pause(0.1)
            break;
        end
    end

	%The function needs to end with the following calls; 
	%otherwise, your code will not run during automarking.
	pause(3)
	robot.powerOFF();
	disp("**********END************");
end    


