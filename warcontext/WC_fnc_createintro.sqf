// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// create an intro on client side
// -----------------------------------------------
	//if (local player) exitWith {};
	waituntil {(!isnil ("wcmissionname"))};
	
	// creer un trigger qui affiche un texte au depart des missions
	_position = [0,0,0];
	_title = "Mission: " + wcmissionname + " by " + wcmissionauthor;
	trgintro = createTrigger["EmptyDetector",_position]; 
	trgintro setTriggerArea[5,5,0,false];
	trgintro setTriggerActivation["NONE","PRESENT",true];
	trgintro setTriggerStatements["local player", "", ""];
	trgintro setTitleEffect ["TEXT", "PLAIN", _title];