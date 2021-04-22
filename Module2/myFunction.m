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
    
    % starting position
    path = [q0(1) q0(2)];
    
    % left sensor initializing and limit
    left = 0;
    leftLimit = 0.99;
    
    % right sensor initializing and limit
    right = 0;
    rightLimit = 0.99;
    
    q = q0;
    
    % looping till reaching limits
    while ((left < leftLimit) && (right < rightLimit))
        
        % sensor values
        sensors = sensorFunction(q);
        left = sensors(1);
        right = sensors(2);
        
        % sensor to speed relationship
        ls = 1 - left;
        rs = 1 - right;
        
        % speeds & path
        speeds = [ls, rs];
        
        q = qupdate(q, speeds);
        
        path = [   path; 
                q(1), q(2)];
        
    end
    
    figure(1);
    plot(path(:,1), path(:,2));
    
end

