// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext - Description:
// Attach a marker to an object
// -----------------------------------------------

private [
	"_object",
	"_marker",
	"_markerposition",
	"_markersize",
	"_markercolor",
	"_markershape",
	"_markerbrush",
	"_markertype",
	"_markerdir",
	"_markertext",
	"_refreshtime"
	];

	_object		= _this select 0;
	_markername 	= _this select 1;
	_markersize 	= _this select 2;
	_markercolor	= _this select 3;
	_markershape	= _this select 4;
	_markerbrush	= _this select 5;
	_markertype	= _this select 6;
	_markerdir	= _this select 7;
	_markertext	= _this select 8;
	_refreshtime	= _this select 9;

	if (!isnil "_refreshtime") then { _refreshtime = 10; };

	_markerposition = getpos _object;
	_marker = [_markername, _markersize, _markerposition, _markercolor, _markershape, _markerbrush, _markertype, _markerdir, _markertext] call WC_fnc_createmarker;

	while {alive _object} do {
		_marker setMarkerPos getpos _object;
		sleep _refreshtime;
	};
	
	deletemarker _marker;