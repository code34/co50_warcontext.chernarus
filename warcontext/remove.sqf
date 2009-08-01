// -----------------------------------------------
// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// units & vehicles class
// http://community.bistudio.com/wiki/ArmA:_CfgVehicles
// -----------------------------------------------
	
	if (!isServer) exitWith{};

	private ["_unit"];

	_unit = _this select 0;

	wccounttotalunit = wccounttotalunit - 1;

	sleep 240;

	if (_unit iskindof "Man") then {
		hidebody _unit;
		sleep 3;
	};

	deletevehicle _unit;
