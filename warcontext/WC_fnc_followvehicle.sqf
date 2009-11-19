	// -----------------------------------------------
	// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// -----------------------------------------------
	private ["_arrayofvehicle"];

	if (side player == wcside) then {
		wcarrayofvehicleW = [uh1, uh2, uh3, mv22, bh1, bh2];
		_arrayofvehicle = wcarrayofvehicleW;
	} else {
		wcarrayofvehicleE = [RU1, RU2, RU3, RU4, RU5, RU6, RU7, RU8, RU9];
		_arrayofvehicle = wcarrayofvehicleE;
	};


	{	
		nil = [format["veh%1", _x], 1, getpos _x, 'ColorGreen', 'ICON', 'FDIAGONAL', 'b_air', 0, typeof _x, true] call WC_fnc_createmarkerlocal;
	}foreach _arrayofvehicle;

	while {!wcgameend} do {
		{
			format["veh%1", _x] setmarkerposlocal (getpos _x);
		}foreach _arrayofvehicle;
		sleep 2;
	};