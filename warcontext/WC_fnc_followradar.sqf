	// -----------------------------------------------
	// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// -----------------------------------------------

	private ["_trgradar", "_marker", "_markersize", "_markername","_position"];

	_trgradar = createTrigger["EmptyDetector", [0,0,0]];
	_trgradar setTriggerArea[0,0,0,false];
	_trgradar setTriggerActivation["ANY", "PRESENT", TRUE];
	_trgradar setTriggerStatements["this", "", ""];

	// INIT MARKERS
	if (side player == wcside) then {
		_markersize = 0;
		_position = [0,0,0];
		_marker = ["RADARFIELDW", _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL', '', 0, '', true] call WC_fnc_createmarkerlocal;
	} else {
		_markersize = 0;
		_position = [0,0,0];
		_marker = ["RADARFIELDE", _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL', '', 0, '', true] call WC_fnc_createmarkerlocal;
	};

	while {!wcgameend} do {
		if (side player == wcside) then {
			if(alive wcradarW) then {
				_markersize = ((getposasl wcradarW) select 2) *5;
				_marker setmarkerposlocal (getpos wcradarW);
				_marker setmarkersizelocal [_markersize, _markersize];

				_trgradar setpos (position wcradarW);
				_trgradar setTriggerArea[_markersize,_markersize,0,false];

				if(count (list _trgradar) > 0) then {
					{
						if (_x iskindof "AIR" and format["%1", name _x] != "Error: No unit") then {
							_position = position _x;
							_markername = format["%1", name _x];
							nil = [_markername, 0.5, _position, 'ColorRed', 'ICON', 'FDIAGONAL', 'dot', 0, 'air'] spawn WC_fnc_createmarkerlocalanddelete;
						};
					}foreach (list _trgradar);
				};
			} else {
				_marker setmarkerposlocal [0,0,0];
				_marker setMarkerTypelocal "EMPTY";
				_trgradar setpos [0,0,0];
				_trgradar setTriggerArea[0,0,0,false];
			};
		} else {
			if(alive wcradarE) then {
				_markersize = ((getposasl wcradarE) select 2) *5;
				_marker setmarkerposlocal (getpos wcradarE);
				_marker setmarkersizelocal [_markersize, _markersize];

				_trgradar setpos (position wcradarE);
				_trgradar setTriggerArea[_markersize,_markersize,0,false];

				if(count (list _trgradar) > 0) then {
					{
						if (_x iskindof "AIR" and format["%1", name _x] != "Error: No unit") then {
							_position = position _x;
							_markername = format["%1", name _x];
							nil = [_markername, 0.5, _position, 'ColorRed', 'ICON', 'FDIAGONAL', 'dot', 0, 'air'] spawn WC_fnc_createmarkerlocalanddelete;
						};
					}foreach (list _trgradar);
				};
			} else {
				_marker setmarkerposlocal [0,0,0];
				_marker setMarkerTypelocal "EMPTY";
				_trgradar setpos [0,0,0];
				_trgradar setTriggerArea[0,0,0,false];
			};
		};
		sleep 2;
	};