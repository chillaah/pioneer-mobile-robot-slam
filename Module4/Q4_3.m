%mode 0: runs the full simulation.
%mode 1: runs a landmarks initialisation step. 
%mode 2: runs a prediction step.
%mode 3: runs an update step.
function [output] = myFunction(mode)  
    load_data();  
    % Initialization of the robot pose.
    mu =   [0;0;0*pi/180];
    Sigma =diag([0.1 0.1 0.1*pi/180]).^2;
    
    switch mode
        case 0        
            % this simulator runs for 100 steps
            nsteps = 100;
            % the covariance of the process and measurements noise. 
            R = diag([0.5 50*pi/180]).^2;
            Q = diag([0.5, 5*pi/180]).^2;
            % main loop
            for k = 1:nsteps
               %This function returns the distance travelled (d)
               % and the change in angle (dth) between time step k-1 and k.
               [d,dth]  = get_odom(k);    
               % complete the prediction step in the body of the function below
               [mu,Sigma] = predict_step(mu,Sigma,d,dth,R);
                % The sensor measurements to all the landmarks at the 
                % current time step. z is a matrix of shape nx2 
                % where n is the number of landmarks in the map. 
                % The first column in z is the range (m) and
                % the second column is the bearing (rad).
                z          = sense(k);
                
                if k == 1
                    % We use the sensor readings from the first time step 
                    % to initialise all the landmarks in the map. 
                    % this function takes:
                    %   z : The sensor measurements to all the landmarks 
                    %        at the current time step.
                    %   Q: the covariance of the measurements
                    %   mu: contains the predicted pose of the robot
                    % The function returns mu and Sigma after initializing
                    % all the landmarks
                    [mu, Sigma] = initLandmarks(z,Q,mu,Sigma);             
                else                    
                   for i=1:length(z)
                        % i is the id of a landmark
                        % zi  is the range and bearing to landmark i
                        zi     = z(i,:);
                        
                        % this function takes:
                        %   i: id of landmark
                        %   zi: the range and nearing to landmark i
                        %   Q: the covariance of the measurements
                        %   mu,Sigma: the current estimate of the pose of the robot and the map.
                        %   
                        % The function returns mu and Sigma after performing
                        % an update step using the sensor readings of
                        % landmark i                        
                        [mu, Sigma] = update_step(i,zi,Q,mu,Sigma);                        

                   end

                end   
                %******************************* the code below is just for plotting  
                if k == nsteps
                    grid on; axis equal;
                    axis([-2 5 -2 5]);
                    hold on
                    plot_robot(mu)
                    plot_cov(mu,Sigma,3,'b')
                    for i=1:length(z)
                        lidx = 3+2*i;
                        li = mu(lidx-1:lidx);
                        scatter(li(1),li(2),'b+');
                        lSigma = Sigma(lidx-1:lidx,lidx-1:lidx);
                        plot_cov(mu(lidx-1:lidx),lSigma,3,'g');
                    end
                end
            end
            plot_map();             
            output = [mu,Sigma];
        case 1
            Q = diag([0.5, 5*pi/180]).^2;                           
            z          = sense(1);
            [mu, Sigma] = initLandmarks(z,Q,mu,Sigma);
            output = [mu,Sigma];
        case 2            
            R = diag([0.5 50*pi/180]).^2;
            [d,dth]  = get_odom(1);    
            [mu,Sigma] = predict_step(mu,Sigma,d,dth,R);
            output = [mu,Sigma];
        case 3
            Q = diag([0.5,3*pi/180]).^2;
            R = diag([0.5 50*pi/180]).^2;
            [d,dth]  = get_odom(1);    
            [mu,Sigma] = predict_step(mu,Sigma,d,dth,R);
            z          = sense(1);
            [mu, Sigma] = initLandmarks(z,Q,mu,Sigma);            
            
            [d,dth]  = get_odom(2);    
            [mu,Sigma] = predict_step(mu,Sigma,d,dth,R);
            z          = sense(2);
            
            grid on; axis equal;
            axis([-2 5 -2 5]);
            hold on
            plot_robot(mu)
            plot_cov(mu,Sigma,3,'b')
            for i=1:length(z)
                zi     = z(i,:);  
                [mu, Sigma] = update_step(i,zi,Q,mu,Sigma);
                lidx   = 3 + i*2 -1;
                lSigma = Sigma(lidx:lidx+1,lidx:lidx+1);
                plot_cov(mu(lidx:lidx+1),lSigma,3,'g');                
                scatter(mu(lidx),mu(lidx+1),50,'b+');   
            end
            output = [mu,Sigma];            
    end    
end


% --------------- complete the three functions below


% This function takes:
%     mu,Sigma: the current estimate of the pose of the robot and the map.
%     as well as the odometry information (d the distance travelled from time step k-1 and k and dth, the change of heading) 
%     and the matrix R (the covariance of the odometry noise). 
% The function performs a prediction step of the EKF localiser and returns the mean and covariance of the robot pose and the map.   
% note: although the prediction step does not change the estimation 
%      of the landmarks in the map, this function accepts the full state space
%      and only alter the pose of the robot in it.
function [mu,Sigma] =predict_step(mu,Sigma,d,dth,R)
  
    % function accepts current pose, distance travelled and change in
    % heading angle to output the next pose
    % mu has 13 elements in SLAM
    % decompose
    pose = mu(1:3);
    remainder = mu(4:end);
    mu = [ move(pose, d, dth);
                remainder     ];
    
    % angle
    angle = mu(3);
    
    % Jx is the jacobian w.r.t. to the state variables of the next pose
    JxStep = [ 1 0 -d*sin(angle);
               0 1  d*cos(angle);
               0 0       1       ];
    
    % Ju is the jacobian w.r.t. to the input variables of the next pose
    JuStep = [ cos(angle) 0;
               sin(angle) 0;
                   0      1 ];
    
    % full Jx jacobian for SLAM
    numLand = size(Sigma, 1) - size(pose, 1);
    paddingZeros = zeros(size(JxStep, 1), numLand);
    paddingOnes = eye(numLand);
    JxSLAM = [        JxStep  paddingZeros;
               paddingZeros'   paddingOnes ];
           
   % full Ju jacobian for SLAM
   paddingZeros2 = zeros(numLand, size(JuStep, 2));
   JuSLAM = [        JuStep;
              paddingZeros2 ];
             
    % updating covariance matrix for SLAM
    Sigma = JxSLAM * Sigma * JxSLAM' + JuSLAM * R * JuSLAM'; 
    
end
% We use the sensor readings from the first time step 
% to initialise all the landmarks in the map. 
% this function takes:
%   z : The sensor measurements to all the landmarks 
%        at the current time step.
%   Q: the covariance of the measurements
%   mu,Sigma: the current estimate of the robot pose and the map (the map will be empty so the size of mu is 3x1 and Sigma 3x3).
% The function returns mu and Sigma after initialising (if n is the number of landmarks, the function returns mu of size (3+2n)x1 and Sigma of size (3+2n)x(3+2xn))
% all t he landmarks
function [mu, Sigma] = initLandmarks(z,Q,mu,Sigma)

    % looping over landmarks
    iter = size(z, 1);
    for i = 1:iter

        % decompose
        pose = mu(1:3);
        xr = pose(1);
        yr = pose(2);
        thetar = pose(3);

        % range and bearing measurements
        range = z(i, 1);
        bearing = z(i, 2);

        % landmark initialization
        % expanding state vector with map coordinates
        % of new landmark
        totAng = wrapToPi(thetar + bearing);
        xlnew = xr + range * cos(totAng);
        ylnew = yr + range * sin(totAng);
        lnew = [ xlnew;
                 ylnew ];
        mu = [   mu;
               lnew ];

        % jacobian of the landmark initialization 
        % function w.r.t to range and bearing
        Lz = [ cos(totAng) -range * sin(totAng);
               sin(totAng)  range * cos(totAng) ];

        % sensor noise covariance
        LQL = Lz * Q * Lz';

        % padding covariance
        paddingZeros = zeros(size(Sigma, 1), size(lnew, 1));
        Sigma = [         Sigma  paddingZeros;
                  paddingZeros'           LQL ];
    end

end

% this function takes:
    %  landmarkID: id of a landmark
    %   zi: the range and nearing to this landmark 
    %   Q: the covariance of the measurements
    %   mu,Sigma: the current estimate of the robot pose and the map.
    %   
    % The function returns mu and Sigma after performing
    % an update step using the sensor readings of
    % the landmark   
function [mu, Sigma] = update_step(landmarkID,zi,Q,mu,Sigma)
   
    % decompose
    pose = mu(1:3);
    xr = pose(1);
    yr = pose(2);
    thetar = pose(3);
    lands = 2 * landmarkID;
    posy = lands + size(pose, 1);
    posx = lands + size(pose, 1) - 1;
    
    % landmark positions
    xl = mu(posx);
    yl = mu(posy);
    
    % range and bearing measurement model
    h = [  sqrt((xr-xl)^2 + (yr-yl)^2);
          atan2(yl-yr, xl-xr) - thetar ];
    h(2) = wrapToPi(h(2));
    r = h(1);
    
    % left G matrix
    Gleft = [  -(xl-xr)/r    -(yl-yr)/r   0;
              (yl-yr)/r^2  -(xl-xr)/r^2  -1 ];
    
    % right G matrix
    Gright = [    (xl-xr)/r    (yl-yr)/r;
               -(yl-yr)/r^2  (xl-xr)/r^2 ];
            
    % G matrix in SLAM
    limitMid = lands - size(pose, 1) + 1;
    limitEnd = limitMid + size(pose, 1);
    paddingZeros = zeros(size(Gleft, 1), size(Sigma, 1) - size(pose, 1)); 
    Gslam = [ Gleft, paddingZeros(:, 1:limitMid), Gright,...
                     paddingZeros(:, limitEnd:end)          ];
    
    % kalman gain
    K = Sigma * Gslam' * (Gslam * Sigma * Gslam' + Q)^-1;
    
    % mean in SLAM
    cal = (zi' - h)';
    cal(2) = wrapToPi(cal(2));
    mu = mu + K * [ cal(1);
                    cal(2) ];
    
    % covariance in SLAM
    I = eye(length(K));
    Sigma = (I - K * Gslam) * Sigma;   
    
end

% ----------------------------
% write the extra functions that you need and call them in the three functions above

function nextpose = move(pose, d, dth)

    nextpose =  [ pose(1) + d * cos(pose(3));
                  pose(2) + d * sin(pose(3));
                    wrapToPi(pose(3) + dth)  ];
    
end
