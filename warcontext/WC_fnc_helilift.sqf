	// -----------------------------------------------
	// Author:_arrayobjects =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// -----------------------------------------------
	if !(local player) exitWith{};

	private [
		"_vehicle",
		"_object",
		"_arrayobjects",
		"_liftnotpermit"
		];

	_vehicle = _this select 0;
	wcvehiclerelease = false;

	_liftnotpermit = ["2S6M_Tunguska", "BMP2_Ambul_CDF", "BMP2_Ambul_INS", "BMP2_CDF", "BMP2_Gue", "BMP2_HQ_CDF", "BMP2_HQ_INS", "BMP2_INS", "BMP3", "M1A1", "M1A2_TUSK_MG", "MLRS", "T34", "T72_CDF", "T72_Gue", "T72_INS", "T72_RU", "T90", "ZSU_CDF", "ZSU_INS"];

	if((getpos _vehicle) select 2 > 3 and (getpos _vehicle) select 2 < 20) then {
		_object = objNull;
		_arrayobjects = nearestObjects [_vehicle, ["LandVehicle", "Air", "Misc_cargo_cont_net1"],40];
		if (count _arrayobjects > 1) then {
			_object = _arrayobjects select 1;
			if (typeof _object in _liftnotpermit) exitwith {hint format["%1 can not be lift", typeof _object]}; 
			hint format["Lift: %1", typeof (_arrayobjects select 1)];
			_object attachTo [_vehicle, [0,0,-15]];
			_vehicle removeAction (_this select 2);
			_vehicle addaction ["unlift","warcontext\WC_fnc_heliunlift.sqf",[],6,false];

		};
		waituntil {wcvehiclerelease or !alive _vehicle};
		wcvehiclerelease = false;
		detach _object;
		if (typeof _object == "Misc_cargo_cont_net1") then {
			_object setpos [(position _object select 0), (position _object select 1), 0];
		};
		wcmenulift = _vehicle addaction ["Lift","warcontext\WC_fnc_helilift.sqf",[],6,false];	
	};
	true;