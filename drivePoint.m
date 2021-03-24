function [lWv, rWv] = drivePoint(q, GOAL)

Kh = 0.8;
Kv = 0.4; 

pos_x = q(1); pos_y = q(2); pos_theta = q(3);
goal_x = GOAL(1); goal_y = GOAL(2);

goal_theta = atan2(goal_y - pos_y, goal_x - pos_x);
heading_error = goal_theta - pos_theta;

while heading_error >  pi
    heading_error = heading_error - 2*pi;
end

while heading_error < -pi
    heading_error = heading_error + 2*pi; 
end

W = Kh * heading_error;
W = min(W, 0.5);
W = max(W, -0.5);

pos_error = sqrt((goal_x - pos_x)^2 + (goal_y - pos_y)^2);
V = Kv * pos_error;
V = min(V, 0.3);

[lWv, rWv] = VtoWheels(V, W);

end