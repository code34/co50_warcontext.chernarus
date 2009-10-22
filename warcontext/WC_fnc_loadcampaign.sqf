	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// Campaign Loader
	// -----------------------------------------------
	if (!isServer) exitWith{};

	private [
		"_campaignnumber"
		];

	sleep 10;

	// global variables initilisation
	wcgroupindex = 0;
	wccounttotalunit = 0;
	//wccurrentmission = 14;
	//wcmissionok = true;

	wcmissionclear = true;

	// Compile All missions
	for "_x" from 0 to wcnumberofmissions do {
		call compile format["mission%1 = compile preprocessFile 'missions\mission%1.sqf';", _x];
	};

	// Compile All campaigns
	for "_x" from 0 to wcnumberofcampaigns do {
		call compile format["campaign%1 = compile preprocessFile 'campaign\campaign%1.sqf';", _x];
	};

	WC_fnc_definemission = {
		private ["_nextmissionnumber"];
		if (isnil "wccurrentmission") then {
			_nextmissionnumber = (wccampaign select 0) select 0;
		}else{
			_nextmissionnumber  = [] call WC_fnc_searchnextmission;
		};
		_nextmissionnumber;
	};

	WC_fnc_searchnextmission = {
		private ["_nextmissionnumber"];
		{
			if (_x select 0 == wccurrentmission) then {
				if (wcmissionok) then {
					_nextmissionnumber = (_x select 1) select 0;
				} else {
					_nextmissionnumber = (_x select 1) select 1;
				};
			};
		}foreach wccampaign;
		if (_nextmissionnumber == -1 ) then {wclevel = wclevelmax + 1;};
		_nextmissionnumber;
	};

	// Select a random campaign
	_campaignnumber = wccampaigns call BIS_fnc_selectRandom;
	call compile format['
		wccampaign = [] call campaign%1;
		nil = [nil,nil,rHINT, wccampaignname] call RE;
	', _campaignnumber];

	// creation du trigger qui declenche les missions
	// si wcmissionclear = true alors on cree une nouvelle mission
	// la mission utilise par defaut est la 0
	_position = [0,0,0];
	_missiontrg = createTrigger["EmptyDetector", _position]; 
	_missiontrg setTriggerArea[5,5,0,false];
	_missiontrg setTriggerActivation["NONE","PRESENT", true];
	_missiontrg setTriggerStatements["wcmissionclear", "
		nil = call WC_fnc_deletemarker;		
		call compile format['
			nil = [] spawn mission%1; 
			wccurrentmission = %1;
			 ', [] call WC_fnc_definemission];
	", ""];

	onPlayerConnected call WC_fnc_publishmission;

	wcinitialised = true;
	publicvariable "wcinitialised";