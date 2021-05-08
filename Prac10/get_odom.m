function [d, dth] = get_odom(new_ticks, old_ticks)

    newLeft = new_ticks(1);
    newRight = new_ticks(2);

    oldLeft = old_ticks(1);
    oldRight = old_ticks(2);

    leftdiff = newLeft - oldLeft;
    rightdiff = newRight - oldRight;
    
    % N - number of ticks per rotation = 370
    % D - robot wheel diameter [m] = 0.065
    % L - robot wheels axis [m] = 0.15 = 2 * R
    left = (2 * pi * 0.065/2 * leftdiff) / 370;

    right = (2 * pi * 0.065/2 * rightdiff) / 370;

    d = (left + right) / 2;

    dth = (right - left) / 0.15;

end