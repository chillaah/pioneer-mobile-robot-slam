% Make sure to name your function correctly; otherwise, the automatic marking script will not assign you the mark. 
% For example, if your student number is n12345678 and this is a solution for Prac 2, 
% then you should name this function prac2n12345678

function prac5n10454012(robot)
	% The function needs to start with the following call; 
	%otherwise, your code will not run during automarking.
	robot.powerON();
    
    t = linspace(0, 2*pi, 100);
    for i = 1:length(t)
        % x-axis
        x(i) = 1.8 * cos(t(i)) ./ (sin(t(i)).^2 + 1);

        % y-axis
        y(i) = 3 * cos(t(i)) .* sin(t(i)) ./ (sin(t(i)).^2 + 1);
    end

    path = [x', y'];
    
    p = [    1.8,  0;
          0.8485,  1;
         -0.8485, -1;
            -1.8,  0;
         -0.8485,  1;
          0.8485, -1];
    
    [pos_x, pos_y] = robot.getTruePose();
    pos = double([pos_x, pos_y]);
    pos = repmat(pos,[6,1]);
    diff = p - pos;
    d = zeros(6,1);
    for i = 1:length(p)
        d(i,:) = hypot(diff(i,1), diff(i,2));
    end
    [~, index] = min(d);
    GOAL = p(index,:);
    goal_x = GOAL(1);
    goal_y = GOAL(2);
    
    R = 0.3;
    speed = 0.5;
 
    while (true)
        
        % heading towards point
        [pos_x, pos_y, pos_theta] = robot.getTruePose();
        q = [pos_x pos_y pos_theta];
        
        [lWv, rWv] = drivePoint(q, GOAL);
        
        robot.setMotorVel(lWv, rWv);
        
        tol_x = abs(goal_x - pos_x);
        tol_y = abs(goal_y - pos_y);

        tol = hypot(tol_x, tol_y);
        
        % while within 40cm of goal
        if tol < 40/100 
            
            while (true)
                [x, y, theta] = robot.getTruePose();
                q = [x y theta];

                vel = control2(q, R, speed, path);

                [lWv, rWv] = VtoWheels(vel(1), vel(2));

                robot.setMotorVel(lWv, rWv);
            end
        end
        
    end
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
%     p = [    1.8,  0;
%           0.8485,  1;
%          -0.8485, -1;
%             -1.8,  0;
%          -0.8485,  1;
%           0.8485, -1];
%     
%     [pos_x, pos_y] = robot.getTruePose();
%     pos = double([pos_x, pos_y]);
%     pos = repmat(pos,[6,1]);
%     diff = p - pos;
%     d = zeros(6,1);
%     for i = 1:length(p)
%         d(i,:) = hypot(diff(i,1), diff(i,2));
%     end
%     [~, index] = min(d);
%     GOAL = p(index,:);
%     goal_x = GOAL(1);
%     goal_y = GOAL(2);
%     
%     while (true)
%         % heading towards point
%         [pos_x, pos_y, pos_theta] = robot.getTruePose();
%         q = [pos_x pos_y pos_theta];
%         
%         [lWv, rWv] = drivePoint(q, GOAL);
%         
%         robot.setMotorVel(lWv, rWv);
%         pause(0.1)
%         
%         tol_x = abs(goal_x - pos_x);
%         tol_y = abs(goal_y - pos_y);
%         
%         tol = sqrt(tol_x^2 + tol_y^2);
%         
%         if tol < 1/100
%             robot.setMotorVel(0, 0);
%             break
%         end
%     end
        
    
%     % line equation
%     % -x -y = 0 in ax+ by + c = 0
%     a = 1.8; b = 3; c = 0;
%     LINE = [a b c];
%     
%     % closest point calculation
%     syms x
%     d_diff = diff(hypot((( cos(x)/(1+sin(x)^2)) - pos_x),(( sin(x)*cos(x)/(1+sin(x)^2))- pos_y)));
%     dist = solve(d_diff);
%     
%     goal_x = dist;
%     goal_y = -(a/b)*dist - c/b;
%     GOAL = [goal_x, goal_y];
%     
%     while (true)
%         
%         % heading towards point
%         [pos_x, pos_y, pos_theta] = robot.getTruePose();
%         q = [pos_x pos_y pos_theta];
%         
%         [lWv, rWv] = driveLine(q, LINE);
%         
%         robot.setMotorVel(lWv, rWv);
%         
%     end
    
% %     % time vector
% t = linspace(0, 2*pi, 100);
% 
% % when t = 0,2*pi -> x(t) = a*srt(2)
% % a = +/-0.5/sqrt(2)
% % a = 0.5/sqrt(2);
% 
% for i = 1:length(t)
%     % x-axis
%     x(i) = 1.8 * cos(t(i)) ./ (sin(t(i)).^2 + 1);
%     
%     % y-axis
%     y(i) = 3 * cos(t(i)) .* sin(t(i)) ./ (sin(t(i)).^2 + 1);
% end
% 
% path = [x', y'];
% 
%     pos = double([pos_x, pos_y]);
%     pos = repmat(pos,[length(t),1]);
%     diff = path - pos;
%     d = zeros(length(t),1);
%     for i = 1:length(t)
%         d(i,:) = hypot(diff(i,1), diff(i,2));
%     end
%     [~, index] = min(d);
%     GOAL = path(index,:);
%     goal_x = GOAL(1);
%     goal_y = GOAL(2);
% 
%     while (true)
%         
%         % heading towards point
%         [pos_x, pos_y, pos_theta] = robot.getTruePose();
%         q = [pos_x pos_y pos_theta];
%         
%         [lWv, rWv] = drivePoint(q, GOAL);
%         
%         robot.setMotorVel(lWv, rWv);
%         
%         pause(0.1)
% 
%         tol_x = abs(goal_x - pos_x);
%         tol_y = abs(goal_y - pos_y);
% 
%         tol = sqrt(tol_x^2 + tol_y^2);
% 
%         if tol < 40/100
%             [pos_x, pos_y] = robot.getTruePose();
%             pos = double([pos_x, pos_y]);
%             pos = repmat(pos,[length(t),1]);
%             diff = path - pos;
%             d = zeros(length(t),1);
%             for i = 1:length(t)
%                 d(i,:) = hypot(diff(i,1), diff(i,2));
%             end
%             [~, index] = min(d);
%             GOAL = path(index,:);
%             goal_x = GOAL(1);
%             goal_y = GOAL(2);
%          end
% 
%      end

% z = (t*sqrt((-81 - 50*t.^2 + 9*sqrt(81 + 200*t.^2))/t.^2))/(3*sqrt(2));
% 
% % A = a;
% 
% % plot
% figure();
% hold on
% plot(x, y, 'r');
% plot(t,z,'k');
% box on
% grid on
% ylim('auto');
% 
%     
%     plot(pos_x,pos_y,'bo');

	%The function needs to end with the following calls; 
	%otherwise, your code will not run during automarking.
	pause(3)
	robot.powerOFF();
	disp("**********END************");
end    


