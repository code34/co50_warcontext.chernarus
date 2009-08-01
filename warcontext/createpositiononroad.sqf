// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
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
	"_position"
	];

	_topright 	= _this select 0;
	_bottomleft 	= _this select 1;

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
	while {!(isOnRoad _position)} do {
		_position = [0,0,0];
		while {(surfaceIsWater _position)} do {
			_x = random _xrandom;
			_y = random _yrandom;
			_newx = _x + _xmin;
			_newy = _y + _ymin;
			_position = [_newx, _newy];
		};
	};
	_position;