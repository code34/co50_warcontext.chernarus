	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext - Liberate Island
	// -----------------------------------------------
	if (!local player) exitWith {};

	private ["_timer", "_marker"];

	_marker = _this select 0;

	_timer = 0;
	while { _timer < 30} do {
		_marker setmarkersizelocal [5,5];
		sleep 1;
		_marker setmarkersizelocal [4,4];
		sleep 1;
		_marker setmarkersizelocal [3,3];
		sleep 1;
		_marker setmarkersizelocal [2,2];
		sleep 1;
		_timer = _timer + 1;
	};
	_marker setmarkersizelocal [4,4];