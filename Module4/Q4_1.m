%this function will test your implementation of the ekf-localiser 
%complete the two functions predict_step and update_step. Also, write any extra functions you need. 
% For example, you can write functions to calculate the jacobians.
function [output] = myFunction(mode)    
    load_data();  
    map = get_map();
    switch mode
        % case 0 test the full simulation whereas case 1 and 2 test only one step. 
        case 0        
            % this simulator run for 50 steps.
            nsteps = 50;        
            scatter(map(:,1),map(:,2),200,'k*');
            hold on
            % pose of the robo at time step 0
            x = [0 0 0]'; 
            % The initial covariance matrix on the robot pose
            S = diag([1 1 5*pi/180]).^2;
            % The covariance matrices of the process and the measurement noise 
            R = diag([.01 3*pi/180]).^2;
            Q = diag([.1 3*pi/180]).^2;
            % run for 50 steps
            for k = 1:nsteps
                [d,dth]  = get_odom(k);
                    
                [x,S] = predict_step(x,S,d,dth,R);
                % The sensor measurements to all the landmarks at the 
                % current time step. z is a matrix of shape nx2 
                % where n is the number of landmarks in the map. 
                % The first column in z is the range (m) and
                % the second column is the bearing (rad).    
                z = sense(k);
        
                [x,S] = update_step(map,z,x,S,Q);    
                
                plot_cov(x,S,3);     
                plot_robot(x,15)
            end
            output = [x,S];
        case 1
            x = [0 0 0]'; 
            S = diag([1 1 5*pi/180]).^2;
            R = diag([.01 3*pi/180]).^2; 
            [d,dth]  = get_odom(1);
            [x,S] = predict_step(x,S,d,dth,R);
            output = [x,S];        
        case 2
            Q = diag([.1 3*pi/180]).^2;
            x = [0 0 0]'; 
            S = diag([1 1 5*pi/180]).^2;
            z = sense(1);
            [x,S] = update_step(map,z,x,S,Q);
            output = [x,S]
    end    
end
      
% This function takes:
%     the mean, and a covariance matrix of the robot pose 
%     as well as the odometry information (d the distance travelled from time step k-1 and k and dth, the change of heading) 
%     and the matrix R (the covariance of the odometry noise). 
% The function performs a prediction step of the EKF localiser and returns the mean and covariance of the robot.      
function [xt,S] = predict_step(xt,S,d,dth,R)
    
    % function accepts current pose, distance travelled and change in
    % heading angle to output the next pose
    [xt, theta] = move(xt, d, dth);
    
    % Jx is the jacobian w.r.t. to the state variables of the next pose
    Jx = [ 1 0 -d*sin(theta);
           0 1  d*cos(theta);
           0 0       1       ];
    
    % Ju is the jacobian w.r.t. to the input variables of the next pose
    Ju = [ cos(theta) 0;
           sin(theta) 0;
               0      1 ];
    
    % updating covariance matrix
    S = Jx*S*Jx' + Ju*R*Ju';
    
end

   
% This function takes:
%     The location of all the landmarks (map)
%     The sensor readings of the range and bearing to all the landmarks in the map at the current time step.
%     The mean, and a covariance matrix of the robot pose
%     and the matrix Q (the covariance of the sensor noise). 
%
% The function performs an update step of the EKF localiser and returns the mean and covariance of the robot. 
function [x,S] = update_step(map,z,x,S,Q)

    % looping over all landmarks for each beacon
    for i = 1:size(z, 1)

        % landmark locations
        xl = map(i, 1);
        yl = map(i, 2);

        % range and bearing
        r = z(i, 1);
        % b = z(:, 2);

        % robot pose
        xr = x(1);
        yr = x(2);
        thetar = x(3);

        % G matrix
        G = [  -(xl-xr)/r    -(yl-yr)/r   0;
              (yl-yr)/r^2  -(xl-xr)/r^2  -1 ];

        % kalman gain
        K = S * G' * (G * S * G' + Q)^-1;

        % range and bearing measurement model
        h = [  sqrt((xr-xl)^2 + (yr-yl)^2);
              atan2(yl-yr, xl-xr) - thetar ]';
        h(2) = wrapToPi(h(2));

        % mean of the robot
        cal = (z(i, :) - h)';
        cal(2) = wrapToPi(cal(2));
        x = x + K * cal;
        x = [      x(1); 
                   x(2); 
              wrapToPi(x(3)) ];

        % covariance of the robot
        I = eye(length(K));
        S = (I - K * G) * S;

    end
     
end    

% ----------------------------
% write the extra functions that you need and call them in the above two functions

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

function plot_cov(x,P,nSigma)
    P = P(1:2,1:2); 
    x = x(1:2);
    if(~any(diag(P)==0))
        [V,D] = eig(P);
        y = nSigma*[cos(0:0.1:2*pi);sin(0:0.1:2*pi)];
        el = V*sqrtm(D)*y;
        el = [el el(:,1)]+repmat(x,1,size(el,2)+1);
        line(el(1,:),el(2,:));
    end
end