// -----------------------------------------------
// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// units & vehicles class
// http://community.bistudio.com/wiki/ArmA:_CfgVehicles
// -----------------------------------------------
if (!isServer) exitWith{};

private [
	"_position", 
	"_x", 
	"_y", 
	"_z", 
	"_newx",
	"_newy",
	"_xtemp",
	"_ytemp",
	"_marker",
	"_markersize"
	];

	_markername = _this select 0;
	_markersize = getmarkersize _markername select 0;

	_position = [0,0,0];
	_x = abs((getmarkerpos _markername) select 0);
	_y = abs((getmarkerpos _markername) select 1);
	while {(surfaceIsWater _position)} do {
		_position = [0,0,0];
		if (random 2 > 1) then { _xtemp = random _markersize; } else { _xtemp = (random _markersize) * -1; };
		if (random 2 > 1) then { _ytemp = random _markersize; } else { _ytemp = (random _markersize) * -1; };
		_newx = ceil(_xtemp + _x);
		_newy = ceil(_ytemp + _y);
		_position = [_newx, _newy];
	};

	_position;