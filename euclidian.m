function GOAL = euclidian(q, LINE)
    a = LINE(1); b = LINE(2); c = LINE(3);
    x1 = linspace(-10, 10, 10000+1); x1(end) = [];
    y1 = - c/b - a/b * x1;
    
    dist = hypot(x1-q(1), y1-q(2));
    [~, loc] = min(dist);
    goal_x = x1(loc);
    goal_y = y1(loc);
    
    GOAL = [goal_x, goal_y];
end