	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// -----------------------------------------------
	if (!isServer) exitWith{};
	if (wcparadropcurrently >= 1) exitWith{};

	wcparadropcurrently = wcparadropcurrently + 1;

	private [
		"_array",
		"_position",
		"_destinationposition",
		"_missionend",
		"_vehicle",
		"_pilot",
		"_group",
		"_marker",
		"_markername",
		"_leader",
		"_scriptinit",
		"_crew",
		"_trgparadrop"
	];

	_marker = _this select 0;

	_trgparadrop = createTrigger["EmptyDetector", getmarkerpos _marker];
	_trgparadrop setTriggerArea[300, 300, 0, false];
	_trgparadrop setTriggerActivation["WEST", "PRESENT", TRUE];
	_trgparadrop setTriggerStatements["this", "", ""];

	sleep 120;

	if (count (list _trgparadrop) < 3) exitWith{ deletevehicle _trgparadrop;};
	deletevehicle _trgparadrop;

	_markername = format["%1ups", _marker];
	_destinationposition = [_marker] call WC_fnc_createpositioninmarker;

	_position = [wcmaptopright, wcmapbottomleft] call WC_fnc_createposition;

	_array = [_position, 0, "Mi17_medevac_RU", east] call BIS_fnc_spawnVehicle;
	_vehicle = _array select 0;
	_crew = _array select 1;
	_pilot = _crew select 0;
	_vehicle flyInHeight 150;
	[_vehicle] spawn EXT_fnc_vftcas;
	_vehicle setVariable ['togarbage', true, true];
	{
		_x setVariable ['togarbage', true, true];
	}foreach _crew;

	_vehicle lock true;

	_units = ["RUS_Soldier_Marksman", "RUS_Soldier_Marksman","RUS_Soldier_Marksman","RUS_Soldier_Marksman","RUS_Soldier_Marksman","RUS_Soldier_Marksman","RUS_Soldier_Marksman","RUS_Soldier_Marksman","RUS_Soldier_Marksman", "RUS_Soldier_Marksman","RUS_Soldier_Marksman","RUS_Soldier_Marksman","RUS_Soldier_Marksman","RUS_Soldier_Marksman"];
	_group = [_position,  east, _units, [], [],[wcskill,wcskill,wcskill]] call BIS_fnc_spawnGroup;

	{
		_x moveincargo _vehicle;
		_x setVariable ['togarbage', true, true];
	}foreach (units _group);

	_missionend = false;
	while { !_missionend } do {
		if ([(position _vehicle) select 0, (position _vehicle) select 1] distance _destinationposition > wctriggersize) then {
			_pilot doMove _destinationposition;
		} else {
			{
				if(driver _vehicle != _x) then {
					if (group _x != group (driver _vehicle)) then {
						unassignVehicle _x;
						_x action ["eject", _vehicle];
						sleep 1;
					};
				};
			} foreach (units _group);
			_vehicle flyInHeight 300;
			_pilot doMove (getmarkerpos "GARBAGE");
		};
		if((position (leader _group)) select 2 < 1) then {
			_scriptinit = format["nil = [this, '%1', 'noslow'] execVM 'extern\ups.sqf';", _markername];
			_leader = leader _group;
			_leader setVehicleInit _scriptinit;
			processInitCommands;
		};
		sleep 4;
	};

	wcparadropcurrently = 0;

	true;
