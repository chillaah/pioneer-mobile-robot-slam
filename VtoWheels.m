%% EGB439 Practical 2

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


%%


%     x2 = size(1,100);
%     y2 = size(1,100);
%     
%     for i = 1:100    
%         [x2(:,i), y2(:,i)] = robot.getTruePose();
%         pause(0.1);
%     end
%     
%     figure();
%     grid on
%     box on 
%     hold on
%     
%     for j = 1:100
%         plot(x2(:,j), y2(:,j), 'ro');
%     end
%     
%     hold off
%     
%     if V == 1 && W == 1
%         
%         ylength = max(y2) - min(y2);
%         xlength = max(x2) - min(x2);
%         
%         yerror = (2 - ylength)/2 * 100;
%         xerror = (2 - xlength)/2 * 100;
%         
%         disp(' '); disp('y off by'); disp(yerror); disp('[cm]');
%         disp(' '); disp('x off by'); disp(xerror); disp('[cm]');
%         
%     end

%     desiredLinearVel = V;
%     desiredAngularVel = W;

%     if desiredLinearVel == 0 && desiredAngularVel ~= 0
%         % just right moves
%         % so it turns on the spot
%         circleRadius = robotAxleLength/2; % length from center to middle of axle (radius)
%         
%         angularDistance = 2*pi;
%         timeLinear = angularDistance / desiredAngularVel; % figure out time
% 
%         leftRadius = circleRadius - robotAxleLength/2; % radius from center to left wheel
%         rightRadius = circleRadius + robotAxleLength/2; % radius from center to right wheel
%         
%         % number of rotations by each wheel
%         numRotLeft = leftRadius / radiusWheel;
%         numRotRight = rightRadius / radiusWheel;
% 
%         % velocity of each wheel in degrees per second
%         degPerSecLeft = (numRotLeft * 360) / timeLinear;
%         degPerSecRight = (numRotRight * 360) / timeLinear;
%         
%         % velocity in radians per second
%         lWv = degPerSecLeft * pi/180;
%         rWv = degPerSecRight * pi/180;
%         
%     elseif desiredAngularVel == 0 && desiredLinearVel ~= 0
%         % moves straight
%         % both left and right move with same speed
%         % lWv = desiredLinearVel / 
%         
%     elseif desiredAngularVel == 0 && desiredAngularVel == 0
%         
%         lWv = 0;
%         rWv = 0;
%         
%     else
%         % normal hybrid functioning
%         circleRadius = desiredLinearVel / desiredAngularVel; % length from center to middle of axle (radius)
%         
%         linearDistance = 2*pi*circleRadius;
%         timeLinear = linearDistance / desiredLinearVel; % figure out time
% 
%         leftRadius = circleRadius - (robotAxleLength/2); % radius from center to left wheel
%         rightRadius = circleRadius + (robotAxleLength/2); % radius from center to right wheel
% 
%         % number of rotations by each wheel
%         numRotLeft = leftRadius / radiusWheel;
%         numRotRight = rightRadius / radiusWheel;
% 
%         % velocity of each wheel in degrees per second
%         degPerSecLeft = (numRotLeft * 360) / timeLinear;
%         degPerSecRight = (numRotRight * 360) / timeLinear;
%         
%         % velocity in radians per second
%         lWv = degPerSecLeft * pi/180;
%         rWv = degPerSecRight * pi/180;
%         
%     end
