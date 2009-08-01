// -----------------------------------------------
// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// units & vehicles class
// http://community.bistudio.com/wiki/ArmA:_CfgVehicles
// -----------------------------------------------
if (!isServer) exitWith{};

	private [
		"_marker",
		"_markersize",
		"_scriptinit",
		"_group",
		"_position", 
		"_positiontogo",
		"_x", 
		"_y", 
		"_z", 
		"_vehicle", 
		"_soldier1",
		"_soldier2",
		"_wp",
		"_xtemp",
		"_ytemp",
		"_typeofvehicle",
		"_kindofvehicle",
		"_numindex",
		"_unitsofgroup"
		];
	
	_marker 	= _this select 0;
	_markersize 	= getMarkerSize _marker select 0;
	_xrandom 	= 1500 + _markersize;
	_globalarray	= [];
	_indexarray	= 0;
	_timetowaitbeforeunit		= 60;
	_timetowaitbeforevehicle	= 240;

	_position = [0,0,0];
	_x = abs((getmarkerpos _marker) select 0);
	_y = abs((getmarkerpos _marker) select 1);
	_positiontogo = [_x,_y, 0];

	while {(surfaceIsWater _position)} do {
		if (random 1 > 0) then { _xtemp = random _xrandom; } else { _xtemp = (random _xrandom) * -1; };
		if (random 1 > 0) then { _ytemp = random _xrandom; } else { _ytemp = (random _xrandom) * -1; };
		_newx = ceil(_xtemp + _x);
		_newy = ceil(_ytemp + _y);
		_position = [_newx, _newy];
	};
		
	// initialisation script for units
	_scriptinit = format["nil = [this, '%1', 'noslow'] execVM 'ups.sqf';", _marker];
	
	_group = createGroup east;

	_unitsofgroup = [
		"SquadLeaderE",
		"SoldierESniper",
		"SoldierEG",
		"SoldierEMedic",
		"SoldierEAT",
		"SoldierEAA",
		"SoldierEMG",
		"SoldierEG",
		"SoldierEMiner"
		];


	_kindofvehicle = [
		"brdm2",
		"Mi17_MG",
		"t72",
		"UAZMG",
		"Mi17",
		"BMP2"
	];

	while {(call compile format["alive(%1radio)", _marker])} do {
		_numindex = 0;
		if (1 == 0) then {
			_numindex = count _unitsofgroup;
			_typeofsoldier = _unitsofgroup select (random _numindex);
			_soldier1 = _group createUnit [_typeofsoldier, _position, [], 0, "NONE"];
			[_soldier1] spawn func_setskill;
			_soldier1 setRank "COLONEL";
			_wp = _group addWaypoint [_positiontogo, 0];
			_wp setWaypointType "DESTROY";
			_wp setWaypointSpeed "FULL";
			_wp setWaypointStatements ["true", _scriptinit];
			sleep _timetowaitbeforeunit;
		}else{
			_numindex = count _kindofvehicle;
			_typeofvehicle = _kindofvehicle select (random _numindex);
			call compile format["_vehicle = createVehicle ['%1', _position, [], 0, 'NONE'];", _typeofvehicle];
			_unitsofgroup = [
			"SoldierEcrew",
			"SoldierEcrew"
			];
			_countunits = 1;
			{
				call compile format["_soldier%1 = _group createUnit [""%2"", _position, [], 0, ""NONE""];", _countunits, _x];
				_line = "[_soldier%1] spawn func_setskill;";
				[_soldier1] spawn func_setskill;
				call compile format[_line, _countunits];
				_countunits = _countunits + 1;
				sleep 0.4;
			}foreach _unitsofgroup;
			_soldier1 moveindriver _vehicle;
			_soldier2 moveingunner _vehicle;
			_vehicle setVehicleInit "[this] spawn func_atot";
			processInitCommands;
			_wp = _group addWaypoint [_positiontogo, 0];
			_wp setWaypointType "DESTROY";
			_wp setWaypointSpeed "FULL";
			_wp setWaypointStatements ["true", _scriptinit];
			sleep _timetowaitbeforevehicle;
		};
	};