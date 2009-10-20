	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// Mission loader - list all missions and load them
	// -----------------------------------------------
	if (!isServer) exitWith{};

	private [
		"_position"
		];

	sleep 10;

	// global variables initilisation
	wcgroupindex = 0;
	wcgroupcount = 0;
	wccounttotalunit = 0;
	wcmissionclear = true;

	// declaration de toutes les missions utilisables
	for "_x" from 0 to wcnumberofmissions do {
		call compile format["mission%1 = compile preprocessFile 'missions\mission%1.sqf';", _x];
	};

	WC_fnc_definemission = {
		_missionnumber = wcmissions call BIS_fnc_selectRandom;
		wcmissions = wcmissions - [_missionnumber];
		_missionnumber = 16;
		_missionnumber;
	};

	// creation du trigger qui declenche les missions
	// si wcmissionclear = true alors on cree une nouvelle mission
	// la mission utilise par defaut est la 0
	_position = [0,0,0];
	_missiontrg = createTrigger["EmptyDetector", _position]; 
	_missiontrg setTriggerArea[5,5,0,false];
	_missiontrg setTriggerActivation["NONE","PRESENT", true];
	_missiontrg setTriggerStatements["wcmissionclear", "
		nil = call WC_fnc_deletemarker;		
		call compile format['nil = [] spawn mission%1;', [] call WC_fnc_definemission];
	", ""];

	onPlayerConnected call WC_fnc_publishmission;

	wcinitialised = true;
	publicvariable "wcinitialised";