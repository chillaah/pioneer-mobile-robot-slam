% In Grader, we will load the data for you
% init;
close all; clear; clc
% when developing offline, you need to load one of the data files 
load map1r1.mat


% In Grader, we give you the number of steps. 
% num_steps = get_numsteps();

% When developing offline, the number of steps is the length of the run
% you loaded 
num_steps = length(data);

% In Grader, at t=1 the robot starts at x=0.4060, y=0.1800, theta=0.1244 rad; 
% mu is 3x1
% mu = [0.4060;0.1800;0.1244];
% When developing offline, mu at time t = 1 is the pose from the first time step
mu = [data(1).pose.x; data(1).pose.y ; data(1).pose.theta];

% you can choose sigma at t=1
Sigma = diag([0.1 0.1 5*pi/180]).^2; 

% estimate the pose of the robot at each time step and store it in trj_est 
trj_est = zeros(num_steps,3);

% estimate the position of the beacons and stor it in M_est
% M_est(i,:) = [beacon_id, beacon_x,beacon_y,variance_x,variance_y,covariance_xy]. 
M_est = zeros(5,6);

%The first pose is known
trj_est(1,:) = mu;

% set R and Q to improve accuracy
R = diag([0.05 40*pi/180]).^2;
Q = diag([0.3 20*pi/180]).^2;

% initialize M_est
M_est = zeros(5,6);
M_est(:,1) = [30; 27; 57; 45; 39];
beacon_ids = M_est(:,1);

% set a starting array
starting_array = zeros(1, 5);

% Robot specs from week 9
N = 370;
r_wheel = 0.0325;
axel_wheel = 0.16;

oldticks = [0 0];

for t =2:num_steps
    % move
    % In Grader, you have to use the function get_encoders(time_step).
    % new_ticks = get_encoders(t);    
    % when working offline, use 
    newticks = data(t).encoders;
    dt = newticks - oldticks;
    oldticks = newticks;
    
    dist = 2*pi*r_wheel*dt/N;
    d = mean(dist);
    right_value = dist(2);
    left_value = dist(1);
    dth = (right_value - left_value) / axel_wheel;
    
    [mu,Sigma] = predict_step(mu, Sigma, d, dth, R);
    
    % sense
    % In Grader, you get the image using the function get_image(time_step);
    % I = get_image(t);
    % when working offline you use
    I = data(t).image;
    Z = sense(I);
    
    z = zeros(5, 2);
    
    if ~isempty(Z)
        [~,index] = ismember(Z(:,1),beacon_ids,'rows');
        z(index,:) = Z(:,2:3);
        
        for j = 1:length(index)
            if starting_array(index(j))
                [mu,Sigma] = update_step(index(j), z(index(j),:), Q, mu, Sigma);
            
            elseif ~starting_array(index(j))
                [mu, Sigma] = initLandmarks(z, Q, mu, Sigma);
                
                starting_array(index(j)) = 1;
            end
        end
    end 

    trj_est(t,:) = mu(1:3);
    for j = 1:size(M_est,1)
        M_est(j,2:3) = mu(2*j+2:2*j+3); 
        out = Sigma(2*j+2:2*j+3,2*j+2:2*j+3);
        M_est(j,4) = out(1);
        M_est(j,5) = out(end);
        M_est(j,6) = out(2);
    end 
   
end
% write your helper functions below
function [mu,Sigma] = predict_step(mu,Sigma,d,dth,R)
    Sigma_size = size(Sigma);
    mu(1:3) = mu(1:3) + [d*cos(mu(3)); d*sin(mu(3));dth];
    % page 34/45 Module 4
    % Lecture Topic 3.3-Extended KF
    
    % Jacobian matrix 
    Jx = [1 0 -d*sin(mu(3));
        0 1 d*cos(mu(3));
        0 0 1];
    Ju = [cos(mu(3)) 0;
        sin(mu(3)) 0;
        0 1];
    
    if Sigma_size ~= [3 3]
        I = eye(10);
        Jx = blkdiag(Jx,I);
        Ju = [Ju;zeros(10,2)];
        Sigma = Jx*Sigma*Jx' + Ju*R*Ju';
    end
    
    Sigma = Jx*Sigma*Jx' + Ju*R*Ju';
 
end


function [mu, Sigma] = initLandmarks(z,Q,mu,Sigma)

    mu_length = length(mu);
    for i = 1:length(z)
    
        xr = mu(1);
        yr = mu(2);
        theta_r = mu(3);
    
        r = z(i,1);
        B = z(i,2);
        
        if r == 0 && mu_length == 3
            mu(2*i+2:2*i+3) = 0;
            Sigma(2*i+2:2*i+3,2*i+2:2*i+3) = 0;
        
        elseif r == 0 && mu_length ~= 3
            mu(2*i+2:2*i+3) = mu(2*i+2:2*i+3);
        
        else
    
            lnew = [xr + r * cos(theta_r + B); ...
                yr + r * sin(theta_r + B)];
            mu(2*i+2:2*i+3) = lnew;

            Lz = [cos(theta_r + B) -r*sin(theta_r + B); ...
                sin(theta_r + B)  r*cos(theta_r + B);];
            Sigma(2*i+2:2*i+3,2*i+2:2*i+3) = Lz*Q*Lz';
        end 
    end
end 

function [mu, Sigma] = update_step(landmarkID,zi,Q,mu,Sigma)

    % Lecture Topic 3.3-Extended KF
    % calculate range and bearing
    % get land mark and co-ordinations
    xr = mu(1);
    yr = mu(2);
    theta_r = mu(3);

    i = landmarkID;
    i_l = i*2+3-1;
    xl = mu(i_l);
    yl = mu(i_l+1);
    r = sqrt((xr-xl)^2 + (yr-yl)^2);

    landmarks_num = (length(mu)-3) / 2;

    G = [ (xl-xr)/r    (yl-yr)/r  ; -(yl-yr)/r^2  (xl-xr)/r^2];
    zeros_temp_before = zeros(2,(i-1)*2);
    zero_temp_after = zeros(2,(landmarks_num-i)*2);
    G = [zeros_temp_before G zero_temp_after];
    G = [[-(xl-xr)/r   -(yl-yr)/r    0; (yl-yr)/r^2 -(xl-xr)/r^2 -1], G];
    K = (Sigma * G')/(G * Sigma * G' + Q);
   
    h = [sqrt((xr-xl)^2 + (yr-yl)^2); ...
        atan2(yl-yr, xl-xr) - theta_r];
    h(2) = wrapToPi(h(2));

    % Calculate the difference and wrap the angle to [-pi pi]
    delta =  zi' - h;
    delta(2) = wrapToPi(delta(2));

    % Calculate mu and Sigma
    mu = mu + K * delta;
    Sigma = (eye(size(Sigma)) - K * G) * Sigma;

end

function Z = sense(I)
    [r, g, b] = find_chromacity(I);
    redBW = r > 0.6;
    blueBW = b > 0.4;
    yellowBW = r > 0.4 & g > 0.4;
    
    try
        redblobs = regionprops(redBW);
        blueblobs = regionprops(blueBW);
        yellowblobs = regionprops(yellowBW);
        
        red_areas = cat(1,redblobs.Area);
        blue_areas = cat(1,blueblobs.Area);
        yellow_areas = cat(1,yellowblobs.Area);
        
        red_bboxs = cat(1,redblobs.BoundingBox);
        blue_bboxs = cat(1,blueblobs.BoundingBox);
        yellow_bboxs = cat(1,yellowblobs.BoundingBox);
        
        red_centroids = cat(1,redblobs.Centroid);
        blue_centroids = cat(1,blueblobs.Centroid);
        yellow_centroids = cat(1,yellowblobs.Centroid);
        
        [red_bounds,~,~,~] =  bwboundaries(redBW);
        [blue_bounds,~,~,~] = bwboundaries(blueBW);
        [yellow_bounds,~,~,~] = bwboundaries(yellowBW);
    catch 
        Z = [];
        return
    end
    
    % Check if one blob per colour
    if length(red_areas) < 1 || length(blue_areas) < 1 || length(yellow_areas) < 1
        Z = [];
        return
    end

    Z = [];
    
    red_noise = find(red_areas < 30);
    blue_noise = find(blue_areas < 30);
    yellow_noise = find(yellow_areas < 30);
      
    red_areas(red_noise) = [];
    blue_areas(blue_noise) = [];
    yellow_areas(yellow_noise) = [];
    
    red_bboxs(red_noise,:) = [];
    blue_bboxs(blue_noise,:) = [];
    yellow_bboxs(yellow_noise,:) = [];
    
    red_centroids(red_noise,:) = [];
    blue_centroids(blue_noise,:) = [];
    yellow_centroids(yellow_noise,:) = [];
    
    red_bounds(red_noise) = [];
    blue_bounds(blue_noise) = [];
    yellow_bounds(yellow_noise) = [];
    
    beacon_ids = [27; 30; 39; 45; 57];
    
    for i = 1:2
        [~,red_noise] = max(red_areas);
        [~,blue_noise] = max(blue_areas);
        [~,yellow_noise] = max(yellow_areas);
        
        blobs = [red_bboxs(red_noise,2) blue_bboxs(blue_noise,2) yellow_bboxs(yellow_noise,2)];
        heights = [red_bounds(red_noise); blue_bounds(blue_noise); yellow_bounds(yellow_noise)];
        centroids = [red_centroids(red_noise,:) ; blue_centroids(blue_noise,:) ; yellow_centroids(yellow_noise,:)];
        
        [~, ind] = sort(blobs);
        ind = fliplr(ind);
        
        if (isempty(ind) ~= 1)        
            colourString = {'01' '10' '11'};
            bins = cell2mat(colourString(ind));

            dec = bin2dec(bins);
            index = find(beacon_ids==dec);
            
            if (isempty(index) ~= 1)
                top = cell2mat(heights(ind(1)));
                bottom = cell2mat(heights(ind(3)));
                img_height = max(top(:,1)) - min(bottom(:,1))+2;
                img_x = centroids(ind(2),1);
                RangeAndBearing = GetRangeAndBearing(img_height, img_x);
                
                result = zeros(1,3);
                result(1) = dec;
                result(2) = RangeAndBearing(1);
                result(3) = RangeAndBearing(2);
                
                Z = [Z ; result];
            end 
        end 
        
        
        % Check if one blob per colour
        if length(red_areas) < 1 || length(blue_areas) < 1 || length(yellow_areas) < 1
            return
        end
              
    end 
   

end
% write all your helper functions below and call them inside the function sense

function [redChannel,greenChannel,blueChannel] = find_chromacity(img)
    img = double(img);
    imgTotal = img(:,:,1) + img(:,:,2) + img(:,:,3);
    
    % Get red, green and blue
    redChannel = img(:,:,1)./imgTotal;
    greenChannel = img(:,:,2)./imgTotal;
    blueChannel = img(:,:,3)./imgTotal;
    
end

function z = GetRangeAndBearing(height, position)
    w_cam = 320;         
    h_cam = 240;
    f = 3.6 * 10^-3;  
    aov = deg2rad(62.2);   
    h_beacon = 0.15;  
    h_sensor = 2.74 * 10^-3;

    % Calculate distance
    range = h_beacon * f * h_cam / (height * h_sensor) ;

    % Calculate angle
    angle_temp = (position - (w_cam/2)) / (w_cam/2);
    bearing = -(aov/2) * angle_temp;

    % Return values
    z = [range; bearing];

end


