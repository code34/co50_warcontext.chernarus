// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// -----------------------------------------------
//if (!isServer) exitWith{};
private [
	"_markername",
	"_position", 
	"_markersize",
	"_pos",
	"_newpos",
	"_xmove",
	"_ymove",
	"_exit"
	];

	_markername = _this select 0;

	_pos = [wcmaptopright, wcmapbottomleft] call func_createposition;

	call compile format["convoi%1 = createMarker[""convoi%1"", _pos];", _markername];
	call compile format[" ""convoi%1"" setMarkerSize [wctriggersize, wctriggersize];", _markername];
	
	if (wcdebug) then {
		call compile format[" ""convoi%1"" setMarkershape ""ELLIPSE"";", _markername];
		call compile format[" ""convoi%1"" setMarkerBrush ""CROSS"";", _markername];
		call compile format[" ""convoi%1"" setMarkerColor ""ColorRed"";", _markername];
		
	};

	_randomvehicle = [
		"brdm",
		"bmp",
		"mi17",
		"d30",
		"shilka",
		"t72",
		"ka50",
		"uazmg",
		"uazags30",
		"brdmatg"
	];

	_randomunit = [
		"army1",
		"special1",
		"special2"
	];

	_randomunitoccupation = random 10;
	_randomvehicleoccupation = random 5;
	_listofunit = [];
	_listofvehicle = [];
	_exit = false;

	while {(count _listofunit < _randomunitoccupation)} do {
		_index = 0;
		_index = floor random (count _randomunit);
		_unit = _randomunit select _index;
		_listofunit = _listofunit + [_unit];
		sleep 0.1;
	};

	while {(count _listofvehicle < _randomvehicleoccupation)} do {
		_index = 0;
		_index = floor random (count _randomvehicle);
		_vehicle = _randomvehicle select _index;
		_listofvehicle = _listofvehicle + [_vehicle];
		sleep 0.1;
	};

	_listglobal = _listofvehicle + _listofunit;

	_line = "";
	{
		_line = _line + format ["nil = [%1ups,'%2'] spawn func_creategroup;", _markername, _x];
	}foreach _listglobal;

	call compile format ["trgconvoi%1 = createTrigger[""EmptyDetector"",%2];",_markername,_pos]; 
	call compile format ["trgconvoi%1 setTriggerArea[%2,%2,0,false];",_markername, wctriggersize];
	call compile format ["trgconvoi%1 setTriggerActivation[""%2"",""PRESENT"", TRUE];",_markername, wcside];
	call compile format ["trgconvoi%1 setTriggerStatements[""this"", ""15 setOvercast 1; 15 setRain 1;"", ""15 setOvercast 1; 15 setRain 0""];", _markername, _line];

	_xmove = 100;
	_ymove = 100;
	while {(!_exit)} do {
		call compile format[" _pos = getMarkerPos ""convoi%1"";", _markername];
		if(random 100 < 10) then { _xmove = _xmove * -1 };
		if(random 100 < 10) then { _ymove = _ymove * -1 };
		if ((_pos select 0) > 19881) then { _xmove = -100;};
		if ((_pos select 1) > 17756) then { _ymove = -100;};
		if ((_pos select 0) < 5445) then { _xmove = 100;};
		if ((_pos select 1) < 5207) then { _ymove = 100;};
		sleep 2;
		_newpos = [(_pos select 0) + _xmove, (_pos select 1) + _ymove ,0];
		call compile format[" ""convoi%1"" setMarkerPos _newpos;", _markername];
		call compile format ["trgconvoi%1 setpos _pos;", _markername];
	};

	hint 'hello';