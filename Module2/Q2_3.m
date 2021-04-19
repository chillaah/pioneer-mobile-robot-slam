%----- YOUR CODE GOES BELOW HERE -----

function dtransform = distanceTransform(map, goal)
    % Input:
    %   map is an arbitrary size real matrix representing an occupancy grid. The elements are equal to 0 (free space) or 1 (occupied)
    %   goal is a 1x2 matrix containing the end coordinate [x y] for the path
    % Return:
    %   dtransform is a matrix, the same size as map, whose elements reflect the distance from that cell to the goal
    
    % compute the distance transform of map
    
    % initiallizing
    mapx = size(map,1); mapy = size(map,2);
    goalx = goal(1); goaly = goal(2);
    dtransform = size(map);
    
    % assigning inf and NaN values according to map
    for i = 1:mapx
        for j = 1:mapy
            if map(mapx,mapy) == 1
                dtransform(mapx,mapy) = inf;
            else
                dtransform(mapx,mapy) = NaN;
            end
        end
    end
    
    % goal
    dtransform(goalx, goaly) = 0;
    
    % C matrix
    C = [sqrt(2) 1 sqrt(2);
               1 0 1      ;
         sqrt(2) 1 sqrt(2)];
     
    
     
    
    
    
    
    
end

function path = findPath(map, start, goal)
    % Input:
    %   map is an arbitrary size real matrix representing an occupancy grid. The elements are equal to 0 (free space) or 1 (occupied)
    %   start is a 1x2 matrix containing the start coordinate [x y] for the path
    %   goal is a 1x2 matrix containing the end coordinate [x y] for the path
    % Return:
    %   path is an Nx2 matrix containing the ordered path from start to goal, inclusive of end points.  N depends on the map.
    
    dtransform = distanceTransform(map, goal);   % use your own distance transform function
    
    % compute the best path 
    path = 
end