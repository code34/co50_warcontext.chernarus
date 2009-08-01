// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// -----------------------------------------------
if (local server) exitWith {};

	sleep 10;

	_position = [0,0,0];
	_title = "Mission: " + wcmissionname + " by " + wcmissionauthor;
	trgintro = createTrigger["EmptyDetector",_position]; 
	trgintro setTriggerArea[5,5,0,false];
	trgintro setTriggerActivation["NONE","PRESENT",true];
	trgintro setTriggerStatements["local player", "", ""];
	trgintro setTitleEffect ["TEXT", "PLAIN", _title];