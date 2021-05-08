function next_pose = move(current_pose, d, dth)
%inputs: current_pose is a 3x1 vector [x; y; theta] of the robot (theta in radians)
%        d  distance traveled in meters
%        dt angle rotated in radians 
%outputs: next_pose is a 3x1 vector [x; y; theta] of the robot (theta in radians)

    currx = current_pose(1);
    curry = current_pose(2);
    currtheta = current_pose(3);

    movedx = d * cos(currtheta);
    movedy = d * sin(currtheta);
    movedtheta = dth;

    nextx = currx + movedx;
    nexty = curry + movedy;
    nexttheta = currtheta + movedtheta;

    next_pose = [nextx; nexty; nexttheta];

end