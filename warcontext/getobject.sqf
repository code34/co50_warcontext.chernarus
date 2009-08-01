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
	
	_objectid = _this select 0;

	_markersize = 20000;
	_markername = "logiquejeu";
	_position = [7000,7000];

	call compile format ["%1 = createMarker[""%1"", %2];", _markername, _position];
	call compile format ["""%1"" setMarkerSize [%2, %2];", _markername, _markersize];
	call compile format ["%1 setMarkershape ""ELLIPSE"";", _markername];
	_object = getMarkerPos _markername nearestObject _objectid;
	deletemarker _markername;
	_object;