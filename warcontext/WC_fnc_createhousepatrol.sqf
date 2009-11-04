	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext - Description: 
	// create a house patrol
	// COMBAT MODE: BLUE, GREEN, WHITE, YELLOW, RED
	//
	// -----------------------------------------------
	
	private [
		"_indexparameters",
		"_nbparameters",
		"_parameters",
		"_unit", 
		"_building", 
		"_arrayofpos", 
		"_refreshtime", 
		"_count", 
		"_x", 
		"_group", 
		"_pos", 
		"_posunit", 
		"_combatmode", 
		"_behaviour"
		];

	_parameters = [
		"_group",
		"_building",
		"_refreshtime",
		"_combatmode",
		"_behaviour"
		];

	_indexparameters = 0;
	_nbparameters = count _this;
	{
		if (_indexparameters <= _nbparameters) then {
		call compile format["%1 = _this select %2;", _x, _indexparameters];
		};
		_indexparameters = _indexparameters + 1;
	}foreach _parameters;

	if (isnil "_combatmode") then {_combatmode = "RED";};
	if (isnil "_behaviour") then {_behaviour = "AWARE";};

	_group setCombatMode _combatmode;
	_group setBehaviour _behaviour;

	_arrayofpos = [];
	_x = 0;
	while { format ["%1", _building buildingPos _x] != "[0,0,0]" } do {
		_arrayofpos = _arrayofpos + [_building buildingPos _x];
		_x = _x + 1;
	};


	while {count (units _group) > 0} do {
		{
			_pos = _arrayofpos call BIS_fnc_selectRandom;
			_x doMove _pos;
			sleep (random _refreshtime);
		}foreach (units _group);
		sleep 120;
	};

	true;