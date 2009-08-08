// by Xeno

private ["_killed","_killer"];

_killed = _this select 0;

sleep 30 + (random 15);

deleteVehicle _killed;

if (true) exitWith {};

