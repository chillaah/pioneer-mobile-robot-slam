%% Q1.3

% The maximum steering angle in degrees

L = 2.5; % wheel base length
RB = 6; % minimum turning radius (back wheel)
MS = atan2d(L,RB);

% the radius of the arc of the reference point of the car in metres

Gamma = 12; % new steering angle
RB_new = L/tand(Gamma); % radius of car w.r.t. back wheel
R = RB_new;

% coordinate of the ICR in meters as a 2x1 vector

Q = [20 30 30];
O_to_R = [ cosd(Q(3)) -sind(Q(3)) Q(1)
           sind(Q(3))  cosd(Q(3)) Q(2)
                    0           0    1 ];
Pos_R = [ 0; 
         -R; 
          1 ]; % pos in robot frame

ICR_hom = O_to_R * Pos_R; % ICR homogenous position

ICR = [ ICR_hom(1);
        ICR_hom(2) ];

% rotational speeed of right front wheel with respect to left front wheel in revolutions per minute

DS = 0;

