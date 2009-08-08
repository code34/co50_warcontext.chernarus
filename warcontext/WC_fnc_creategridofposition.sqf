// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext - Description:
// create a grid of 9 positions NW,N,NE,W,C,E,SW,S,SE
// around a position
// -----------------------------------------------

private [
	"_marker",
	"_position",
	"_position1",
	"_position2",
	"_position3",
	"_position4",
	"_position5",
	"_position6",
	"_position7",
	"_position8",
	"_position9",
	"_gridofposition",
	"_size"
	];

	_position	= _this select 0;
	_size		= _this select 1;

	_gridofposition = [];
	_position1 = [_position select 0 - _size, _position select 1 + _size];
	_position2 = [_position select 0, _position select 1 + _size];
	_position3 = [_position select 0 + _size, _position select 1 + _size];

	_position4 = [_position select 0 - _size, _position select 1];
	_position5 = _position;
	_position6 = [_position select 0 + _size, _position select 1];

	_position7 = [_position select 0 - _size, _position select 1 - _size];
	_position8 = [_position select 0, _position select 1 - _size];
	_position9 = [_position select 0 + _size, _position select 1 - _size];
	
	_gridofposition = [_position1,_position2,_position3,_position4,_position5,_position6,_position7,_position8,_position9];
	_gridofposition;