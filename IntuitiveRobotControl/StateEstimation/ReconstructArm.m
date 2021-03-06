function pointsd =  ReconstructArm(shoulder, linkRot)
%% ===========================Reconstruct Arm==============================
% RoboHAZMAT: Senior Design Project
% Motion Control Team
% Gerardo Bledt
% January 2, 2015
%
% Reconstructs the user's arm positioning from the rotated link estimates.

% Estimate user's arm positions in 3D 
elbow = [shoulder(1,1) + linkRot(1,1),...
    shoulder(1,2) + linkRot(1,2),shoulder(1,3) + linkRot(1,3)];
upperArmOri = [elbow(1,1) + linkRot(2,1),...
    elbow(1,2) + linkRot(2,2),elbow(1,3) + linkRot(2,3)];
wrist = [elbow(1,1) + linkRot(3,1),...
    elbow(1,2) + linkRot(3,2),elbow(1,3) + linkRot(3,3)];
hand = [wrist(1,1) + linkRot(4,1),...
    wrist(1,2) + linkRot(4,2),wrist(1,3) + linkRot(4,3)];

% Calculates the desired points for the robot arm
pointsd(:,3) = [elbow';1];
pointsd(:,4) = [elbow';1];
pointsd(:,5) = [wrist';1];
pointsd(:,6) = [hand';1];
pointsd(:,7) = [upperArmOri';1];
pointsd(:,8) = [hand';1];

drawnow