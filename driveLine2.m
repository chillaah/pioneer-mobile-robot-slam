function [lWv, rWv] = driveLine2(q, GOAL)

    Kh = 0.8;
    Kv = 0.3;
    Kd = 1.2;

    pos_x = q(1); pos_y = q(2); pos_theta = q(3);
    a = GOAL(1); b = GOAL(2); c = GOAL(3);

    goal_theta = atan2(-a, b);
    heading_error = goal_theta - pos_theta;
    
    heading = wrapToPi(heading_error);
    
    d = (a*pos_x + b*pos_y + c)/hypot(a,b);

    W = (Kh * heading) - (Kd * d);
    W = min(W, 0.6);
    W = max(W, -0.6);

    V = Kv * 1;

    [lWv, rWv] = VtoWheels(V, W);
    
end