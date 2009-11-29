	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext - Description: Lock / Unlock
	// -----------------------------------------------

	private ["_vehicle", "_unit", "_player", "_locker", "_actionid", "_seed", "_name"];

	_vehicle = _this select 0;
	_unit = _this select 1;
	_player = name _unit;
	_locker = _vehicle getVariable 'wclocker';
	_actionid = _this select 2;
	_seed = _this select 3;
	_name = name player + format["%1", _seed];

	if (isnil "_locker") then {
		if (count (units _vehicle) == 0) then {
			_vehicle setVariable ['wclocker', _player, true];
			_vehicle setVariable [_name, false, true];
			_vehicle setVehicleInit "this lock true;";
			processInitCommands;
			hint 'vehicle lock !';
		} else {
			hint 'There is people inboard';
		};
	} else {
		if(_player == _locker or (typeof player) == "USMC_SoldierS_Engineer" or (typeof player) == "RU_Soldier_Crew") then {
			_vehicle setVariable ["wclocker", _nil, true];
			_vehicle setVariable [_name, false, true];
			_vehicle setVehicleInit "this lock false;";
			processInitCommands;
			hint 'vehicle unlock !';			
		} else {
			hint format['vehicle has been lock by %1', _locker];
		};
	};

