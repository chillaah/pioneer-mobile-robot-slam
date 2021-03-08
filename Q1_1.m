%% Write the configuration of the vehicle (1x3 vector) in units of metres and degrees.

Q = [1.3, 2.1, 40]; % [x y theta]


%% Write a 3x3 homogeneous transformation matrix that describes the pose of this robot 
% with respect to the world coordinate frame.

TR = [ cos(Q(3)) -sin(Q(3)) Q(1)
       sin(Q(3))  cos(Q(3)) Q(2)
               0          0    1 ];
           

%% Write a 3x3 homogeneous transformation matrix that describes the pose of the sensor 
% with respect to the world coordinate frame.


% Sensor with respect to robot
Q2 = [0.4, -0.15, -8];

% homogenous transformation matrix from sensor with respect to robot
SR = [ cos(Q2(3)) -sin(Q2(3)) Q2(1)
       sin(Q2(3))  cos(Q2(3)) Q2(2)
                0           0     1 ];
            
TS = TR * SR; % from world to robot and then from robot to sensor


%% Write the position of the navigation target relative to the sensor in polar 
% coordinate form as a 2x1 vector  (in units of metres and degrees, respectively)

PP = [sqrt(106)/2 87.05]; % double check this and everything else