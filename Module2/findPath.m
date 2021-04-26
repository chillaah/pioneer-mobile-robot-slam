function path = findPath(map, start, goal)
    % Input:
    %   map is an arbitrary size real matrix representing an occupancy grid. The elements are equal to 0 (free space) or 1 (occupied)
    %   start is a 1x2 matrix containing the start coordinate [x y] for the path
    %   goal is a 1x2 matrix containing the end coordinate [x y] for the path
    % Return:
    %   path is an Nx2 matrix containing the ordered path from start to goal, inclusive of end points.  N depends on the map.
    
    dtransform = distanceTransform(map, goal);   % use your own distance transform function
    
    % compute the best path
    
    goalx = goal(1); goaly = goal(2);
    
    % begin at start coordinates
    path(1,:) = start;
    i = 2;
    
    % loop until goal is reached
    while (true)
        
        % creating 3x3 window around current cell
        lastx = path(end, 1);
        lasty = path(end, 2);
        M = window(dtransform, lastx, lasty);
        
        % getting new coordinate change
        change = minval(M);
        changex = change(1);
        changey = change(2);
        
        % updating to next coordinates
        nextx = lastx + changex;
        nexty = lasty + changey;
        path(i,:) = [nextx, nexty];
        
        % if goal has been reached
        if (path(end,1) == goalx && path(end,2) == goaly)
            break;
        else
            i = i + 1;
        end
        
    end
end