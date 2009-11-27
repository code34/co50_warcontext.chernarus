	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext - Description:
	// respawn vehicle at their original position
	// Xeno respawn reworks
	// -----------------------------------------------
	if (!isServer) exitWith{};

	private [
		"_vehicle", 
		"_delay", 
		"_marker", 
		"_startpos", 
		"_startdir", 
		"_type", 
		"_disabled", 
		"_vehiclename"
	];
	
	_vehicle = _this select 0;
	_delay = _this select 1;
	_marker = _this select 2;
	_startpos = getposasl _vehicle;
	_startdir = getdir _vehicle;
	_type = typeof _vehicle;
	_vehiclename = vehicleVarName _vehicle;
	
	processInitCommands;

	//_handler = _vehicle addEventHandler ["IncomingMissile", {
	//	_vehicle = _this select 0;	
	//	{
	//		
	//	}foreach (units _vehicle);
	//}];

	while {true} do {
		if (({alive _x} count (crew _vehicle)) == 0) then {
			_disabled = (if (damage _vehicle > 0.9) then {true} else {false});
			if (_disabled || !(alive _vehicle)) then {
				clearVehicleInit _vehicle;
				deletevehicle _vehicle;
				sleep 0.5;
				_vehicle = _type createvehicle _startpos;
				_vehicle setPosASL _startpos;
				_vehicle setdir _startdir;
				_vehicle setVehicleVarName _vehiclename;
				call Compile Format ["%1=_vehicle; PublicVariable '%1';", _vehiclename];
				processInitCommands;
			};
		};
		sleep (_delay + random 15);
	};