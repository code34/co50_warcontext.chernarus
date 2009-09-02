// -----------------------------------------------
// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext - garbage collector
// -----------------------------------------------
	
	if (!isServer) exitWith{};

	private ["_unit"];

	_unit = _this select 0;

	wccounttotalunit = wccounttotalunit - 1;

	sleep 60;

	if (_unit iskindof "Man") then {
		hidebody _unit;
		sleep 3;
	};

	deletevehicle _unit;
