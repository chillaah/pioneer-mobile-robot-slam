function [next_pose, theta] = move(current_pose, d, dth)

    currx = current_pose(1);
    curry = current_pose(2);
    currtheta = current_pose(3);

    movedx = d * cos(currtheta);
    movedy = d * sin(currtheta);
    movedtheta = dth;
    
    nextx = currx + movedx;
    nexty = curry + movedy;
    nexttheta = wrapToPi(currtheta + movedtheta);

    next_pose = [nextx; nexty; nexttheta];
    theta = currtheta;
    
end