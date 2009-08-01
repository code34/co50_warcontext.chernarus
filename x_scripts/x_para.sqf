// by Xeno
private ["_heli", "_eject_grp", "_grpunits"];
if (!isServer) exitWith {};

_heli = _this select 0;
_eject_grp = _this select 1;

_grpunits = units _eject_grp;

{
	_x action ["EJECT",_heli];
	unassignvehicle _x;
	sleep 0.5;
} forEach _grpunits;

{unassignvehicle _x} foreach _grpunits;

if (true) exitWith {};
