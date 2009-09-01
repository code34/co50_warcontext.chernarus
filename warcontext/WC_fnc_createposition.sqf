// -----------------------------------------------
// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// units & vehicles class
// http://community.bistudio.com/wiki/ArmA:_CfgVehicles
// generate a random position
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
	"_inforest",
	"_invillage",
	"_incity",
	"_incitycapital",
	"_onhill",
	"_onmount"
	];

	_topright 	= _this select 0;
	_bottomleft 	= _this select 1;

	if ( "onmountain" in _this) then { _onmoutain = true; };
	if ( "onvalley" in _this) then { _onmountain = false; };
	if ( "onroad" in _this) then { _onroad = true; };
	if ( "inforest" in _this) then { _inforest = true; };
	if ( "notinforest" in _this) then { _inforest = false; };
	if ( "invillage" in _this) then { _invillage = true; };
	if ( "incity" in _this) then { _incity = true; };
	if ( "incitycapital" in _this) then { _incitycapital = true; };
	if ( "onhill" in _this) then { _onhill = true; };
	if ( "onmount" in _this) then { _onmount = true; };

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
		_position = [0,0,0];
		_x = random _xrandom;
		_y = random _yrandom;
		_newx = _x + _xmin;
		_newy = _y + _ymin;
		_position = [_newx, _newy];
		if (!isnil "_inforest") then {
			if ( format["%1", [_position] call WC_fnc_isinforest] != format["%1", _inforest]) then {_position = [0,0,0];};			
		};
		if (_invillage) then {
			_nearestlocation = nearestLocation [_position, "NameVillage"];
			_position = position _nearestlocation;
		};
		if (_incity) then {
			_nearestlocation = nearestLocation [_position, "NameCity"];
			_position = position _nearestlocation;
		};
		if (_incitycapital) then {
			_nearestlocation = nearestLocation [_position, "NameCityCapital"];
			_position = position _nearestlocation;
		};
		if (_onmountain) then {
			_position = [_position] call WC_fnc_getterraformvariance;
		};
		if (_onroad) then {
			if (!isOnRoad _position) then { _position = [0,0,0]; };
		};
		if (_onhill) then {
			_nearestlocation = nearestLocation [_position, "Hill"];
			_position = position _nearestlocation;
		};
		if (_onmount) then {
			_nearestlocation = nearestLocation [_position, "Mount"];
			_position = position _nearestlocation;
		};
	};

	_position;