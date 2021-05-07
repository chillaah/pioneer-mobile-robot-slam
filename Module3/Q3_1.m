num_steps = 35;
init(num_steps);
% x_mu is the mean of the probability normal distribution of 
% the robot initial position at time t =0. 
x_mu     = 0; 
% x_sigma is the standard deviation of the normal distribution
%of the robot position.
x_sigma = 0.15; % 15 cm
% step_sigma is the standard deviation of executing the 25 cm motion command
step_sigma = 0.1; % 10 cm
% step is the step length
step = 0.25; % 25 cm step
% z_sigma is the standard deviation of measurement around the true value of the range to the wall
z_sigma = 0.30; % 30 cm 
% trajectory is a list of the positions of the robot from the 35 steps
trajectory = [];
trajectory_sigma = [];
for t = 1:num_steps    
    [x_mu_predict, x_sigma_predict]= predict_step(x_mu,x_sigma,step,step_sigma);
    % use the function read_range to read a measurement at the current time step 
    z = read_range(t);
    [x_mu,x_sigma] = update_step(x_mu_predict, x_sigma_predict,z,z_sigma);  
    trajectory = [trajectory, x_mu];
    trajectory_sigma = [trajectory_sigma,x_sigma];
end

% predict
function [x_mu,x_sigma] = predict_step(x_mu,x_sigma,step_length,step_sigma)

    matA = 1; matB = 1;
    x_mu = matA * x_mu + matB * step_length;
    x_sigma = matA * x_sigma * matA';
    
end

% update
function [x_mu,x_sigma] = update_step(x_mu,x_sigma,z,z_sigma)

    matH = 1; matK = 1;
    x_mu = x_mu + (matK * z - matK * matH * x_mu);
    x_sigma = x_sigma * eye(size(x_sigma)) - x_sigma * matK * matH;
    
end

% for t = 1:num_steps    
%     [x_mu_predict, x_sigma_predict]= predict_step(x_mu,x_sigma,step,step_sigma);
%     % use the function read_range to read a measurement at the current time step 
%     z = read_range(t); % return a scalar (distance from wall)
%     
%     [x_mu,x_sigma] = update_step(x_mu_predict, x_sigma_predict,z,z_sigma);  
%     
%     trajectory = [trajectory, x_mu];
%     
%     trajectory_sigma = [trajectory_sigma,x_sigma];
% end
% 
% 
% function [x_mu,x_sigma] = predict_step(x_mu,x_sigma,step_length,step_sigma)
%     A = 1; 
%     B = 1;
%     u = step_length;
%     x_mu = A*x_mu + B*u;
%     x_sigma = A*x_sigma*A';
% end
% 
% function [x_mu,x_sigma] = update_step(x_mu,x_sigma,z,z_sigma)
%     H = 1;
%     K = 1;
%     I = eye(1);
%     x_mu = x_mu + K * (z-H*x_mu);
%     x_sigma = (I - K*H) * x_sigma;
% end