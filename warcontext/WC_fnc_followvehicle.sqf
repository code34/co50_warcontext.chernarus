	// -----------------------------------------------
	// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// -----------------------------------------------
	private ["_arrayofvehicle", "_x", "_markername", "_position"];

	WC_fnc_refreshvehiclelist = {
		private ["_arrayofvehicle"];
		if (side player == wcside) then {
			wcarrayofvehicleW = [
					["US1", US1],
					["US2", US2],
					["US3", US3],
					["US4", US4],
					["US5", US5],
					["US6", US6],
					["US7", US7],
					["US8", US8],
					["US9", US9],
					["US10", US10],
					["US11", US11],
					["US12", US12]
					];
			_arrayofvehicle = wcarrayofvehicleW;
		} else {
			wcarrayofvehicleE = [
				["RU1", RU1],
				["RU2", RU2],
				["RU3", RU3],
				["RU4", RU4],
				["RU5", RU5],
				["RU6", RU6],
				["RU7", RU7],
				["RU8", RU8],
				["RU9", RU9]
				];
			_arrayofvehicle = wcarrayofvehicleE;
		};
		_arrayofvehicle;
	};

	_arrayofvehicle = [] call WC_fnc_refreshvehiclelist;
	{
		_markername = _x select 0;
		nil = [_markername, 1, [0,0,0], 'ColorGreen', 'ICON', 'FDIAGONAL', 'b_air', 0, '', true] call WC_fnc_createmarkerlocal;
	}foreach _arrayofvehicle;

	while {!wcgameend} do {
		{
			if (alive (_x select 1)) then {
				_markername = _x select 0;
				_position = getpos (_x select 1);
				_markername setmarkerposlocal _position;
				_markername setmarkertextlocal (typeof (_x select 1));
			};
		}foreach _arrayofvehicle;
		_arrayofvehicle = [] call WC_fnc_refreshvehiclelist;
		sleep 2;
	};