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
