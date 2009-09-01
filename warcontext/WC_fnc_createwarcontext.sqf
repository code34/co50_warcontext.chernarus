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
	"_i"
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
		_position 	= _x select 0;
		_markername 	= _x select 1;
		_markersize 	= _x select 2;
		_object		= _x select 3;
		_objindex 	= _objindex + 1;
		_markername = "mark" + format ["%1", _objindex];
		[_markername, _position, _markersize, _object, _objindex] spawn WC_fnc_createtrigger;
	} forEach _targetarray;
	
	// create random zone here
	_objindex = 0;
	for "_i" from 1 to wcrandomenemyzone step 1 do {
		if( random 2 > 1) then {
		_objindex 	= _objindex + 1;
		_position = [wcmaptopright, wcmapbottomleft] call WC_fnc_createposition;
		call compile format["['mrkrandom%2', %1, 100, 'Land_Fire', %3] spawn WC_fnc_createtrigger;", _position, _i, _objindex];
		};
	};

	// create AA Site
	_locations = nearestLocations [[7000,7000], ["Hill"], 20000]; 
	{
		if( random 2 > 1) then {
			_position = position _x;
			_target = "anti-air_ru1";
			_target = [_target, 0, _position] call EXT_fnc_createcomposition;
			_units = ["RU_Soldier_Crew","RU_Soldier_Crew", "RU_Soldier_MG"];
			_group = [_position , east, _units, [], [],[wcskill,wcskill,wcskill]] call BIS_fnc_spawnGroup;
			nil = [_group, _position] call BIS_fnc_taskDefend;
			//nil = [format["toto%1", text _x], 500, _position, 'ColorRED', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;
		};
	} foreach _locations;