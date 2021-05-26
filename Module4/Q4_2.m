function [output] = myFunction(mode)    
    load_data();  
    
    switch mode
        % case 0 test the full simulation whereas case 1 and 2 test only one step. 
        case 0        
            % this simulator runs for 50 steps
            nsteps = 50;
            % the map is not given, plotting is just to tell us how
            % accurate is our solution 
            plot_map();           
            % the covariance of the measurements noise. 
            Q = diag([0.5,3*pi/180]).^2;
            % 
            mu = [];
            Sigma = [];            
            for k = 1:nsteps
                % the true pose is given
                xr          = ask_the_oracle(k);    
                plot_robot(xr)    
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
                    %   xr: the true pose of the robot [x;y;theta].
                    % The function returns mu and Sigma after initializing
                    % all t he landmarks
                    [mu, Sigma] = initLandmarks(z,Q,xr);
                else                    
                    for i=1:length(z)
                        % i is the id of a landmark
                        % zi  is the range and bearing to landmark i
                        zi     = z(i,:);
                        
                        % this function takes:
                        %   i: id of landmark
                        %   zi: the range and nearing to landmark i
                        %   Q: the covariance of the measurements
                        %   mu,Sigma: the current estimate of the map.
                        %   xr: the true pose of the robot [x;y;theta].
                        % The function returns mu and Sigma after performing
                        % an update step using the sensor readings of
                        % landmark i                        
                        [mu, Sigma] = update_step(i,zi,Q,mu,Sigma,xr);                        
                        
                        if k == nsteps
                            lidx   = i*2 -1;
                            lSigma = Sigma(lidx:lidx+1,lidx:lidx+1);
                            plot_cov(mu(lidx:lidx+1),lSigma,3);                
                            scatter(mu(2*i-1),mu(2*i),200,'k+');                                        
                        end
                    end
                end                
            end
            output = [mu,Sigma];
        case 1
            Q = diag([0.5,3*pi/180]).^2;
            xr          = ask_the_oracle(1);                
            z          = sense(1);
            [mu, Sigma] = initLandmarks(z,Q,xr);
            output = [mu,Sigma];
        case 2
            Q = diag([0.5,3*pi/180]).^2;
            xr          = ask_the_oracle(1);                
            z          = sense(1);
            [mu, Sigma] = initLandmarks(z,Q,xr);
            
            xr          = ask_the_oracle(1);
            z          = sense(2);  
            plot_map();
            plot_robot(xr)
            for i=1:length(z)
                zi     = z(i,:);
                [mu, Sigma] = update_step(i,zi,Q,mu,Sigma,xr);
                lidx   = i*2 -1;
                lSigma = Sigma(lidx:lidx+1,lidx:lidx+1);
                plot_cov(mu(lidx:lidx+1),lSigma,3);                
                scatter(mu(2*i-1),mu(2*i),200,'k+');   
            end
            output = [mu,Sigma];            
    end    
end
% ---------------
function [mu, Sigma] = initLandmarks(z,Q,xr)
% robot pose vector xr - x, y, theta
% covariance matrix Q
% z has range and bearings

    % initally empty
    Sigma = [];
    mu = [];
    
    % assigning motion
    posx = xr(1);
    posy = xr(2);
    postheta = xr(3);
    
    % looping over each beacon
    numBeacs = size(z,1);
    for i = 1:numBeacs
        
        % range and bearing
        range = z(i,1);
        bearing = z(i,2);
        
        % angle
        ang = bearing + postheta;
        
        % dist
        x = range * cos(ang);
        y = range * sin(ang);
        
        % matrix
        muCol = [ posx + x;
                  posy + y ];
        
        % mu output
        mu = [    mu;
               muCol ];
        
        % cross matrix
        N = zeros(size(Sigma,1), 2);
        
        % rot mat
        L = [ x/range -y;
              y/range  x ];
        
        sigmaDiag = L * Q * L';
        
        % sigma output
        Sigma = [ Sigma         N;
                     N' sigmaDiag ];
        
    end  
    
end 
function [mu, Sigma] = update_step(landmarkID,zi,Q,mu,Sigma,xr)
    
    % assigning motion
    posx = xr(1);
    posy = xr(2);
    postheta = xr(3);
    
    % landmarks
    land = 2 * landmarkID;
    yl = mu(land); xl = mu(land - 1);
    
    % range and bearing measurement model
    range = sqrt((posx - xl)^2 + (posy - yl)^2);
    bearing = atan2(yl - posy, xl - posx) - postheta;
    h = [  range;
          bearing ]';
    h(2) = wrapToPi(h(2));
    
    % G matrix
    r = h(1);
    G = [    (xl-posx)/r        (yl-posy)/r;
          -(yl-posy)/(r^2)  (xl-posx)/(r^2) ];
    
    % cross  matrix
    N = zeros(2, length(Sigma));
    
    % G update
    pre = N(:, 1:land-2);
    post = N(:, land+1:end);
    G = [ pre, G, post ];

    % kalman gain
    K = Sigma * G' * (G * Sigma * G' + Q)^-1;

    % mean
    cal = (zi - h)';
    cal(2) = wrapToPi(cal(2));
    mu = mu + K * cal;
    
    % covariance
    I = eye(length(K));
    Sigma = (I - K * G) * Sigma; 
    
end
% -----------Add your functions below this line and use them in the two functions above---

