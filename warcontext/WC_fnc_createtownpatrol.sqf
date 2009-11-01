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
		"_index", 
		"_group", 
		"_pos", 
		"_posunit", 
		"_combatmode", 
		"_behaviour",
		"_position"
		];

	_parameters = [
		"_group",
		"_position",
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

	_list= _position nearObjects ["House",100];

	_arrayofpos = [];
	{
		_building = _x;
		_index = 0;
		while { format ["%1", _building buildingPos _index] != "[0,0,0]" } do {
			if(random 1 > 0.9) then {_arrayofpos = _arrayofpos + [_building buildingPos _index];};
			_index = _index + 1;
		};
	} foreach _list;

	copytoclipboard format["%1", count _arrayofpos];

	while {count (units _group) > 0} do {
		{
			_pos = _arrayofpos call BIS_fnc_selectRandom;
			_x doMove _pos;
			sleep (random _refreshtime);
		}foreach (units _group);
		hint format["cycle %1", _x];
	};

	true;