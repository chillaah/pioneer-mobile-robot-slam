function plotTraj(x, y, theta)

    % lines
    linex = [ 0.1;
                 0;
                 1 ];

    liney = [    0;
              0.1;
                 1 ];

    % rotational matrix
    rot = [ cos(theta) -sin(theta) x;
            sin(theta)  cos(theta) y;
                     0           0 1 ];

    % new position
    transx = rot * linex;
    transy = rot * liney;

    % new position plot
    plotx = [transy(1), x, transx(1)];
    ploty = [transy(2), y, transx(2)];

    % plot
    plot(plotx(1:2), ploty(1:2), 'b');
    plot(plotx(2:3), ploty(2:3), 'r');

end