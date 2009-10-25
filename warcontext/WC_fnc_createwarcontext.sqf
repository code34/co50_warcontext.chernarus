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
		_markername = "mrk" + format ["%1", _objindex];
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
	_index = 0;
	{
		if( random 1 > wcaalevel) then {
			_position = position _x;
			_index = _index + 1;
			_target = "anti-air_ru1";
			_target = [_target, 0, _position] call EXT_fnc_createcomposition;
			_leader = leader _target;
			if(wcdebug or wcshowmarkers) then {
				[_leader, format["AA%1", _index], 1, 'ColorRed', 'ICON', 'FDIAGONAL', 2, 'AntiAir', 0 , 'AA SITE'] spawn WC_fnc_attachmarker;
			} else {
				[_leader, format["AA%1", _index], 1, 'ColorRed', 'ICON', 'FDIAGONAL', 2, 'EMPTY', 0 , 'AA SITE'] spawn WC_fnc_attachmarker;
			};
			nil = [_leader, format["AA%1", _index]] execVM 'extern\ups.sqf';

		};
	} foreach _locations;

	// setting ACM MODULE
	waitUntil {BIS_ACM getVariable "initDone"};
	[1, BIS_ACM] call BIS_ACM_setIntensityFunc;
	[BIS_ACM, 2000, 20000] call BIS_ACM_setSpawnDistanceFunc;
	[0.7, 1, BIS_ACM] call BIS_ACM_setSkillFunc;
	[["USMC", "RU"], BIS_ACM] call BIS_ACM_setFactionsFunc;
	["ground_patrol", 0.8, BIS_ACM] call BIS_ACM_setTypeChanceFunc;
	["air_patrol", 0.25, BIS_ACM] call BIS_ACM_setTypeChanceFunc;