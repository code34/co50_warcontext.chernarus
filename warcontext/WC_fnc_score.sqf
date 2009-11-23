	// -----------------------------------------------
	// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext - scoring players
	// -----------------------------------------------

	if (!isServer) exitWith{};

	private ["_score"];

	_score 	= _this select 0;
	_side	= _this select 1;

	if (_side == west) then {
		//for "_x" from 1 to 20 do {
		//	call compile format["j%1 addscore _score;", _x];
		//};
		wcscoreW = wcscoreW + _score;
		publicvariable 'wcscoreW';
	} else {
		//for "_x" from 21 to 40 do {
		//	call compile format["j%1 addscore _score;", _x];
		//};
		wcscoreE = wcscoreW + _score;
		publicvariable 'wcscoreE';
	};

	true;