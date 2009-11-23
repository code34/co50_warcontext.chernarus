	// -----------------------------------------------
	// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext - scoring players
	// -----------------------------------------------

	private ["_player", "_killer", "_side", "_score"];

	_player	= wckilledby select 0;
	_killer	= wckilledby select 1;
	
	_score = 1;

	_killer addscore _score;
	_side = side _killer;
	
	nil = [_score, _side] spawn WC_fnc_score;

	true;