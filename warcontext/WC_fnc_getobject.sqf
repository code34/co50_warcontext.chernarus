// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext - Description:
// Get an object by its editor ID
// Example:
// [172851] execVM "WC_fnc_getobject.sqf";
// -----------------------------------------------

private [
	"_objectid",
	"_markersize",
	"_markername",
	"_marker",
	"_position",
	"_object"
	];
	
	_objectid = _this select 0;

	_markersize = 1;
	_markername = "getobject";
	_position = [0, 0];

	_marker = [_markername, _markersize, _position, 'NONE', 'ELLIPSE', 'NONE'] call WC_fnc_createmarker;
	_object = getMarkerPos _marker nearestObject _objectid;
	deletemarker _marker;

	_object;