% Below is the full source code of a breadth-first search, that makes use of the functions that you debugged in the previous
% question.
% Modify this to use the A* search algorith.

function [path,frontierList,exploredList] = graph_planner(distanceMatrix, placeCoords, placeNames, startNode, goalNode)
    
    parentNode = [];  % parentNode(i) is the number of the node which is the parent of node i
    
    frontierList = startNode;  % put the starting node in the frontier
    exploredList = [];  % nothing has been explored yet
    g(startNode) = 0; % distance travelled to reach each node
    
    % do the breadth first search
    while ~isempty(frontierList)  % while the frontier is not empty
        
        % get next node from frontier list, this is the node we are expanding
        [frontierList, expandingNode] = qpop(frontierList);
        fprintf('expanding node %d (%s)\n', expandingNode, placeNames{expandingNode});
        
        % check if we are there yet?
        if expandingNode == goalNode
            break;  % yes
        end
        
        % visit all the neighbours of the node being expanded
        for n = neighbours(distanceMatrix, expandingNode)  % for each neighbour
            
            if ~qcontains(frontierList, n) && ~qcontains(exploredList, n)
                
                % this neighbour is not on the frontier and is not explored
                g(n) = g(expandingNode) + distanceMatrix(expandingNode, n); % record the distance travelled
                
                h(n) = heuristic(placeCoords, n, goalNode); % cost to go
                
                f(n) = g(n) + h(n); % evaluation function
                
                fprintf('  adding node %d (%s) to frontier, %.0f from start\n', n, placeNames{n}, g(n));
                
                frontierList = qinsert(frontierList, n, f); % insert 'n' into the list 
                
                parentNode(n) = expandingNode;  % record how we got to this node
                
            else
                
                if ~((g(expandingNode) + distanceMatrix(expandingNode, n)) >= g(n))
                    
                   g(n) = (g(expandingNode) + distanceMatrix(expandingNode, n)); % min cost to come
                   
                   h(n) = heuristic(placeCoords, n, goalNode); % cost to go
                   
                   f(n) = g(n) + h(n); % evaluation function
                   
                   parentNode(n) = expandingNode;
                   
                end
            end
        end
        
        % we are done with this node now, add it to the explored list
        exploredList = qappend(exploredList, expandingNode);
        fprintf('  adding node %d %s to explored list\n', expandingNode, placeNames{expandingNode});
    end
    
    % Now we need to reconstruct the path.  For each node we record it's parent
    % node, the node we arrived from.  Starting at the goal node, we find its
    % parent, then the parent of that node, until we get to the start node
    
    path = [];
    n = goalNode;  % set current node to the start

    while true
        path = [n path];    % prepend it to the path
        if n == startNode   % quit now if we have reached the starting node
            return
        end
        n = parentNode(n);  % find the parent of this node
    end
end

function h = heuristic(placeCoords, n, goalNode)

    goal = placeCoords(:, goalNode);
    node = placeCoords(:, n);
    
    square  = (node - goal).^ 2;
    h = sqrt(sum(square)) / (10^2 * 10^3); % conversion km to m

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
    
    distMatRow = distanceMatrix(nodeid, :);
    
    nodeid = find(distMatRow ~= 0);
end

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

function in = qcontains(list, nodeid)
    % return true if the node id is in the list, otherwise false
    % 
    % Input:
    %   list    (vector)
    %   nodeid  (scalar)
    %
    % Output:
    %   in (logical)
    
    if isempty(list); in = false;
    else; if isempty(find(list == nodeid)); in = false;
          else; in = true;
          end
    end
end

function [newlist,nodeid] = qinsert(list, nodeid, cost)
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
    
    % Find minimum cost index larger than or equal to nodeid
    
    list = [list, nodeid];
     
    mat = sortrows([list; cost(list)]', 2);
    
    newlist = mat(:, 1)'; 
    
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

    if isempty(list); nodeid = [];
    else; nodeid = list(1);
    end
    
    if length(list) > 2; newlist = list(2:end);
    elseif length(list) == 2; newlist = list(2);
    else; newlist = find([1 2] == 3);
    end

end