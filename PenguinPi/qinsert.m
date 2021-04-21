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
        count = 0;
        for i = 1:length(list)
            if cost(nodeid) <= cost(i)
                count = count + 1;
                % list = [nodeid, list(i:end)];
            else
                continue;
                % list = [list(1:i), nodeid, list(i+1:end)];
            end
        end
        % n = (length(list)+1-count);
        if count == 0
            list = [list, nodeid];
        else
            list = [   list(length)];
%         elseif count == 1
%             list = [nodeid, list];
%         else
%             list = [nodeid, list(count:end)];
        end
    end
    
    % list = flip(list);

end