function [lWv, rWv] = drivePoint(q, GOAL)
    
% constants
Kh = 0.8; %0.8;
Kv = 0.4; %0.4;

% goal heading
theta_goal = atan2(GOAL(2) - q(2), GOAL(1) - q(1));

% heading angle error
e = theta_goal - q(3);

while (e >  pi); e = e-2*pi; end
while (e < -pi); e = e+2*pi; end

% turning speed
omega = Kh * e;
omega = min(omega, 0.5);
omega = max(omega, -0.5);

% forward speed
v = Kv*sqrt((GOAL(1) - q(1))^2 + (GOAL(2) - q(2))^2);
vel = Kv * v;
vel = min(vel, 0.1);

[lWv, rWv] = VtoWheels(vel, omega);

end