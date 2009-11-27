	// -----------------------------------------------
	// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext - scoring players
	// -----------------------------------------------

	if (!isServer) exitWith{};

	private ["_score", "_side"];

	_score 	= _this select 0;
	_side	= _this select 1;

	if (_side == west) then {
		wcscoreT = wcscoreT + _score;
		//wcscoreW = wcscoreT;
		// wcscoreW = wcscoreW + _score;
		//publicvariable 'wcscoreW';
		publicvariable 'wcscoreT';
	} else {
		wcscoreT = wcscoreT - _score;
		//wcscoreE = wcscoreT;
		// wcscoreE = wcscoreE + _score;
		//publicvariable 'wcscoreE';
		publicvariable 'wcscoreT';
	};

	true;