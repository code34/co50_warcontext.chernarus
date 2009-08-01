// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// -----------------------------------------------

private [
	"_objectid",
	"_markersize",
	"_markername",
	"_position",
	"_object"
	];

	_markername = _this select 0;
	
	call compile format ["
		deleteMarker '%1';
		deleteMarker '%1ups';
	", _markername];