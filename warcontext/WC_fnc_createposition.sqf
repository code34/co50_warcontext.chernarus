// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// generate a random position on map
// -----------------------------------------------
private [
	"_topright",
	"_bottomleft",
	"_xmax",
	"_ymax",
	"_xmin",
	"_ymin",
	"_xrandom",
	"_yrandom",
	"_x",
	"_y",
	"_newx",
	"_newy",
	"_position",
	"_onmountain",
	"_onroad",
	"_inforest"
	];

	_topright 	= _this select 0;
	_bottomleft 	= _this select 1;

	if ( "onmoutain" in _this) then { _onmoutain = true; };
	if ( "onvalley" in _this) then { _onmountain = false; };
	if ( "onroad" in _this) then { _onroad = true; };
	if ( "inforest" in _this) then { _inforest = true; };
	if ( "notinforest" in _this) then { _inforest = false; };

	// top right
	_xmax 	= _topright select 0;
	_ymax	= _topright select 1;

	// bottom left
	_xmin	= _bottomleft select 0;
	_ymin	= _bottomleft select 1;

	// random
	_xrandom = _xmax - _xmin;
	_yrandom = _ymax - _ymin;

	_position = [0,0,0];
	while {(surfaceIsWater _position)} do {
		_x = random _xrandom;
		_y = random _yrandom;
		_newx = _x + _xmin;
		_newy = _y + _ymin;
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