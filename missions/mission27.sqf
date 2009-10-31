	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: CLEAR ZONE
	// -----------------------------------------------
	if (!isServer) exitWith{};

	wcmissionauthor ="=[A*C]=Lueti";
	wcmissionname = "Naufrageurs";
	wcmissiondescription = "A pirates' band takes advantage of the instability for wrecked the commercial ships which pass in the wide. We have to prevent them from continuing.";
	wcmissiontarget = "Pirates camp";

	_arrayofposition = [
			[13623,3173,0],
			[14009,11281,0]
	];

	_position = _arrayofposition call BIS_fnc_selectRandom;

	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;

	for "_i" from 1 to 5 do {
		_position = [(_position select 0) + 5, _position select 1];
		call compile format["_veh%1 = 'ACamp' createVehicle _position;", _i];
	};

	_units = ["GUE_Worker2","GUE_Woodlander3","GUE_Villager3","GUE_Woodlander2","GUE_Woodlander1","GUE_Villager4"];
	_group1 = [_position, east, _units, [], [],[wcskill,wcskill,wcskill]] call BIS_fnc_spawnGroup;
	_group2 = [_position, east, _units, [], [],[wcskill,wcskill,wcskill]] call BIS_fnc_spawnGroup;

	_markername = "Pirates camp";
	_markersize = 300;
	nil = [_markername, _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;

	_position = [(_position select 0) -10, (_position select 1) - 10];
	nil = "Land_Campfire_burning" createvehicle _position;

	_flag = ['piratescamp', 0.5, _position, 'ColorRed', 'ICON', 'FDIAGONAL', 'Flag', 0, 'Pirates camp'] call WC_fnc_createmarker;

	_trgmission = createTrigger["EmptyDetector", _position]; 
	_trgmission setTriggerArea[wctriggersize, wctriggersize, 0, false];
	_trgmission setTriggerActivation["GUER","NOT PRESENT", false];
	_trgmission setTriggerStatements["this or count thislist < 2", "
		wcsuccess = true; 
		publicvariable 'wcsuccess'; 
		wcsuccess = false;
		nil = [nil,nil,rHINT,'Pirates are down !'] call RE;
		wcmissionok = true;
		wcmissionclear = true;
	", ""];