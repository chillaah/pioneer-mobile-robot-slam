function [lWv, rWv] = driveLine(q, LINE)

    Kh = 0.9;
    Kv = 0.3;
    Kd = 0.5;
    
    pos_x = q(1); pos_y = q(2); pos_theta = q(3);
    a = LINE(1); b = LINE(2); c = LINE(3);

    goal_theta = atan2(-a, b);
    heading_error = goal_theta - pos_theta;
    
    heading = wrapToPi(heading_error);
    
    d = (a*pos_x + b*pos_y + c)/hypot(a,b);

    W = (Kh * heading) - (Kd * d);
    W = min(W, 0.5);
    W = max(W, -0.5);

    V = Kv * 1;

    [lWv, rWv] = VtoWheels(V, W);
    
end