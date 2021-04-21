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
        in = 0;
    else
        if isempty(find(list == nodeid))
            in = 0;
        else
            in = 1;
        end
    end
end