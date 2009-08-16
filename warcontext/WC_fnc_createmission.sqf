// -----------------------------------------------
// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// -----------------------------------------------
	if (!local player) exitWith {};

	waituntil {(!isnil ("wclevel"))};
	waituntil {(!isnil ("wcmission"))};
	waituntil {(!isnil ("wcmissionposition"))};
	waituntil {(!isnil ("wcmissionauthor"))};
	waituntil {(!isnil ("wcmissionname"))};
	
	// remet a jour le briefing
	// affiche un message indiquant le nombre de missions faites	
	hint format["New Mission defined. Mission : %1 / %2", wclevel, wclevelmax];
	call compile format["task%1 = player createSimpleTask ['objectif %1'];", wclevel];
	call compile format["task%1 setSimpleTaskDescription %2 ;", wclevel, wcmission];
	call compile format["task%1 setSimpleTaskDestination %2;", wclevel, wcmissionposition];

	_position = [0,0,0];
	_title = "Mission: " + wcmissionname + " by " + wcmissionauthor;
	trgintro = createTrigger["EmptyDetector",_position]; 
	trgintro setTriggerArea[5,5,0,false];
	trgintro setTriggerActivation["NONE","PRESENT",true];
	trgintro setTriggerStatements["local player", "", ""];
	trgintro setTitleEffect ["TEXT", "PLAIN", _title];