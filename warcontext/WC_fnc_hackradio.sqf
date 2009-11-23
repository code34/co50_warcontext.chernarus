	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext - Description:
	// Hack radio tower
	// -----------------------------------------------

	_radio = _this select 0;
	_player = _this select 1;

	if(side _player == wcside) then {
		wchackedE = true;
		publicvariable "wchackedE";
	} else {
		wchackedW = true;
		publicvariable "wchackedW";
	};

	waituntil {!alive _radio};

	if(side _player == wcside) then {
		wchackedE = false;
		publicvariable "wchackedE";
	} else {
		wchackedW = false;
		publicvariable "wchackedW";
	};