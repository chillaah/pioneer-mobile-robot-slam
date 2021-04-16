%----- YOUR CODE GOES BELOW HERE -----

function wheelVel = vel2wheels(vel)
    % Inputs:
    % vel is the velocity vector (v, omega) in units of metres/s and radians/s
    % Return:
    % wheelVel is the wheel velocity vector (vleft, vright) each in the range -100 to +100 to achieve
    % this velocity
    
    radiusWheel = 0.0975;
    robotAxleLength = 0.331;
    
    v = vel(1);
    omega = vel(2);

    vleft = (2*v - omega*robotAxleLength)/(2*radiusWheel);
    vright = (2*v + omega*robotAxleLength)/(2*radiusWheel);
    
    wheelVel = [vleft vright];
    
    % capping
    wheelVel(wheelVel < -100) = -100;
    wheelVel(wheelVel > 100) = 100;
end

function vel = wheels2vel(wheelVel)
    % Inputs:
    % wheelVel is the wheel velocity vector (vleft, vright) each in the range -100 to +100
    % Return:
    % vel is the resulting velocity vector (v, omega) in units of metres/s and radians/s
    
    radiusWheel = 0.0975;
    robotAxleLength = 0.331;
    
    vleft = wheelVel(1);
    vright = wheelVel(2);
    
    v = radiusWheel*(vright+vleft)/2;
    omega = radiusWheel*(vright-vleft)/robotAxleLength;
    
    vel = [v omega];
end

function qd = qdot(q, vel)
    % Inputs:
    % q is the configuration vector (x, y, theta) in units of metres and radians
    % vel is the velocity vector (v, omega)
    % Return:
    % qd is the vector (xdot, ydot, thetadot) in units of metres/s and radians/s
    
    V = vel(1);
    W = vel(2);
    theta = q(3);
    
    x_dot = V * cos(theta);
    y_dot = V * sin(theta);
    theta_dot = W;
    
    qd = [x_dot y_dot theta_dot];
end

function qnew = qupdate(q, vel, dt)
    % Inputs:
    % q is the configuration vector (x, y, theta) in units of metres and radians
    % vel is the velocity vector (v, omega)
    % dt is the length of the integration timestep in units of seconds
    % Return:
    % qnew is the new configuration vector vector (x, y, theta) in units of metres and radians at the
    % end of the time interval.
    
    % qdot
    qd = qdot(q, vel);
    
    % end of time
    qint = dt * qd;
    qnew = q + qint;
    
    theta = qnew(3);
    
    if (theta >=  pi)
        theta = theta - 2*pi;
    end

    if (theta < -pi)
        theta = theta + 2*pi; 
    end
    
    
    qnew(3) = theta;
end

function vel = control(q, point)
    % Inputs:
    % q is the initial configuration vector (x, y, theta) in units of metres and radians
    % point is the vector (x, y) specifying the goal point of the robot
    
    Kh = 0.8;
    Kv = 0.4; 

    pos_x = q(1); pos_y = q(2); pos_theta = q(3);
    goal_x = point(1); goal_y = point(2);

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
    
    tol_x = abs(goal_x - pos_x);
    tol_y = abs(goal_y - pos_y);

    tol = sqrt(tol_x^2 + tol_y^2);

    if tol < 1/100
        vel = [0, 0];
    else
            vel = [V W];
    end

end