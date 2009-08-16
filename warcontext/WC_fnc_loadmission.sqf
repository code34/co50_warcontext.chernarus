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

		wcmissionnumber = [0, wcnumberofmissions] call BIS_fnc_randomInt;
		wcmissionnumber = 8;

		// creation du trigger qui declenche les missions
		// si wcmissionclear = true alors on cree une nouvelle mission
		// la mission utilise par defaut est la 0
		_position = [0,0,0];
		wcmissiontrg = createTrigger["EmptyDetector", _position]; 
		wcmissiontrg setTriggerArea[5,5,0,false];
		wcmissiontrg setTriggerActivation["NONE","PRESENT", true];
		call compile format ["wcmissiontrg setTriggerStatements[""wcmissionclear"", ""
			wcmissionclear = false;
			wcskill = wcskill + 0.05;
			wclevel = wclevel + 1;
			publicvariable 'wclevel';
			nil = [] spawn mission%2;
		"", """"];", wclevel, wcmissionnumber];

		onPlayerConnected call WC_fnc_publishmission;