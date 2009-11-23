	// -----------------------------------------------
	// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// -----------------------------------------------

	private ["_trgradar", "_marker", "_markersize", "_markername","_position"];

	// INIT MARKERS
	if (side player == wcside) then {
		_position = [0,0,0];
		_marker = ['WHOSPITAL', 1, _position, 'ColorGreen', 'ICON', 'FDIAGONAL', 'Headquarters', 0, 'HOSPITAL', true] call WC_fnc_createmarkerlocal;
	} else {
		_position = [0,0,0];
		_marker = ['EHOSPITAL', 1, _position, 'ColorGreen', 'ICON', 'FDIAGONAL', 'Headquarters', 0, 'HOSPITAL', true] call WC_fnc_createmarkerlocal;
	};

	while {!wcgameend} do {
		if (side player == wcside) then {
			if(alive wchospitalW) then {
				_marker setmarkerposlocal (getpos wchospitalW);
				_marker setmarkersizelocal [1, 1];
			} else {
				_marker setmarkerposlocal [0,0,0];
				_marker setmarkersizelocal [0, 0];
			};
		} else {
			if(alive wchospitalE) then {
				_marker setmarkerposlocal (getpos wchospitalE);
				_marker setmarkersizelocal [1, 1];
			} else {
				_marker setmarkerposlocal [0,0,0];
				_marker setmarkersizelocal [0, 0];
			};
		};
		sleep 2;
	};