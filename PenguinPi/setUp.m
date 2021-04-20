%% Enter IP address shown on robot
IP = '192.168.50.5';

%Initialise robot
pb = PiBot(IP);

%% Get image 
img = pb.getImageFromCamera(); %captures an image and assigns it to the variable 'img'
imshow(img); % show image


%% Move Robot + Encoders
%Forward 2sec
pb.setMotorSpeeds(35,35); % Motor powers from 0-100
pause(2)
pb.getMotorTicks()% To see the current encoder count
% outputs (MotorA counts, MotorB counts) 

%Back
pb.setMotorSpeeds(-35,-35);
pause(2)
pbgetMotorTicks()

%Stop
pb.setMotorSpeeds(0,0)
