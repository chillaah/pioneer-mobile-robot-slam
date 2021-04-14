classdef MyRobot 
    properties (SetAccess = private)
        sim
        clientID
        robot_handle
        ori_handle
        lm_handle
        rm_handle
        cameraHandle
        PORT        
    end    
    properties (SetAccess = public) 
        arenaImgWidth
        arenaImgHeight
    end    
    methods
        function obj = MyRobot(PORT)
            
             sim=remApi('remoteApi');
             sim.simxFinish(-1);
             clientID = sim.simxStart('127.0.0.1',PORT,true,true,5000,5);
            
            if clientID <0
                
               error("Failed connecting to server at %s : %d",'127.0.0.1',PORT) 
            else
                obj.PORT = PORT;
                obj.clientID = clientID;
                obj.sim = sim;
       
                [~,obj.ori_handle]   = sim.simxGetObjectHandle(obj.clientID,'midAxelPoint',obj.sim.simx_opmode_blocking);
                [~,obj.lm_handle]    = obj.sim.simxGetObjectHandle(obj.clientID,'lMotor',obj.sim.simx_opmode_blocking);
                [~,obj.rm_handle]    = obj.sim.simxGetObjectHandle(obj.clientID,'rMotor',obj.sim.simx_opmode_blocking);
                [~,obj.cameraHandle] = obj.sim.simxGetObjectHandle(obj.clientID,'Localiser_Camera', obj.sim.simx_opmode_oneshot_wait);

                
                obj.sim.simxGetObjectPosition(obj.clientID,obj.ori_handle,-1,obj.sim.simx_opmode_streaming);
                obj.sim.simxGetObjectOrientation(obj.clientID,obj.ori_handle,-1,obj.sim.simx_opmode_streaming);

                % TODO START STREAMING CAMERA
                res = obj.sim.simxAddStatusbarMessage(obj.clientID,'Robot connected!',obj.sim.simx_opmode_oneshot);
                obj.arenaImgWidth = 128;
                obj.arenaImgHeight = 128;
                

                % Todo start streaming joint positions
                obj.sim.simxGetJointPosition(obj.clientID,obj.lm_handle,obj.sim.simx_opmode_streaming);
                obj.sim.simxGetJointPosition(obj.clientID,obj.rm_handle,obj.sim.simx_opmode_streaming);

                obj.sim.simxAddStatusbarMessage(obj.clientID,'Robot connected!',obj.sim.simx_opmode_oneshot);
                obj.sim.simxGetPingTime(obj.clientID);
            end
        end
        %
        function delete(obj)
            obj.sim.simxFinish(obj.clientID);
            obj.sim.delete();             
        end
        
        function status =isConnected(obj)
            ID = obj.sim.simxGetConnectionId(obj.clientID);            
            status = true;
            if ID == -1
                status= false ;
            end
        end
        
        function ID =getClientID(obj)
            ID = obj.clientID;           
        end
       
        % Gets an image of the arena
        % The image will be a WxHx3 matrix of type uint8.
        
        % You may wish to view the image directly with imshow(img),
        % then cast the image tensor to a double for further processing.
        
        % The image will be affected by noise and possibly other
        % aberrations.
        function img=getArenaImage(obj)
           [~, resolution, img] = obj.sim.simxGetVisionSensorImage2(obj.clientID, obj.cameraHandle, 0,obj.sim.simx_opmode_oneshot_wait);
        end
        
        function [ret1,ret2] = setMotorVel(obj,leftMW,rightMW)            
             ret1 = obj.sim.simxSetJointTargetVelocity(obj.clientID,obj.lm_handle, leftMW,obj.sim.simx_opmode_oneshot);
             ret2 = obj.sim.simxSetJointTargetVelocity(obj.clientID,obj.rm_handle, rightMW,obj.sim.simx_opmode_oneshot);            
        end
        
        function [x,y,theta] = getTruePose(obj)
            [~,robot_position]=obj.sim.simxGetObjectPosition(obj.clientID,obj.ori_handle,-1,obj.sim.simx_opmode_buffer);
            [~,robot_orientation]=obj.sim.simxGetObjectOrientation(obj.clientID,obj.ori_handle,-1,obj.sim.simx_opmode_buffer);
            x = robot_position(1);
            y = robot_position(2);
            theta = robot_orientation(3);            
        end
        
        function [lticks,rticks] = getMotorTicks(obj)
            % GETMOTORTICKS returns current tick count for the left and right motors
            % there are 360 ticks per revolution
            % the ticks can become negative if robots reverse for more than 5m
            [~,lticks]  = obj.sim.simxGetJointPosition(obj.clientID,obj.lm_handle,obj.sim.simx_opmode_buffer);
            [~,rticks]  = obj.sim.simxGetJointPosition(obj.clientID,obj.rm_handle,obj.sim.simx_opmode_buffer);
            lticks = 5000 + round(lticks * 180 / pi);
            rticks = 5000 + round(rticks * 180 / pi);
        end
        
        % Get the time in seconds since the simulation started
        function [simTime] = getSimTime(obj)
            % Get sim time at start of function call            
            obj.sim.simxGetPingTime(obj.clientID);
            t0 = obj.sim.simxGetLastCmdTime(obj.clientID); % milliseconds
            simTime = t0/1000;
        end
        
        function synchronousMode(obj, turnOn)
            % Put simulation into synchronous mode
            if turnOn
                obj.sim.simxSynchronous(obj.clientID,true);
                disp("Simulation is now in synchronous mode! You must call stepSim to advance the physics engine");
            else
                disp("Simulation is now in asynchronous mode.")
            end
        end
        
        % Step the simulation until 'milliseconds' of in-simulation time
        % have elapsed.
        % ONLY USE IF SIMULATION IS IN SYNCHRONOUS MODE
        function stepSim(obj, milliseconds)
            
            if mod(milliseconds, obj.simStep) ~= 0
                warning("Desired step time is not divisible by simulation step. Wait time will be clipped to nearest simulation step")
                milliseconds = milliseconds - mod(milliseconds, obj.simStep);
            end
            
            % Get sim time at start of function call
            % TODO Is ping the best command to use?
            obj.sim.simxGetPingTime(obj.clientID);
            t0 = obj.sim.simxGetLastCmdTime(obj.clientID); % milliseconds
            
            % Compute future finish time
            tN = t0 + milliseconds;
            
            % Number of times the simulation has to step
            simStepsRequired = milliseconds/ obj.simStep;
            
            % Step the simulation
            simStepSeconds = obj.simStep/1000;
            for i=1:simStepsRequired
                obj.sim.simxSynchronousTrigger(obj.clientID);
                pause(simStepSeconds)
            end
            
        end        
        
        function powerON(obj)
            % This function is used by the automarker
        end
        
        function powerOFF(obj)
            % This function is used by the automarker
        end
        
    end
end