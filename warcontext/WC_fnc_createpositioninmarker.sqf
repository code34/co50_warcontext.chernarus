// -----------------------------------------------
// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// units & vehicles class
// http://community.bistudio.com/wiki/ArmA:_CfgVehicles
// generate a random position in a marker
// -----------------------------------------------
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
	"_markersize",
	"_onmountain",
	"_onroad",
	"_inforest"
	];

	_markername = _this select 0;
	_markersize = getmarkersize _markername select 0;

	if ( "onmoutain" in _this) then { _onmoutain = true; };
	if ( "onvalley" in _this) then { _onmountain = false; };
	if ( "onroad" in _this) then { _onroad = true; };
	if ( "inforest" in _this) then { _inforest = true; };
	if ( "notinforest" in _this) then { _inforest = false; };

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
		if (!isnil "_onroad") then {
			if (!isOnRoad _position) then { _position = [0,0,0]; };
		};
		if (!isnil "_inforest") then {
			if ( format["%1", [_position] call WC_fnc_isinforest] != format["%1", _inforest]) then {_position = [0,0,0];};			
		};
		if (!isnil "_onmoutain") then {
			if ( format["%1", [_position] call WC_fnc_isonmoutain] != format["%1", _onmountain]) then {_position = [0,0,0];};
		};
	};

	_position;