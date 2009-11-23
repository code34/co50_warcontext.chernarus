	// -----------------------------------------------
	// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// -----------------------------------------------
	private ["_arrayofplayer", "_radio", "_markersize", "_position", "_marker"];

	WC_fnc_refreshplayerlist = {
		private ["_arrayofplayer"];
		if (side player == wcside) then {
			wcarrayofplayerE = [[j1, "j1"],[j2,"j2"],[j3,"j3"],[j4,"j4"],[j5,"j5"],[j6,"j6"],[j7,"j7"],[j8,"j8"],[j9,"j9"],[j10,"j10"],[j11,"j11"],[j12,"j12"],[j13,"j13"],[j14,"j14"],[j15,"j15"],[j16,"j16"],[j17,"j17"],[j18,"j18"],[j19,"j19"],[j20,"j20"]];
			_arrayofplayer =  wcarrayofplayerW;
		} else {
			wcarrayofplayerW = [[j21, "j21"],[j22,"j22"],[j23,"j23"],[j24,"j24"],[j25,"j25"],[j26,"j26"],[j27,"j27"],[j28,"j28"],[j29,"j29"],[j30,"j30"],[j31,"j31"],[j32,"j32"],[j33,"j33"],[j34,"j34"],[j35,"j35"],[j36,"j36"],[j37,"j37"],[j38,"j38"],[j39,"j39"],[j40,"j40"]];
			_arrayofplayer = wcarrayofplayerE;
		};
		wcarrayofplayerT = wcarrayofplayerW + wcarrayofplayerE;
		if (side player == wcside) then {
			if(wchackedE) then {
				_arrayofplayer = wcarrayofplayerT;
			};
		} else {
			if(wchackedW) then {
				_arrayofplayer = wcarrayofplayerT;
			};
		};
		_arrayofplayer;
	};

	// CREATE MARKERS FOR ALL SIDE PLAYERS
	_arrayofplayer = [] call WC_fnc_refreshplayerlist;
	{	
			_marker = [(_x select 1)+"hacked", 1, [0,0,0], 'ColorRed', 'ICON', 'FDIAGONAL', 'dot', 0, '', true] call WC_fnc_createmarkerlocal;
			_marker setMarkerTypelocal "EMPTY";
			_marker setMarkerShapelocal "ICON";
	}foreach _arrayofplayer;

	// CREATE RADIO MARKERS
	if (side player == wcside) then {
		_markersize = 0;
		_position = [0,0,0];
		_marker = ["RADIOHACKEDFIELDW", _markersize, _position, 'ColorRed', 'ELLIPSE', 'FDIAGONAL', '', 0, '', true] call WC_fnc_createmarkerlocal;
		_marker2 = ['radioHACKEDW', 0.5, _position, 'ColorRed', 'ICON', 'FDIAGONAL', 'Flag', 0, 'Enemy radio'] call WC_fnc_createmarkerlocal;
	} else {
		_markersize = 0;
		_position = [0,0,0];
		_marker = ["RADIOHACKEDFIELDE", _markersize, _position, 'ColorRed', 'ELLIPSE', 'FDIAGONAL', '', 0, '', true] call WC_fnc_createmarkerlocal;
		_marker2 = ['radioHACKEDE', 0.5, _position, 'ColorRed', 'ICON', 'FDIAGONAL', 'Flag', 0, 'Enemy radio'] call WC_fnc_createmarkerlocal;
	};

	while {!wcgameend} do {
		{
			_markername = (_x select 1) + "hacked";
			if (side player == wcside) then {
				_radio = wcradiohackedW;
			} else {
				_radio = wcradiohackedE;
			};
			if (alive _radio) then {
				_markersize = ((getposasl _radio) select 2) * 5;
				_marker setmarkerposlocal (getpos _radio);
				_marker2 setmarkerposlocal (getpos _radio);
				_marker setmarkersizelocal [_markersize, _markersize];
				
				if (alive (_x select 0) and (_x select 0) distance _radio < _markersize) then {
					_markername setmarkerposlocal (getpos (_x select 0));
					_markername setMarkerTypelocal "dot";
					_markername setMarkerTextlocal (name (_x select 0));
				} else {
					_markername setmarkerposlocal [0,0,0];
					_markername setMarkerTypelocal "EMPTY";
				};
			} else {
				_marker setmarkerposlocal [0,0,0];
				_marker setmarkersizelocal [0, 0];
				_markername setmarkerposlocal [0,0,0];
				_marker2 setmarkerposlocal [0,0,0];
				_markername setMarkerTypelocal "EMPTY";
			};
		}foreach _arrayofplayer;
		_arrayofplayer = [] call WC_fnc_refreshplayerlist;
		sleep 2;
	};