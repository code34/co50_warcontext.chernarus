// -----------------------------------------------
// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// -----------------------------------------------
if (!isServer) exitWith {};

private [
	"_chopper", 
	"_soldier",
	"_para",
	"_group",
	"_scriptinit"
	];

	_chopper	= _this select 0;
	_marker		= _this select 1;
	
	// initialisation script for units
	_scriptinit = format["nil = [this, '%1'] execVM 'ups.sqf';", _marker];
	
	_group = createGroup east;

for "_x" from 0 to 14 step 1 do 
{
	_para = createVehicle ["Parachute", position _chopper, [], 20, 'NONE'];
	_para setpos (position _chopper);
	
	_soldier = _group createUnit ["SoldierESaboteurBizon", position _chopper, [], 5, "NONE"];
	_soldier addeventhandler ["killed", {_this spawn func_remove}];
	_soldier moveInDriver _para;
	_soldier setvehicleinit _scriptinit;
	processInitCommands;
	sleep 0.6;
};