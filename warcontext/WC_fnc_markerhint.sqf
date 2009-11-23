	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext - Liberate Island
	// -----------------------------------------------
	if (!isServer) exitWith{};

	private ["_timer"];

	_marker = _this select 0;

	_timer = 0;
	while { _timer < 30} do {
		_marker setmarkersize [5,5];
		sleep 1;
		_marker setmarkersize [4,4];
		sleep 1;
		_marker setmarkersize [3,3];
		sleep 1;
		_marker setmarkersize [2,2];
		sleep 1;
		_timer = _timer + 1;
	};
	_marker setmarkersize [4,4];