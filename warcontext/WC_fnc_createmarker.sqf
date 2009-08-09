// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext - Description: 
// create a marker
// -----------------------------------------------

private [
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

	_markername		= _this select 0;
	_markersize		= _this select 1;
	_markerposition		= _this select 2;
	_markercolor		= _this select 3;
	_markershape		= _this select 4;
	_markerbrush		= _this select 5;
	_markertype		= _this select 6;
	_markerdir		= _this select 7;
	_markertext		= _this select 8;

	call compile format["hintC 'nom: %1 taille:%2 position:%3 couleur:%4 shape:%5 brush:%6 type:%7 dir:%8 text%9 ;'", 
	_markername, 
	_markersize, 
	_markerposition,
	_markercolor,
	_markershape,
	_markerbrush,
	_markertype,
	_markerdir,
	_markertext
	];

	//_marker = createMarker[_markername, _markerposition];
	//if (!isnil "_markersize") then { _marker setMarkerSize [_markersize, _markersize]; };
	//if (!isnil "_markershape") then { _marker setMarkershape _markershape; };
	//if (!isnil "_markercolor") then { _marker setMarkerColor _markercolor; };
	//if (!isnil "_markerbrush") then { _marker setMarkerBrush _markerbrush; };
	//if (!isnil "_markertext") then { _marker setMarkerText _markertext; };
	//if (!isnil "_markerdir") then { _marker setMarkerDir _markerdir; };
	//if (!isnil "_markertype") then { _marker setMarkerType _markertype; };

	//_marker;
	true;