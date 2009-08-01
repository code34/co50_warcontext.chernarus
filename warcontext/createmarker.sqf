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

	_markername	= _this select 0;
	_markersize	= _this select 1;
	_position	= _this select 2;
	_color		= _this select 3;
	_shape		= _this select 4;
	_brush		= _this select 5;

	call compile format["%1 = createMarker[""%1"", %2];",_markername, _position];
	call compile format ["""%1"" setMarkerSize [%2, %2];",_markername, _markersize];
	call compile format ["%1 setMarkershape ""%2"";", _markername, _shape];
	call compile format ["%1 setMarkerColor ""%2"";", _markername, _color];
	call compile format [" ""%1"" setMarkerBrush ""%2"" ;", _markername, _brush];

	_markername;