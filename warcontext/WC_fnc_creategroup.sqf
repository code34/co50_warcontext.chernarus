// -----------------------------------------------
// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// units & vehicles class
// http://community.bistudio.com/wiki/ArmA:_CfgVehicles
// -----------------------------------------------
if (!isServer) exitWith{};

private [
	"_indexparameters",
	"_nbparameters",
	"_parameters",
	"_marker",
	"_protecttogarbage",
	"_scriptinit",
	"_scriptinitvehicle",
	"_countofgroup",
	"_typeofgroup", 
	"_typeofvehicle",
	"_position", 
	"_motorized",
	"_x", 
	"_y", 
	"_z", 
	"_xtemp",
	"_ytemp",
	"_vehicle", 
	"_vehicle2", 
	"_soldier1",
	"_soldier2", 
	"_soldier3", 
	"_soldier4", 
	"_soldier5", 
	"_soldier6", 
	"_soldier7", 
	"_soldier8",
	"_unitsofgroup"
	];

	_parameters = [
		"_marker",
		"_typeofgroup",
		"_protecttogarbage"
		];

	_indexparameters = 0;
	_nbparameters = count _this;
	{
		if (_indexparameters <= _nbparameters) then {
		call compile format["%1 = _this select %2;", _x, _indexparameters];
		};
		_indexparameters = _indexparameters + 1;
	}foreach _parameters;

	// initialisation script for units
	_scriptinit = format["nil = [this, '%1'] execVM 'extern\ups.sqf';", _marker];
	
	// initialisation script for units in vehicle
	_scriptinitvehicle = format["nil = [this, '%1', 'noslow'] execVM 'extern\ups.sqf';", _marker];

switch (_typeofgroup) do {


	case "mi17":
			{
				_motorized = true;
				_typeofvehicle = "Mi17_Ins";
				_unitsofgroup = [
				"RU_Soldier_Pilot",
				"RU_Soldier_Pilot"
				];
			};

	case "mi24":
			{
				_motorized = true;
				_typeofvehicle = "Mi24_V";
				_unitsofgroup = [
				"RU_Soldier_Pilot",
				"RU_Soldier_Pilot"
				];
			};


	case "uralrepair":
			{
				_motorized = true;
				_typeofvehicle = "UralRepair_INS";
				_unitsofgroup = [
				"RU_Soldier_Crew"
				];
			};

	case "uralrefuel":
			{
				_motorized = true;
				_typeofvehicle = "uralrefuel_INS";
				_unitsofgroup = [
				"RU_Soldier_Crew"
				];
			};

	case "uralreammo":
			{
				_motorized = true;
				_typeofvehicle = "uralreammo_INS";
				_unitsofgroup = [
				"RU_Soldier_Crew"
				];
			};

	case "bmp":
			{
				_motorized = true;
				_typeofvehicle = "BMP2_INS";
				_unitsofgroup = [
				"RU_Soldier_Crew",
				"RU_Soldier_Crew",
				"RU_Soldier_Crew"
				];
			};

	case "tunguska":
			{
				_motorized = true;
				_typeofvehicle = "2S6M_Tunguska";
				_unitsofgroup = [
				"RU_Soldier_Crew",
				"RU_Soldier_Crew",
				"RU_Soldier_Crew"
				];
			};

	case "shilka":
			{
				_motorized = true;
				_typeofvehicle = "ZSU_INS";
				_unitsofgroup = [
				"RU_Soldier_Crew",
				"RU_Soldier_Crew",
				"RU_Soldier_Crew"
				];
			};


	case "t72":
			{
				_motorized = true;
				_typeofvehicle = "T72_INS";
				_unitsofgroup = [
				"RU_Soldier_Crew",
				"RU_Soldier_Crew",
				"RU_Soldier_Crew"
				];
			};

	case "t90":
			{
				_motorized = true;
				_typeofvehicle = "T90";
				_unitsofgroup = [
				"RU_Soldier_Crew",
				"RU_Soldier_Crew",
				"RU_Soldier_Crew"
				];
			};

	case "army1":
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

	case "special1":
			{
				_motorized = false;
				_unitsofgroup = [
				"RUS_Soldier_Sab",
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

			wcgroupindex = wcgroupindex + 1;
			wcgroupcount = wcgroupcount + 1;
			call compile format["wcgroup%1 = createGroup wcenemyside;", wcgroupindex];
			_countunits = 1;
	
			{
				if ( wccounttotalunit < wcmaxenemyonmap ) then {
					call compile format["_soldier%1 = wcgroup%3 createUnit [""%2"", _position, [], 0, ""NONE""];", _countunits, _x, wcgroupindex];
					if(isnil "_protecttogarbage") then {
						call compile format["_soldier%1 setVariable ['wcgarbage', true, false];",  _countunits];
					};
					_line = "nil = [_soldier%1, wcskill] spawn WC_fnc_setskill;_soldier%1 addeventhandler ['killed', {_this spawn WC_fnc_garbagecollector}];";
					call compile format[_line, _countunits];
					_countunits = _countunits + 1;
					wccounttotalunit = wccounttotalunit + 1;
					sleep 0.15;
				};
			}foreach _unitsofgroup;

			if (_motorized) then {
				call compile format["_vehicle = createVehicle [""%1"", _position, [], 0, ""FLY""];", _typeofvehicle];
				if (_vehicle emptyPositions "driver" > 0) then {_soldier1 moveindriver _vehicle;};
				if (_vehicle emptyPositions "gunner" > 0) then {_soldier2 moveingunner _vehicle;};
				if (_vehicle emptyPositions "commander" > 0) then {_soldier3 moveincommander _vehicle;};		
				_soldier1 setVehicleInit _scriptinitvehicle;
				_vehicle setVehicleInit "[this] spawn EXT_fnc_atot";
				_vehicle addeventhandler ['killed', {_this spawn WC_fnc_garbagecollector}];
			} else {
				_soldier1 setVehicleInit _scriptinit;
			};
			processInitCommands;

		call compile format["wcgroup%1;", wcgroupindex];