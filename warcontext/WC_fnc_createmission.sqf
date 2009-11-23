	// -----------------------------------------------
	// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// -----------------------------------------------
	if (!local player) exitWith {};

	private [
		"_missiondescription", 
		"_missiontarget", 
		"_missionnumber", 
		"_missionname", 
		"_missionauthor", 
		"_missionposition", 
		"_mission"
		];

	sleep 10;

	waituntil {(!isnil ("wclevel") and wclevel > 0)};
	waituntil {(!isnil ("wclevelmax") and wclevelmax > 0)};

	if (side player == wcside) then {
		waituntil {(!isnil ("wcmissionW"))};
		wcmission = wcmissionW;
	} else {
		waituntil {(!isnil ("wcmissionE"))};
		wcmission = wcmissionE;
	};

	_missiondescription	= wcmission select 0;
	_missionname 		= wcmission select 1;
	_missiontarget		= wcmission select 2;
	_missionnumber 		= wcmission select 3;	
	_missionauthor 		= wcmission select 4;
	_missionposition 	= wcmission select 5;
	_mission = [_missiondescription, _missionname,_missiontarget];

	if(_missionnumber in wcmypersonnalmissionlist) exitWith {};
	wcmypersonnalmissionlist = wcmypersonnalmissionlist + [_missionnumber];

	// Update Briefing	
	hint format["New Mission defined. Mission : %1 / %2", wclevel, wclevelmax];
	call compile format["task%1 = player createSimpleTask ['objectif %1'];", _missionnumber];
	call compile format["task%1 setSimpleTaskDescription %2 ;", _missionnumber, _mission];
	call compile format["task%1 setSimpleTaskDestination %2;", _missionnumber, _missionposition];

	_title = "Chap: " + format["%1", _missionnumber] + " - "+_missionname + " by " + _missionauthor;
	_trgintro = createTrigger["EmptyDetector", _missionposition]; 
	_trgintro setTriggerArea[5,5,0,false];
	_trgintro setTriggerActivation["NONE","PRESENT", false];
	_trgintro setTriggerStatements["local player", "", ""];
	_trgintro setTitleEffect ["TEXT", "PLAIN", _title];

	if (side player == wcside) then {
		PAPABEAR=[West,"HQ"]; PAPABEAR SideChat (wcmission select 0);
	} else {
		PATRIA=[East,"HQ"]; PATRIA SideChat (wcmission select 0);
	};

	sleep 30;

	//wcmission = objNull;
	deletevehicle _trgintro;
	true;