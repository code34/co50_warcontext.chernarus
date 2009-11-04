// -----------------------------------------------
// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// units & vehicles class
// http://community.bistudio.com/wiki/ArmA:_CfgVehicles
// -----------------------------------------------
if (!isServer) exitWith{};

private [
	"_arrayofvehicle",
	"_arrayofpilot",
	"_indexparameters",
	"_group",
	"_leader",
	"_nbparameters",
	"_parameters",
	"_marker",
	"_togarbage",
	"_scriptinit",
	"_typeofgroup", 
	"_typeofvehicle",
	"_position", 
	"_motorized",
	"_vehicle", 
	"_soldier",
	"_unitsofgroup",
	"_base"
	];

	_parameters = [
		"_marker",
		"_typeofgroup",
		"_togarbage"
		];

	_indexparameters = 0;
	_nbparameters = count _this;
	{
		if (_indexparameters <= _nbparameters) then {
		call compile format["%1 = _this select %2;", _x, _indexparameters];
		};
		_indexparameters = _indexparameters + 1;
	}foreach _parameters;


switch (_typeofgroup) do {


	case "mi17":
			{
				_motorized = true;
				_typeofvehicle = "Mi17_Ins";
			};

	case "mi24":
			{
				_motorized = true;
				_typeofvehicle = "Mi24_V";
			};


	case "uralrepair":
			{
				_motorized = true;
				_typeofvehicle = "UralRepair_INS";
			};

	case "uralrefuel":
			{
				_motorized = true;
				_typeofvehicle = "uralrefuel_INS";
			};

	case "uralreammo":
			{
				_motorized = true;
				_typeofvehicle = "uralreammo_INS";
			};

	case "bmp":
			{
				_motorized = true;
				_typeofvehicle = "BMP2_INS";
			};

	case "tunguska":
			{
				if( random 1 > wcaalevel) then {
					_motorized = true;
					_typeofvehicle = "2S6M_Tunguska";
				};
			};

	case "shilka":
			{
				if( random 1 > wcaalevel) then {
					_motorized = true;
					_typeofvehicle = "ZSU_INS";
				};
			};


	case "t72":
			{
				_motorized = true;
				_typeofvehicle = "T72_INS";
			};

	case "t90":
			{
				_motorized = true;
				_typeofvehicle = "T90";
			};

	case "army1":
			{
				_motorized = false;
				_base =	[
					"RU_Soldier_Officer",
					"RU_Soldier",
					"RU_Soldier2",
					"RU_Soldier_Medic"
				];

				_unitsofgroup = [
				"RU_Commander",
				"RU_Soldier_AR",
				"RU_Soldier_AR",
				"RU_Soldier_AT",
				"RU_Soldier_AT",
				"RU_Soldier_GL",
				"RU_Soldier_HAT",
				"RU_Soldier_MG",
				"RU_Soldier_Marksman"
				];

				if( random 1 > wcaalevel) then {
					_base = _base + ["RU_Soldier_AA"];
				};

				_number = wcgroupsize - (count _base);
				for "_x" from 0 to _number do {	
						_base = _base + [_bonus call BIS_fnc_selectRandom];
				};

				_unitsofgroup = _base;

				
			};

	case "special1":
			{
				_motorized = false;
				_unitsofgroup = [
				"RUS_Soldier_Marksman",
				"RUS_Soldier_Marksman",
				"RUS_Soldier_Sab",
				"RUS_Soldier_Sab",
				"RUS_Soldier_Sab",
				"RUS_Soldier_Sab",
				"RUS_Soldier_Sab"
				];
			};

	case "special2":
			{
				_motorized = false;
				_unitsofgroup = [
				"RUS_Commander",
				"RUS_Soldier1",
				"RUS_Soldier2",
				"RUS_Soldier3",
				"RUS_Soldier_GL",
				"RUS_Soldier_Marksman",
				"RUS_Soldier_TL"
				];
			};
	
	default 
		{
			_motorized = false;
			_unitsofgroup = [
				"RU_Commander",
				"RU_Soldier",
				"RU_Soldier",
				"RU_Soldier2",
				"RU_Soldier2",
				"RU_Soldier_AA",
				"RU_Soldier_AR",
				"RU_Soldier_AR",
				"RU_Soldier_AT",
				"RU_Soldier_AT",
				"RU_Soldier_GL",
				"RU_Soldier_HAT",
				"RU_Soldier_Medic",
				"RU_Soldier_MG",
				"RU_Soldier_Marksman"
			];
		};
	};

	_position = [_marker] call WC_fnc_createpositioninmarker;

	_group = createGroup wcenemyside;

	if (_motorized) then {
		call compile format[" _arrayofvehicle =[_position, 0, '%1', east] call BIS_fnc_spawnVehicle;", _typeofvehicle];
		_vehicle = _arrayofvehicle select 0;
		_arrayofpilot = _arrayofvehicle select 1;
		_vehicle setVariable ['togarbage', true, true];
		{
			_x setVariable ['togarbage', true, true];
			_group = group _x;
		}foreach _arrayofpilot;
		_vehicle setVehicleInit "[this] spawn EXT_fnc_atot";
		_vehicle addeventhandler ['killed', {_this spawn WC_fnc_garbagecollector}];
	} else {
		{
			call compile format["_soldier = _group createUnit ['%1', _position, [], 0, 'FORM'];", _x];
			if(!isnil "_togarbage") then {
				_soldier setVariable ['togarbage', true, true];
			};
			nil = [_soldier, wcskill] spawn WC_fnc_setskill;
			_soldier addeventhandler ['killed', {_this spawn WC_fnc_garbagecollector}];
			sleep 0.15;
		}foreach _unitsofgroup;
	};


	// initialisation script for units
	_scriptinit = format["nil = [this, '%1', 'noslow'] execVM 'extern\ups.sqf';", _marker];

	_leader = leader _group;
	_leader setVehicleInit _scriptinit;
	processInitCommands;
	_group;