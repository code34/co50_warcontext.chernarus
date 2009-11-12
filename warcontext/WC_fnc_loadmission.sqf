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
	wccounttotalunit = 0;
	wcmissionclear = true;

	// declaration de toutes les missions utilisables
	for "_x" from 0 to wcnumberofmissions do {
		call compile format["mission%1 = compile preprocessFile 'missions\mission%1.sqf';", _x];
	};

	WC_fnc_definemission = {
		_missionnumber = wcmissions call BIS_fnc_selectRandom;
		wcmissions = wcmissions - [_missionnumber];
		_missionnumber;
	};

	onPlayerConnected call WC_fnc_publishmission;

	while {!wcgameend} do {
		if(wcmissionclear && wclevel <= wclevelmax) then {
			wcmissionclear = false;
			wclevel = wclevel + 1;
			publicvariable 'wclevel';
			nil = call WC_fnc_deletemarker;
			wccurrentmission = [] call WC_fnc_definemission;
			call compile format['nil = [] spawn mission%1;', wccurrentmission];
		};
		if(wclevel >  wclevelmax) then {
			wcgameend = true;
			publicvariable "wcgameend";
		};
		if(!wcinitialised) then {
			wcinitialised = true;
			publicvariable "wcinitialised";
		};
		sleep 60;
	};