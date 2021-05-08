function [d , dth] = get_odom(new_ticks, old_ticks)
%inputs: new_ticks , old_ticks both are 1x2 vectors [left_ticks right_ticks]
%outputs: d  distance traveled in meters
%        dt angle rotated in radians 

    newLeft = new_ticks(1);
    newRight = new_ticks(2);

    oldLeft = old_ticks(1);
    oldRight = old_ticks(2);

    leftdiff = newLeft - oldLeft;
    rightdiff = newRight - oldRight;

    left = (2 * pi * 0.065/2 * leftdiff) / 370;

    right = (2 * pi * 0.065/2 * rightdiff) / 370;

    d = (left + right)  / 2;

    dth = (right - left) / 0.15; % assuming L is 2r

end