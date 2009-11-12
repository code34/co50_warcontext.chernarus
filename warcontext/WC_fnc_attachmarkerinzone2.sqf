	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext - Description:
	// Attach a marker to an object
	// -----------------------------------------------
	
	private [
		"_indexparameters",
		"_nbparameters",
		"_parameters",
		"_object",
		"_marker",
		"_markerposition",
		"_markername",
		"_markersize",
		"_markercolor",
		"_markershape",
		"_markerbrush",
		"_markertype",
		"_markerdir",
		"_markertext",
		"_refreshtime",
		"_protect",
		"_zone",
		"_zonepos",
		"_zonesize"
		];

	_parameters = [
		"_object",
		"_markername",
		"_markersize",
		"_markercolor",
		"_markershape",
		"_markerbrush",
		"_refreshtime",
		"_markertype",
		"_markerdir",
		"_markertext",
		"_protect",
		"_zone"
		];

	_indexparameters = 0;
	_nbparameters = count _this;
	{
		if (_indexparameters <= _nbparameters) then {
		call compile format["%1 = _this select %2;", _x, _indexparameters];
		};
		_indexparameters = _indexparameters + 1;
	}foreach _parameters;
	
	if (isnil ("_refreshtime")) then { _refreshtime = 4; };
	if (isnil ("_markername")) then { _markername = "dummy"; };
	if (isnil ("_markersize")) then { _markersize = 50; };
	if (_markercolor == "") then {_markercolor = "ColorRED"; };	
	if (isnil ("_markershape")) then { _markershape = "ELLIPSE"; };
	if (_markerbrush == "") then { _markerbrush = "FDIAGONAL"; };
	if(isnil "_protect") then { _protect = false;};

	_markerposition = getpos _object;
	_marker = [_markername, _markersize, _markerposition, _markercolor, _markershape, _markerbrush, _markertype, _markerdir, _markertext, _protect] call WC_fnc_createmarker;

	while {alive _object} do {
		_marker setMarkerPos (getpos _object);
		_zonepos = getmarkerpos _zone;
		_zonesize = (getmarkersize _zone) select 0;
		if ([_zonepos select 0, _zonepos select 1] distance [(position _object) select 0, (position _object) select 1] < _zonesize) then {
			_marker setMarkerType _markertype;
			_marker setMarkerShape _markershape;
		}else{
			_marker setMarkerType "EMPTY";
			_marker setMarkerShape "ICON";
		};
		sleep _refreshtime;
	};
	
	deletemarker _marker;