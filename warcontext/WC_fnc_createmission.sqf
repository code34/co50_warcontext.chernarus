	// -----------------------------------------------
	// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// -----------------------------------------------
	if (!local player) exitWith {};

	sleep 10;

	waituntil {(!isnil ("wclevel") and wclevel > 0)};
	waituntil {(!isnil ("wclevelmax") and wclevelmax > 0)};
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
	_trgintro = createTrigger["EmptyDetector",_position]; 
	_trgintro setTriggerArea[5,5,0,false];
	_trgintro setTriggerActivation["NONE","PRESENT",true];
	_trgintro setTriggerStatements["local player", "", ""];
	_trgintro setTitleEffect ["TEXT", "PLAIN", _title];

	PAPABEAR=[West,"HQ"]; PAPABEAR SideChat (wcmission select 0);