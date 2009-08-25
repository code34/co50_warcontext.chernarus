// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// Mission loader - list all missions and load them
// -----------------------------------------------
if (!isServer) exitWith{};

private [
	"_position"
	];

		// global variables initilisation
		wcgroupindex = 0;
		wcgroupcount = 0;
		wccounttotalunit = 0;
		wcmissionclear = true;
	
		// declaration de toutes les missions utilisables
		for "_x" from 0 to wcnumberofmissions do {
			call compile format["mission%1 = compile preprocessFile 'missions\mission%1.sqf';", _x];
		};

		_missionnumber = [0, wcnumberofmissions] call BIS_fnc_randomInt;
		_missionnumber = 0;

		// creation du trigger qui declenche les missions
		// si wcmissionclear = true alors on cree une nouvelle mission
		// la mission utilise par defaut est la 0
		_position = [0,0,0];
		_missiontrg = createTrigger["EmptyDetector", _position]; 
		_missiontrg setTriggerArea[5,5,0,false];
		_missiontrg setTriggerActivation["NONE","PRESENT", true];
		call compile format ["_missiontrg setTriggerStatements[""wcmissionclear"", ""
			nil = call WC_fnc_deletemarker;
			wcmissionclear = false;
			wcskill = wcskill + 0.05;
			wclevel = wclevel + 1;
			publicvariable 'wclevel';
			nil = [] spawn mission%2;
		"", """"];", wclevel, _missionnumber];

		onPlayerConnected call WC_fnc_publishmission;

		wcinitialised = true;
		publicvariable "wcinitialised";