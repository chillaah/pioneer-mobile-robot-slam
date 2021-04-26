function nodeid = neighbours(distanceMatrix, nodeid)
    % Return a list of node id's for the neighbours of the given node id
    %
    % Input:
    %   distanceMatrix  (square symmetric matrix)
    %   nodeid          (scalar)
    %
    % Output:
    %   nodeid   (scalar)
    
    distMatRow = distanceMatrix(nodeid, :);
    
    nodeid = find(distMatRow ~= 0);
end