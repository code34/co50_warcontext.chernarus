	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// -----------------------------------------------
	if (!isServer) exitWith{};
	
	private [
		"_markername",
		"_markersize",
		"_position", 
		"_object",
		"_objindex",
		"_locations",
		"_i",
		"_fuelstations",
		"_vehicles",
		"_currentlocation",
		"_distance",
		"_location",
		"_locations"
		];

	 // GET CITIES
	_locations = nearestLocations [[7000,7000], ["NameCityCapital", "NameCity","NameVillage", "Name"], 20000];

	// Wait result of nearestlocations
	sleep 5;
	
	for "_x" from 1 to wctownnumbers do { 
		_location = _locations call BIS_fnc_selectRandom;
		wctownlocations = wctownlocations + [_location];
		_locations = _locations - [_location];
	};


	// CALL MAIN TARGET
	nil = [] spawn WC_fnc_liberateisland;

	// CREATE AIRPATROL
	{
		nil = [_x]  spawn WC_fnc_createairpatrol;
		sleep 0.5;
	}foreach wcenemyair;

	// create AA Site
	_locations = nearestLocations [[7000,7000], ["Hill"], 20000]; 
	_index = 0;
	{
		if( random 1 > wcaalevel) then {
			_position = position _x;
			_index = _index + 1;
			_target = "anti-air_ru1";
			_target = [_target, 0, _position] call EXT_fnc_createcomposition;
			_leader = leader _target;
			if(wcdebug or wcshowmarkers) then {
				[_leader, format["AA%1", _index], 0.5, 'ColorRed', 'ICON', 'FDIAGONAL', 30, 'AntiAir', 0 , 'AA SITE', true] spawn WC_fnc_attachmarker;
			} else {
				[_leader, format["AA%1", _index], 0.5, 'ColorRed', 'ICON', 'FDIAGONAL', 30, 'EMPTY', 0 , 'AA SITE', true] spawn WC_fnc_attachmarker;
			};
		};
		sleep 0.5;
	} foreach _locations;

	// REFRESH MARKERS
	WC_fnc_refreshmarker = {
		while {!wcgameend} do {
			{
				_position = getmarkerpos (_x select 0);
				(_x select 0) setMarkerPos _position;
				sleep 1;
			}foreach wcarraymarker;
			sleep 60;
		};
	};

	WC_fnc_randombonusevent = {
		while {!wcgameend} do {
			sleep 1800 + (random 1800);
			private ["_side", "_object"];
			_side = ["west", "east"] call BIS_fnc_selectRandom;
			_object = ["radar", "radio", "hospital"] call BIS_fnc_selectRandom;
			if (_side == "west") then {
				switch (_object) do {
					case "radar": { wcbonuseventW = [_object, wcradarE]; };
					case "radio": { wcbonuseventW = [_object, wcradioE]; };
					case "hospital": { wcbonuseventW = [_object, wchospitalE]; };
				};
				publicvariable "wcbonuseventW";
			} else {
				switch (_object) do {
					case "radar": { wcbonuseventE = [_object, wcradarW]; };
					case "radio": { wcbonuseventE = [_object, wcradioW]; };
					case "hospital": { wcbonuseventE = [_object, wchospitalW]; };
				};
				publicvariable "wcbonuseventE";
			};
		};
	};

	nil = [] spawn WC_fnc_refreshmarker;
	sleep 1;
	nil = [] spawn WC_fnc_randombonusevent;
	sleep 1;

	true;