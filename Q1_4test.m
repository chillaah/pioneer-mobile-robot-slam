%% Q1.4

%----- YOUR CODE GOES BELOW HERE -----

function wheelVel = vel2wheels(vel)
    % Inputs:
    % vel is the velocity vector (v, omega) in units of metres/s and radians/s
    % Return:
    % wheelVel is the wheel velocity vector (vleft, vright) each in the range -100 to +100 to achieve
    % this velocity
    
    radiusWheel = 0.0975;
    robotAxleLength = 0.331;
    
    vel(1) = v;
    vel(2) = omega;

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
    
    v = vel(1);
    omega = vel(2);
    theta = q(3);
    
    xdot = v*cos(theta);
    ydot = v*sin(theta);
    thetadot = omega;
    
    qd = [xdot ydot thetadot];
    
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
    qextra = dt*qd;
    qnew = q + qextra;
    
end

function vel = control(q, point)
    % Inputs:
    % q is the initial configuration vector (x, y, theta) in units of metres and radians
    % point is the vector (x, y) specifying the goal point of the robot
    
    
end
