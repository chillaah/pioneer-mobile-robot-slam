function myFunction(q0, sensorFunction)
    % q0 is a 3x1 vector giving the initial configuration of the robot in units of metres and degrees
    % sensorFunction is a function that accepts the robot configuration and 
    % returns a vector containing the left and right sensor values
    % eg. sensors = sensorFunction( q )
    % where sensors is a 2x1 vector containing the left and right sensor readings
    
    % sensors = sensorFunction(q)
    % compute wheel speeds
    % q = qupdate(q, speeds)
    
    % plot()
end

function qnew = qupdate(q, vel, dt)
    % Inputs:
    % q is the configuration vector (x, y, theta) in units of metres and radians
    % vel is the velocity vector (v, omega)
    % dt is the length of the integration timestep in units of seconds
    % Return:
    % qnew is the new configuration vector vector (x, y, theta) in units of metres and radians at the
    % end of the time interval.
    V = vel(1);
    omega = vel(2);
    theta = q(3);
    xdot = V*cos(theta);
    ydot = V*sin(theta);
    thetadot = omega;

    qdot = [xdot, ydot, thetadot];
    qstep = qdot*dt;
    qnew = q+qstep;
end       