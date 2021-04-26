function in = qcontains(list, nodeid)
    % return true if the node id is in the list, otherwise false
    % 
    % Input:
    %   list    (vector)
    %   nodeid  (scalar)
    %
    % Output:
    %   in (logical)
    
    if isempty(list)
        in = false;
    else
        if isempty(find(list == nodeid))
            in = false;
        else
            in = true;
        end
    end
end