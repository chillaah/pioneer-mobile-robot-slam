% Make sure to name your function correctly; otherwise, the automatic marking script will not assign you the mark. 
% For example, if your student number is n12345678 and this is a solution for Prac 2, 
% then you should name this function prac2n12345678

function prac2n10454012(robot)
	% The function needs to start with the following call; 
	%otherwise, your code will not run during automarking.
	robot.powerON();
    
    V = 2*pi/15;
    [lWv, rWv] = practical2(V);
    robot.setMotorVel(lWv, rWv);
    
%     RAL = 0.331; % robot axle length
%     R = 1; % length from center to middle of axle (radius)
%     
%     RL = R - RAL/2; % radius from center to left wheel
%     RR = R + RAL/2; % radius from center to right wheel
%     
%     CL = 2 * pi * 0.0975; % circumference of left wheel
%     CR = 2 * pi * 0.0975; % circumference of right wheel
%     
%     ROTL = 2 * pi * RL / CL; % number of rotations by left wheel
%     ROTR = 2 * pi * RR / CR; % number of rotations by right wheel
%     
%     T = 15; % time to complete
%     
%     DPSL = (ROTL * 360) / T; % degrees per second of left wheel
%     DPSR = (ROTR * 360) / T; % degrees per second of right wheel
%     
%     ANGVELL = DPSL * pi/180; % radians per second of left wheel
%     ANGVELR = DPSR * pi/180; % radians per second of right wheel
    
%     robot.setMotorVel(ANGVELL, ANGVELR) % move robot anti-clockwise
    
%     LINVELL = RL * ANGVELL; % meters per second of left wheel
%     LINVELR = RR * ANGVELR; % meters per second of right wheel
%     
%     ANGVEL = norm([ANGVELL ANGVELR]); % total angular velocity
%     LINVEL = norm([LINVELL LINVELR]); % total linear velocity
%     
%     disp(' ');
%     disp(ANGVEL); disp('rad/s');
%     disp(' ');
%     disp(' ');
%     disp(LINVEL); disp('m/s');

	%The function needs to end with the following calls; 
	%otherwise, your code will not run during automarking.
	pause(3)
	robot.powerOFF();
	disp("**********END************");
end    


