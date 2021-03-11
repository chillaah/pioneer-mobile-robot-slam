%% EGB439 Practical 2

function [lWv, rWv] = practical2(V)

    desiredLinearVel = V;
    % desiredAngularVel = W;
    
    circleRadius = 1; % length from center to middle of axle (radius)
    linearDistance = 2*pi*circleRadius;
    timeLinear = linearDistance / desiredLinearVel;
    robotAxleLength = 0.331;
    
    leftRadius = circleRadius - robotAxleLength/2; % radius from center to left wheel
    rightRadius = circleRadius + robotAxleLength/2; % radius from center to right wheel
    radiusWheel = 0.0975;
    
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
