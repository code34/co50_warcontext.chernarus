// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// MISSION TYPE: SEARCH
// -----------------------------------------------

	wcmissionauthor ="=[A*C]=Lueti";
	wcmissionname = "Return home";
	wcmissiondescription = "The refugees of the village of Pulkovo have to return at home, we can take charge of them no longer. 
	We are nevertheless going to go to check the village to be certain that they do not run a risk.";
	wcmissiontarget = "Pulkovo";

	_position = [4909,5616,0];
	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;

	_markername ="Pulkovo";
	_markersize = 250;
	nil = [_markername, _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;
	nil = [_markername] call WC_fnc_randomizegroup;
	

	_trg0 = createTrigger["EmptyDetector", _position]; 
	_trg0 setTriggerArea[wctriggersize, wctriggersize, 0, false];
	_trg0 setTriggerActivation["EAST","NOT PRESENT", false];

	_pos1 = [4989,5568,0];
	_trg1=createTrigger["EmptyDetector",_pos1]; 
	_trg1 setTriggerArea[5,5,0,false];
	_trg1 setTriggerActivation["West","PRESENT",true];

	_pos2 = [4953,5623,0];
	_trg2=createTrigger["EmptyDetector",_pos2]; 
	_trg2 setTriggerArea[5,5,0,false];
	_trg2 setTriggerActivation["West","PRESENT",true];

	_pos3 = [4907,5658,0];
	_trg3=createTrigger["EmptyDetector",_pos3]; 
	_trg3 setTriggerArea[5,5,0,false];
	_trg3 setTriggerActivation["West","PRESENT",true];

	_pos4 = [4866,5661,0];
	_trg4=createTrigger["EmptyDetector",_pos4]; 
	_trg4 setTriggerArea[5,5,0,false];
	_trg4 setTriggerActivation["West","PRESENT",true];

	_pos5 = [4917,5583,0];
	_trg5=createTrigger["EmptyDetector",_pos5]; 
	_trg5 setTriggerArea[5,5,0,false];
	_trg5 setTriggerActivation["West","PRESENT",true];

//comment faire pour que l'ensemble des 6 triggers soient validés pour basculer en "missionclear"?