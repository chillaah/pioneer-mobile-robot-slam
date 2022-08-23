function [d, dth] = get_odom(new_ticks, old_ticks)

    left = (2*pi*0.065*0.5*(new_ticks(1)-old_ticks(1)))/370;
    right = (2*pi*0.065*0.5*(new_ticks(1)-old_ticks(1)))/370;
    d = 0.5 * (left+right);
    dth = (right-left)/0.15;

end