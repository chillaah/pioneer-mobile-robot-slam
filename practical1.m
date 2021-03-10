%% EGB439 Practical 1

close all; clear; clc

sim = remApi('remoteApi'); % using ther prototype file

sim.simxFinish(-1); % just in case, close all opened connections

clientID = sim.simxStart('127.0.0.1', 19999, true, true, 5000, 5);

if (clientID > -1)
    
    disp('Connected to remote API server');
    
    [returnCodelm, lm_handle] = sim.simxGetObjectHandle(clientID, 'lMotor', sim.simx_opmode_blocking);
    
    [returnCoderm, rm_handle] = sim.simxGetObjectHandle(clientID, 'rMotor', sim.simx_opmode_blocking);
    
    radius = 0.0975;
    
    circumference = 2 * pi * radius;
    
    distance = 1;
    
    rotations = distance / circumference;
    
    degreesPerSecond = (rotations * 360) / 10;
    
    time = 10;
    
    sim.simxSetJointTargetVelocity(clientID, lm_handle, degreesPerSecond * pi/180, sim.simx_opmode_oneshot);
    
    sim.simxSetJointTargetVelocity(clientID, rm_handle, degreesPerSecond * pi/180, sim.simx_opmode_oneshot);
    
    pause(time);
    
    sim.simxSetJointTargetVelocity(clientID, lm_handle, 0, sim.simx_opmode_oneshot);
    
    sim.simxSetJointTargetVelocity(clientID, rm_handle, 0, sim.simx_opmode_oneshot);
    
else
    
    disp('Failed connecting to remote API server');
    
end

sim.delete(); % call the destructor!
