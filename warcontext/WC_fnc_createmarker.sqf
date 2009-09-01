// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext - Description: 
// create a marker
// -----------------------------------------------

private [
	"_indexparameters",
	"_nbparameters",
	"_parameters",
	"_marker",
	"_markername",
	"_markersize",
	"_markerposition",
	"_markercolor",
	"_markershape",
	"_markerbrush",
	"_markertype",
	"_markerdir",
	"_markertext"
	];

	_parameters = [
		"_markername",
		"_markersize",
		"_markerposition",
		"_markercolor",
		"_markershape",
		"_markerbrush",
		"_markertype",
		"_markerdir",
		"_markertext"
		];

	_indexparameters = 0;
	_nbparameters = count _this;
	{
		if (_indexparameters <= _nbparameters) then {
		call compile format["%1 = _this select %2;", _x, _indexparameters];
		};
		_indexparameters = _indexparameters + 1;
	}foreach _parameters;

	if (isserver) then {
		_tmparray = [_markername, _markersize, _markerposition, _markercolor, _markershape, _markerbrush];
		wcarraymarker = wcarraymarker + [_tmparray];
	};	

	_marker = createMarker[_markername, _markerposition];
	if (!isnil ("_markersize")) then { _marker setMarkerSize [_markersize, _markersize]; };
	if (_markershape != "") then { _marker setMarkershape _markershape; };
	if (_markercolor != "") then { _marker setMarkerColor _markercolor; };
	if (_markerbrush != "") then { _marker setMarkerBrush _markerbrush; };
	if (_markertext != "") then { _marker setMarkerText _markertext; };
	if (!isnil ("_markerdir")) then { _marker setMarkerDir _markerdir; };
	if (!isnil ("_markertype")) then { _marker setMarkerType _markertype; };

	_marker;