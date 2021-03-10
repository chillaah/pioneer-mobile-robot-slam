% EGB439 Prac Solution Development Template

% Use this template to develop your solution to the EGB439 prac.
% Do NOT submit this file. 


% Instructions:

% 1. Start the simulation manually and ensure it is in realtime mode.

% 2. Edit the port number to match the port that the remote API is running
%    on. 

PORT=19997;
robot = MyRobot(PORT);
fprintf("Connected! ID: %d\n", robot.getClientID());

% 3. Don't forget to add the location of your solution function,
%   the remote API files, and the MyRobot.m file using 'addpath'

% 4. Edit the name of the function to match the name of your solution
%   function. Eg 
%   prac2n12345678(robot) if your student number is n12345678

prac2n12345678(robot);

% After you are happy with your solution, 
% submit the file prac2[yourstdnumber].m to BlackBoard