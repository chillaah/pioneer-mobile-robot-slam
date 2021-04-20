function dtransform = distanceTransform(map, goal)
    
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
    
    % compare matrix
    manhattan = [inf 1 inf;
                  1  0  1 ;
                 inf 1 inf];
    
    % looping to assign distance values
    cellsTotal = sum((dtransform == inf),'all') + 1;
    while (true)
        
        cellsNotFilled = sum((dtransform == inf),'all');
        if cellsNotFilled >= cellsTotal
            break;
        end
        cellsTotal = cellsNotFilled;
        
        for i = 1:mapy
            for j = 1:mapx
                
                if isnan(dtransform(j,i))
                    continue;
                end
                    M = window(dtransform,i,j);
                    
                    C = M + manhattan;
                
                    dtransform(j,i) = min(C,[],'all');
                %end
            end
        end
    end
    
end