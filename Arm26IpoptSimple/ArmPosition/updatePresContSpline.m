
%Script:  updatePresContSpline
%
% This script updates the spline function in a prescribed controller
% (Has to be a script or OpenSim crashes when function completes)
%
% This function updates the prescribed controller with new control values.
% This allows for the control values to only need to be updated once for
% each integration (at the begining of the integration).  
% See add PrescribedController

numActuators=osimModel.getActuators.getSize;

for contCnt=1:numActuators  %Loop through the controllers (actuators)
    
    c=osimModel.getControllerSet.get(contCnt-1);  %Get Controller
    mycont=PrescribedController.safeDownCast(c); %Down cast it to a Prescribed Controller
    cFunc=mycont.get_ControlFunctions(0);  %Get the contol function
    myFunc=SimmSpline.safeDownCast(cFunc.get(0));  %Down Cast it to a Simm Spline
    
    % xValues are already set - Assumed
    
    for pCnt=1:size(P,1)  %Loop through the points and update the spline values
        myFunc.setY(pCnt-1,P(pCnt,contCnt));
    end
    
    
end



