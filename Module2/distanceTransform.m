function dtransform = distanceTransform(map, goal)
    % Input:
    %   map is an arbitrary size real matrix representing an occupancy grid. The elements are equal to 0 (free space) or 1 (occupied)
    %   goal is a 1x2 matrix containing the end coordinate [x y] for the path
    % Return:
    %   dtransform is a matrix, the same size as map, whose elements reflect the distance from that cell to the goal
    
    % compute the distance transform of map
    
    % initializing
    mapx = size(map,1); mapy = size(map,2);
    goalx = goal(1); goaly = goal(2);
    dtransform = zeros(mapx,mapy);
    
    % assigning inf and NaN values according to map
    for n = 1:mapx
        for m = 1:mapy
            
            if map(n,m) == 1
                dtransform(n,m) = NaN;
            else
                dtransform(n,m) = inf;
            end
        end
    end
    
    % goal
    dtransform(goaly,goalx) = 0;
    
    % compare with cityblock matrix
    manhattan = [Inf, 1, Inf;
                  1,  0,  1 ;
                 Inf, 1, Inf];
    
    % looping to assign distance values
    cellsTotal = sum((dtransform == inf), 'all') + 1;
    
    while (true)
        
        % cell check
        cellsNotFilled = sum((dtransform == inf), 'all');
        
        if (cellsNotFilled >= cellsTotal)
            break;
        else
            cellsTotal = cellsNotFilled;
        end
        
        % iterating and updating cells with window
        for i = 1:mapy
            for j = 1:mapx
                
                if isnan(dtransform(j, i))
                    continue;
                else
                    W = window(dtransform, i, j);
                    
                    C = W + manhattan;
                
                    dtransform(j, i) = min(C, [], 'all');
                end
            end
        end
        i;
    end
end