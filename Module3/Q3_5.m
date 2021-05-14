% load the measurements of the position of the point
%Z(2, time steps)
%z = Z(:,k) is the measurement at time k
%z = [x;y]
load('Z.mat')
update_rate = 1; % 1 Hz
dt          = 1.0 / update_rate; % time step
run_time    = 42; %  seconds
nSteps      = run_time * update_rate; % number of steps

% fill in A
A = [ 1 0 dt  0;
      0 1  0 dt;
      0 0  1  0;
      0 0  0  1 ];

% fill in B
B = [ (dt^2)/2        0;
             0 (dt^2)/2;
            dt        0;
             0       dt ];
B = B(:,2);

% what is u? Find it in the body of the question above
u = -9.81;

% process noise in the system
sigmaV = 3;        
R = [0.001     0         0            0;
        0      0.001     0            0;
        0      0      sigmaV^2        0;
        0      0         0         sigmaV^2];

% fill in H
H = [ 1 0 0 0; 
      0 1 0 0 ];

%initial guess
%muX = [x0 y0 vx0 vy0]';
muX = [0 0 10 10]';
SigmaX = 100 * eye(4);

% standard deviation of the measurements +- 35 m
% fill in Q
std = 35;
Q = [ std^2     0;
          0 std^2 ];

% the estimated trajectory
x_est = zeros(4,nSteps);
x_est(:,1) = muX;
x_sigma_est = cell(nSteps);
x_sigma_est{1} = SigmaX;
for i= 2:nSteps
    z = Z(:,i);
    
    % predict
    muX = A * muX + B * u;
    SigmaX = A * SigmaX * A' + R;
    
    % correct (or update) step
    K1 = SigmaX * H';
    K2 = H * SigmaX * H' + Q;
    K = K1 / K2;
    r = z - H * muX;
    
    muX = muX + K * r;
    SigmaX = (eye(4) - K * H) * SigmaX;
    
    % add the current estimate to the trajectory 
    x_est(:,i) = muX;
    x_sigma_est{i}   = SigmaX;
end

figure(1)
hold on
for i=1:length(x_est)
    plot_cov(x_est(1:2,i),x_sigma_est{i} , 3);
end
scatter(x_est(1,:),x_est(2,:),25,'k*');
legend("3 sigmas bound of estimated position")


%helping function to plot the covariance matrix on x and y as an ellipse at a given number of sigmas
function plot_cov(muX,SigmaX,number_of_sigmas)
SigmaX = SigmaX(1:2,1:2); 
muX = muX(1:2);
if(~any(diag(SigmaX)==0))
    [V,D] = eig(SigmaX);
    y = number_of_sigmas*[cos(0:0.1:2*pi);sin(0:0.1:2*pi)];
    el = V*sqrtm(D)*y;
    el = [el el(:,1)]+repmat(muX,1,size(el,2)+1);
    line(el(1,:),el(2,:));
end
end
