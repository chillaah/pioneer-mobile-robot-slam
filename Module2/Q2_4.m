% YOUR CODE GOES BELOW

function newlist = qappend(list, nodeid)
    % add the node id to the end of the list and return an updated list 
    %
    % Input:
    %   nodeid  (scalar)
    %   list    (vector)
    %
    % Output:
    %    newlist (vector)
    
    newlist = [list, nodeid];
end

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
    if isempty(list)
        nodeid = [];
    else
        nodeid = list(1);
    end
    
    if length(list) > 2
        newlist = list(2:end);
    elseif length(list) == 2
        newlist = list(2);
    else
        newlist = find([1 2] == 3);
    end

end

function list = qinsert(list, nodeid, cost)
    % insert the node id into the list and return an updated list.  The node is inserted
    % at a location such that the cost of the nodes is non-decreasing in magnitude.
    % cost is a vector such that cost(i) is the cost of node i. It is guaranteed that 
    % cost will be a vector with length at least equal to the maximum nodeid.
    % If multiple nodes have the same cost, their relative ordering does not matter.
    % 
    % 
    % Input:
    %   list    (vector)
    %   nodeid  (scalar)
    %   cost    (vector)
    %
    % Output:
    %   newlist (vector)
    if isempty(list)
        list = nodeid;
    else
        for i = 1:length(list)
            if cost(nodeid) < cost(i)
                list = [list(1:i), nodeid, list(i+1:end)];
            else
                list = [nodeid, list(i:end)];
            end
        end
    end

end

function nodeid = neighbours(distanceMatrix, nodeid)
    % Return a list of node id's for the neighbours of the given node id
    %
    % Input:
    %   distanceMatrix  (square symmetric matrix)
    %   nodeid          (scalar)
    %   
    % Output:
    %   nodeid   (scalar)
end