function collide = collision_check(q)
    % q is a 1x3 vector containing the robot configuration with elements x, y and theta (in degrees)
    % collide is true if the robot intersects any of the obstacles, otherwise it is false
   
    % robot config
    pos_x = q(1);
    pos_y = q(2);
    pos_theta = q(3);
    
    % robot dim
    wide = 1.5;
    long = 3;
    
    % obstacles
    topObstacle = [ 5  6;
                    5 10;
                    6 10;
                    6  6 ];
                
    leftObstacle = [ 2 5;
                     2 7;
                     3 7;
                     3 5 ];

    bottomObstacle = [ 5 0;
                       5 4;
                       6 4;
                       6 0 ];
                   
    % obstacle polyshapes
    topObs = polyshape(topObstacle);
    leftObs = polyshape(leftObstacle);
    bottomObs = polyshape(bottomObstacle);

    % obstacle plot
    figure();
    hold on
    xlim([0 10]);
    ylim([0 10]);
    plot(topObs, 'FaceColor', 'r');
    plot(leftObs, 'FaceColor', 'r');
    plot(bottomObs, 'FaceColor', 'r');
    
    % configuration
    config = [ -long/2 -wide/2;
               -long/2  wide/2;
                long/2  wide/2;
                long/2 -wide/2 ];
            
    scale = [pos_x, pos_y];       
    robot = config + scale;

    % robot rotation
    config2 = [long/2, wide/2];
    mark = robot(1, :) + config2;
    robotShape = rotate(polyshape(robot), pos_theta, mark);
    
    % robot plot
    plot(robotShape, 'FaceColor', 'k');
    grid on
    box on
    hold off
    
    % intersection check
    obs = [topObs, leftObs, bottomObs];
    c = 0;
    for j = 1:length(obs)
        
        PG = intersect(obs(j), robotShape);
        if PG.NumRegions > 0
            c = c + 1;
        end
        
    end
    
    % collision condition
    if c > 0
        collide = true;
    else
        collide = false;
    end
end