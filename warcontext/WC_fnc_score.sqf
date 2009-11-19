	// -----------------------------------------------
	// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// Enhancement with Xeno script x_playerweapons.sqf
	// Client Side logic
	// -----------------------------------------------

	if (!isServer) exitWith{};

	private ["_score"];

	_score = _this select 0;

	for "_x" from 1 to 20 do {
		call compile format["j%1 addscore _score;", _x];
	};

	true;