	// -----------------------------------------------
	// Author:_arrayobjects =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// -----------------------------------------------
	private [
		"_vehicle",
		"_object",
		"_arrayobjects"
		];

	_vehicle = _this select 0;

	if((getpos _vehicle) select 2 > 6 and (getpos _vehicle) select 2 < 20) then {
		_object = objNull;
		_arrayobjects = nearestObjects [_vehicle, ["LandVehicle", "Air", "Misc_cargo_cont_net1"],40];
		if (count _arrayobjects > 1) then {
			hint format["Lift: %1", typeof (_arrayobjects select 1)];
			_object = _arrayobjects select 1;
			_object attachTo [_vehicle, [0,0,-15]];
			_vehicle removeAction (_this select 2);
			_vehicle addaction ["unlift","warcontext\WC_fnc_heliunlift.sqf",[],-1,false];
		};
		waituntil {wcvehiclerelease or !alive _vehicle};
		wcvehiclerelease = false;
		detach _object;
		if (typeof _object == "Misc_cargo_cont_net1") then {
			_object setpos [(position _object select 0), (position _object select 1), 0];
		};
		wcmenulift = _vehicle addaction ["Lift","warcontext\WC_fnc_helilift.sqf",[],-1,false];	
	};
	true;