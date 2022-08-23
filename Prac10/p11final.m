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

%% submit from here for grader

% covariance matrices
Q = [ 0.31^2, 0;
      0, 0.35^2];

R = [ 0.051^2, 0;
      0, 0.7^2  ];

% beacon id's
beacs = [ 30, 27, 57, 45, 39 ]';
beacsCol = 1;
M_est(:, beacsCol) = beacs;
arr = zeros(1, 5);

old_ticks = [ 0, 0 ];

for t = 2:num_steps

    % move
    new_ticks = data(t).encoders;
    
    [d,dth] = get_odom(new_ticks,old_ticks);
    
    old_ticks = new_ticks;
    
    [mu,Sigma] = predict_step(mu, Sigma, d, dth, R);
    
    % sense
    I = data(t).image;
    
    Z = sense(I);
    
    z = zeros(5, 2);
    val = 3;
    valn = val-1;
    ordering = 'rows';
    
    % check Z
    log = isempty(Z);
    if log == false
        
        [~, k] = ismember(Z(:,1), beacs, ordering);
        z(k, :) = Z(:, valn:val);
        for j = 1:length(k)
            
            logic = arr(k(j));
            
            switch logic
                
                case true
                    [mu,Sigma] = update_step(k(j), z(k(j),:), Q, mu, Sigma);
                    
                case false
                    [mu, Sigma] = initLandmarks(z, Q, mu, Sigma);
                    arr(k(j)) = 1;
            end
        end
    end 
    
    % arrange M
    for j = 1:size(M_est,1)
        
        len = j * 2;
        start = len + valn;
        stop = len + val;
        
        M_est(len/2, valn:val) = mu(start:stop); 
        value = Sigma(start:stop, start:stop);
        
        mat = [ value(1), value(end), value(2) ];
        M_est(j, 4:6) = mat;
        
    end 
   
    % trajectory
    trj_est(t,:) = mu(1:3);
    
end

% final output
disp(M_est);

function [d,dth] = get_odom(new_ticks,old_ticks)

    left = (2*pi*0.065*0.5*(new_ticks(1)-old_ticks(1)))/370;
    right = (2*pi*0.065*0.5*(new_ticks(2)-old_ticks(2)))/370;
    d = mean(0.5*(left+right));
    dth = (right-left)/0.16;

end

function npose = move(cpose,d,dth)

    cx = cpose(1);
    cy = cpose(2);
    ct = cpose(3);
    nx = cx+d*cos(ct);
    ny = cy+d*sin(ct);
    nt = ct+dth;
    npose = [ nx, ny, nt ]';
    
end

function [mu,Sigma] = predict_step(mu,Sigma,d,dth,R)

   mu(1:3) = move(mu(1:3),d,dth);
    
   Ju = [cos(mu(3)) 0;
         sin(mu(3)) 0;
             0      1];

    Jx = [1 0 -d*sin(mu(3));
          0 1  d*cos(mu(3));
          0 0       1      ];
    

    check = isequal(size(Sigma), [3 3]);
    
    switch check
        
        case 1
    
            Sigma = Jx*Sigma*Jx' + Ju*R*Ju';
        
        case 0
        
            pad = zeros(10,2);
            Ju = [    Ju;
                     pad];

            Jx = blkdiag(Jx, eye(size(pad,1)));

            % covariance twice
            Sigma = Jx*Sigma*Jx' + Ju*R*Ju';
            Sigma = Jx*Sigma*Jx' + Ju*R*Ju';
    
    end
    
end

function [mu, Sigma] = initLandmarks(z,Q,mu,Sigma)
    
    niter = size(z,1);
    mulen = length(mu);
    
    % looping
    for i = 1:niter
        
        ranCol = 1;
        bearCol = 2;
        ran = z(i,ranCol);
        bear = z(i,bearCol);
        
        val = 3;
        valn = val - 1;
        len = i * 2;
        
        start = len + valn;
        stop = len +val;
        
        if isequal(ran,0) && isequal(mulen,val)
            
            mu(start:stop) = 0;
            Sigma(start:stop, start:stop) = 0;
        
        elseif isequal(ran,0) && ~isequal(mulen,val)
            
            mu(start:stop) = mu(start:stop);
        
        else
            
            angg = bear + mu(3);
    
            lN(1) = cos(angg)*ran+mu(1);
            lN(2) = sin(angg)*ran+mu(2);
            
            lN = lN';
                
            mu(start:stop) = lN;

            Lfinal = [cos(angg) -ran*sin(angg);
                      sin(angg)  ran*cos(angg)];
            
            Lf = Lfinal * Q * Lfinal';
            Sigma(start:stop, start:stop) = Lf;
            
        end 
        
    end
    
end 

function [mu, Sigma] = update_step(landmarkID,zi,Q,mu,Sigma)
    
    val = 3;
    valn = val - 1;
    num = valn + 2 * landmarkID;
    numl = (length(mu) - val) / valn;
    numle = numl-landmarkID;
    
    % range
    r1 = mu(num) - mu(1);
    r2 = mu(2) - mu(num + 1);
    ran = sqrt((r1)^2 + (r2)^2);
    
    % G matrix
    rx = ran * ran;
    G = [(mu(num) - mu(1))/ran     (mu(num + 1) - mu(2))/ran;
         -(mu(num + 1) - mu(2))/rx      (mu(num) - mu(1))/rx];
    
    pad1End = num - 4;
    pad2End = 2 * numle;
    pad1 = zeros(2, pad1End);
    pad2 = zeros(2, pad2End);
    
    G = [ pad1, G, pad2 ];
    sepG = [-(mu(num)-mu(1))/ran,    -(mu(num+1)-mu(2))/ran,  0;
            (mu(num+1)-mu(2))/ran^2, -(mu(num)-mu(1))/ran^2, -1];
    Gfin = [ sepG, G ];
    Kgain = Sigma * Gfin' * mpower((Gfin * Sigma * Gfin' + Q), -1);
   
    h(1) = sqrt((mu(1)-mu(num))^2 + (mu(2)-mu(num+1))^2);
    h(2) = wrapToPi(atan2(mu(num+1)-mu(2), mu(num)-mu(1)) - mu(3));
    
    change =  (zi - h)';
    change = [ change(1);
              wrapToPi(change(2)) ];

    mu = mu + Kgain * change;
    I = eye(13);
    Sigma = (I - Kgain * Gfin) * Sigma;

end

function Z = sense(I)
    
    img = double(I);
    imtot = img(:,:,1) + img(:,:,2) + img(:,:,3);
    
    r = img(:,:,1) ./ imtot; g = img(:,:,2) ./ imtot; b = img(:,:,3) ./ imtot;
    
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
        
        if length(red_areas) < 1 || length(blue_areas) < 1 || length(yellow_areas) < 1
            return
        end
              
    end

end

function z = GetRangeAndBearing(height, position)

    w_cam = 320;         
    h_cam = 240;
    f = 3.6 * 10^-3;  
    aov = deg2rad(62.2);   
    h_beacon = 0.15;  
    h_sensor = 2.74 * 10^-3;

    range = h_beacon * f * h_cam / (height * h_sensor) ;

    angle_temp = (position - (w_cam/2)) / (w_cam/2);
    bearing = -(aov/2) * angle_temp;

    z = [range; bearing];

end
