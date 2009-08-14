// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext - Description:
// respawn vehicle at their original position
// -----------------------------------------------
if (!isServer) exitWith{};

private [
	"_vehicle",
	"_delay",
	"_position",
	"_dir"
	];

	_vehicle	= _this select 0;
	_delay 		= _this select 1;
	_position 	= getposasl _vehicle;
	_dir		= getdir _vehicle;

	if (isnil ("_delay")) then { _delay = 120;};

	_vehicle addeventhandler ["killed", {
		sleep _delay;
		_vehicle setdamage 0;
		_vehicle setposasl [_position select 0, _position select 1, _position select 2];
		_vehicle setdir _dir;
	}];