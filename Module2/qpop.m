function [newlist,nodeid] = qpop(list)
    % get a node id from the front of list and return an updated list. If the list is
    % empty return newlist as and nodeid as the empty value [].
    % 
    % Input:
    %   list    (vector)
    %
    % Output:
    %   newlist (vector)
    %   nodeid  (scalar)

    if isempty(list); nodeid = [];
    else; nodeid = list(1);
    end
    
    if length(list) > 2; newlist = list(2:end);
    elseif length(list) == 2; newlist = list(2);
    else; newlist = find([1 2] == 3);
    end

end