function h = heuristic(placeCoords, n, goalNode)

    goal = placeCoords(:, goalNode);
    node = placeCoords(:, n);
    
    root  = (node - goal).^ 2;
    h = sqrt(sum(root)) / (10^2 * 10^3); % conversion km to m

end