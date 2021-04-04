function [lWv, rWv] = drivePoint(q, GOAL)

    Kh = 0.8;
    Kv = 0.4; 

    pos_x = q(1); pos_y = q(2); pos_theta = q(3);
    goal_x = GOAL(1); goal_y = GOAL(2);

    goal_theta = atan2(goal_y - pos_y, goal_x - pos_x);
    heading_error = goal_theta - pos_theta;

    heading = wrapToPi(heading_error);

    W = Kh * heading;
    W = min(W, 0.6);
    W = max(W, -0.6);

    pos_error = hypot(goal_x - pos_x, goal_y - pos_y);
    V = Kv * pos_error;
    V = min(V, 0.5);

    [lWv, rWv] = VtoWheels(V, W);

end