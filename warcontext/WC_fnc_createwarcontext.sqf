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
		"_fuelstations"
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
	
	nil = ["Mi17_rockets_RU"]  spawn WC_fnc_createmappatrol;
	nil = ["Mi17_rockets_RU"]  spawn WC_fnc_createmappatrol;
	nil = ["Mi17_rockets_RU"]  spawn WC_fnc_createmappatrol;
	nil = ["Mi17_rockets_RU"]  spawn WC_fnc_createmappatrol;
	nil = ["Ka52"]  spawn WC_fnc_createmappatrol;
	nil = ["Ka52"]  spawn WC_fnc_createmappatrol;
	nil = ["Mi24_V"]  spawn WC_fnc_createmappatrol;
	nil = ["Mi24_V"]  spawn WC_fnc_createmappatrol;
	nil = ["Mi24_V"]  spawn WC_fnc_createmappatrol;
	nil = ["Su34"]  spawn WC_fnc_createmappatrol;
	nil = ["Su34"]  spawn WC_fnc_createmappatrol;
	nil = ["Su39"]  spawn WC_fnc_createmappatrol;

	// create random zone here
	//_objindex = 0;
	//for "_i" from 1 to wcrandomenemyzone step 1 do {
	//	if( random 1 > 0.5) then {
	//	_objindex 	= _objindex + 1;
	//	_position = [wcmaptopright, wcmapbottomleft] call WC_fnc_createposition;
	//	call compile format["['mrkrandom%2', %1, 100, 'Land_Fire', %3] spawn WC_fnc_createtrigger;", _position, _i, _objindex];
	//	};
	//};


	_hind1 = [_position, 0, "2S6M_Tunguska", east] call BIS_fnc_spawnVehicle;

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
				[_leader, format["AA%1", _index], 0.5, 'ColorRed', 'ICON', 'FDIAGONAL', 10, 'AntiAir', 0 , 'AA SITE'] spawn WC_fnc_attachmarker;
			} else {
				[_leader, format["AA%1", _index], 0.5, 'ColorRed', 'ICON', 'FDIAGONAL', 10, 'EMPTY', 0 , 'AA SITE'] spawn WC_fnc_attachmarker;
			};
		};
	} foreach _locations;

	_fuelstations = nearestObjects [[7000,7000], ["Land_A_FuelStation_Shed"], 20000];
	_index = 0;
	{
		call compile format ["_flag = ['fuel%1', 0.1, %2, 'ColorGreen', 'ICON', 'FDIAGONAL', 'Flag', 0, 'Fuel Station'] call WC_fnc_createmarker;", _index, getpos _x];
		_index = _index + 1;
	}foreach _fuelstations;

	// setting ACM MODULE
	//waitUntil {BIS_ACM getVariable "initDone"};
	//[1, BIS_ACM] call BIS_ACM_setIntensityFunc;
	//[BIS_ACM, 2000, 20000] call BIS_ACM_setSpawnDistanceFunc;
	//[0.7, 1, BIS_ACM] call BIS_ACM_setSkillFunc;
	//[["USMC", "RU"], BIS_ACM] call BIS_ACM_setFactionsFunc;
	//["ground_patrol", 0.8, BIS_ACM] call BIS_ACM_setTypeChanceFunc;
	//["air_patrol", 0, BIS_ACM] call BIS_ACM_setTypeChanceFunc;