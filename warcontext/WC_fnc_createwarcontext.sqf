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
		"_vehicles"
		];

	// get all cities on MAP
	_targetarray = [];
	_locations = nearestLocations [[7000,7000], ["NameCityCapital", "NameCity","NameVillage", "Name"], 20000]; 
	{
		_line = [position _x, text _x, 300, "Land_telek1"];
		_targetarray = _targetarray + [_line];
	} foreach _locations;

	// create enemies in cities
	_objindex = 0;
	{
		if( random 1 > 0.5) then {
		_position 	= _x select 0;
		_markername 	= _x select 1;
		_markersize 	= _x select 2;
		_object		= _x select 3;
		_objindex 	= _objindex + 1;
		_markername = "mrk" + format ["%1", _objindex];
		[_markername, _position, _markersize, _object, _objindex] spawn WC_fnc_createtrigger;
		};
	} forEach _targetarray;
	
	 _vehicles = ["Mi17_rockets_RU", "Mi17_rockets_RU", "Mi17_rockets_RU", "Ka52", "Ka52", "Mi24_V", "Mi24_V", "Su34", "Su39"];
	{
		nil = [_x]  spawn WC_fnc_createairpatrol;
	}foreach _vehicles;

	// create random zone here
	//_objindex = 0;
	//for "_i" from 1 to wcrandomenemyzone step 1 do {
	//	if( random 1 > 0.5) then {
	//	_objindex 	= _objindex + 1;
	//	_position = [wcmaptopright, wcmapbottomleft] call WC_fnc_createposition;
	//	call compile format["['mrkrandom%2', %1, 100, 'Land_Fire', %3] spawn WC_fnc_createtrigger;", _position, _i, _objindex];
	//	};
	//};

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
	} foreach _locations;

	_fuelstations = nearestObjects [[7000,7000], ["Land_A_FuelStation_Shed"], 20000];
	_index = 0;
	{
		call compile format ["_flag = ['fuel%1', 0.1, %2, 'ColorGreen', 'ICON', 'FDIAGONAL', 'Flag', 0, 'Fuel Station', true] call WC_fnc_createmarker;", _index, getpos _x];
		_index = _index + 1;
	}foreach _fuelstations;

	// Refresh markers for JIP
	WC_fnc_refreshmarker = {
		while {true} do {
			{
				_position = getmarkerpos (_x select 0);
				(_x select 0) setMarkerPos _position;
			}foreach wcarraymarker;
			sleep 0.3;
		};
	};

	nil = [] spawn WC_fnc_refreshmarker;

	true;