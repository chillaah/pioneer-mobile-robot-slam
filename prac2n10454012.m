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
    
%     tic
%     figure();
    
    for i = 1:54
        pause(0.1);
        [x2(i,1), y2(i,1)] = robot.getTruePose();
        scatter(x2(i,1), y2(i,1), 'r');
        grid on
        box on
        hold on
        %t = toc;
        %if t > 10
        %    hold off
        %    break;
        %end
    end
    
    hold off
   
%     
%     for i = 1:size(x2,2)
%         scatter(x2(1,i), y2(1,i));
%         hold on
%     end
%     hold off
        
%     figure();
%     t = clock;
%     while (t(6) <= 2*pi)
%         [x2, y2] = robot.getTruePose();
%         scatter(x2, y2);
%         drawnow
%         hold on
%     end
%     hold off
    
    
%     stop = false;
%     while(stop)
%         [x2, y2, theta2] = robot.getTruePose();
%         
%         if (x == x2 || y == y2 || theta == theta2)
%             stop = true;
%             robot.setMotorVel(0, 0);
%         end
%     end
    
    
%     RAL = 0.331; % robot axle length
%     R = 1; % length from center to middle of axle (radius)
%     
%     RL = R - RAL/2; % radius from center to left wheel
%     RR = R + RAL/2; % radius from center to right wheel
%     
%     CL = 2 * pi * 0.0975; % circumference of left wheel
%     CR = 2 * pi * 0.0975; % circumference of right wheel
%     
%     ROTL = 2 * pi * RL / CL; % number of rotations by left wheel
%     ROTR = 2 * pi * RR / CR; % number of rotations by right wheel
%     
%     T = 15; % time to complete
%     
%     DPSL = (ROTL * 360) / T; % degrees per second of left wheel
%     DPSR = (ROTR * 360) / T; % degrees per second of right wheel
%     
%     ANGVELL = DPSL * pi/180; % radians per second of left wheel
%     ANGVELR = DPSR * pi/180; % radians per second of right wheel
    
%     robot.setMotorVel(ANGVELL, ANGVELR) % move robot anti-clockwise
    
%     LINVELL = RL * ANGVELL; % meters per second of left wheel
%     LINVELR = RR * ANGVELR; % meters per second of right wheel
%     
%     ANGVEL = norm([ANGVELL ANGVELR]); % total angular velocity
%     LINVEL = norm([LINVELL LINVELR]); % total linear velocity
%     
%     disp(' ');
%     disp(ANGVEL); disp('rad/s');
%     disp(' ');
%     disp(' ');
%     disp(LINVEL); disp('m/s');

	%The function needs to end with the following calls; 
	%otherwise, your code will not run during automarking.
	pause(3)
	robot.powerOFF();
	disp("**********END************");
end    


