	// -----------------------------------------------
	// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext - scoring players
	// -----------------------------------------------

	if (!isServer) exitWith{};

	private ["_score", "_side"];

	_score 	= _this select 0;
	_side	= _this select 1;

	if (_side == west) then {
		if ((wcscoreT - _score) > 0) then {
			wcscoreT = wcscoreT - _score;
			publicvariable 'wcscoreT';
		} else {
			wcscoreT = 0 ;
		};
	} else {
		if ((wcscoreT + _score)  < 100) then {
			wcscoreT = wcscoreT + _score;
			publicvariable 'wcscoreT';
		} else {
			wcscoreT = 100;
		};
	};

	true;