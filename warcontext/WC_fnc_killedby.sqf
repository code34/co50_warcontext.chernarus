	// -----------------------------------------------
	// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext - scoring players
	// -----------------------------------------------
	if (!isServer) exitWith{};

	private ["_player", "_killer", "_side", "_score"];

	_player	= wckilledby select 0;
	_killer	= wckilledby select 1;
	
	_score = 1;

	if (isPlayer _killer) then {
		if (side _player != side _killer) then {
			_side = side _killer;
			nil = [_score, _side] spawn WC_fnc_score;
		};
		_killer addrating 200;
	};
	true;