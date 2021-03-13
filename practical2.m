%% EGB439 Practical 2

function [lWv, rWv] = practical2(V, W)

    desiredLinearVel = V;
    desiredAngularVel = W;
    
    radiusWheel = 0.0975;
    robotAxleLength = 0.331;

    if desiredLinearVel == 0 && desiredAngularVel ~= 0
        % just right moves
        % so it turns on the spot
        circleRadius = desiredLinearVel / desiredAngularVel; % length from center to middle of axle (radius)
        
        linearDistance = 2*pi*circleRadius;
        timeLinear =  circleRadius * linearDistance / desiredLinearVel; % figure out time

        leftRadius = circleRadius - robotAxleLength/2; % radius from center to left wheel
        rightRadius = circleRadius + robotAxleLength/2; % radius from center to right wheel
        
        % number of rotations by each wheel
        numRotLeft = leftRadius / radiusWheel;
        numRotRight = rightRadius / radiusWheel;

        % velocity of each wheel in degrees per second
        degPerSecLeft = (numRotLeft * 360) / timeLinear;
        degPerSecRight = (numRotRight * 360) / timeLinear;
        
        % velocity in radians per second
        lWv = degPerSecLeft * pi/180;
        rWv = degPerSecRight * pi/180;
        
    elseif desiredAngularVel == 0 && desiredLinearVel ~= 0
        % moves straight
        % both left and right move with same speed
        
    else
        % normal hybrid functioning
        
        circleRadius = desiredLinearVel / desiredAngularVel; % length from center to middle of axle (radius)
        
        linearDistance = 2*pi*circleRadius;
        timeLinear =  circleRadius * linearDistance / desiredLinearVel; % figure out time

        leftRadius = circleRadius - robotAxleLength/2; % radius from center to left wheel
        rightRadius = circleRadius + robotAxleLength/2; % radius from center to right wheel

        % number of rotations by each wheel
        numRotLeft = leftRadius / radiusWheel;
        numRotRight = rightRadius / radiusWheel;

        % velocity of each wheel in degrees per second
        degPerSecLeft = (numRotLeft * 360) / timeLinear;
        degPerSecRight = (numRotRight * 360) / timeLinear;
        
        % velocity in radians per second
        lWv = degPerSecLeft * pi/180;
        rWv = degPerSecRight * pi/180;
        
    end
    
end
