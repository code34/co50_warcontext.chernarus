	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// -----------------------------------------------
	if (!isServer) exitWith{};

	private [
		"_typeof",
		"_position",
		"_arrayvehicle",
		"_pilot",
		"_waypoint",
		"_vehicle",
		"_group",
		"_combatmode",
		"_behaviour",
		"_vehicle",
		"_fuel",
		"_zone",
		"_zonepos",
		"_zonesize"
	];

	_typeof = _this select 0;

	if (isnil "_combatmode") then {_combatmode = "RED";};
	if (isnil "_behaviour") then {_behaviour = "AWARE";};

	_position = [wcmaptopright, wcmapbottomleft] call WC_fnc_createposition;

	sleep 2;

	call compile format["_arrayvehicle = [[_position select 0, _position select 1, 200], 0, '%1', east] call BIS_fnc_spawnVehicle;", _typeof];
	_vehicle = _arrayvehicle select 0;
	_pilot = (_arrayvehicle select 1) select 0;
	nil = [_pilot, wcskill] spawn WC_fnc_setskill;

	_group = group _pilot;
	_group setCombatMode _combatmode;
	_group setBehaviour _behaviour;

	[_vehicle] spawn EXT_fnc_vftcas;

	_vehicle addeventhandler ['Killed', '
		_this spawn WC_fnc_garbagecollector;
	'];

	_vehicle addEventHandler ['Hit', '
		(_this select 0) doTarget (_this select 1);
	'];

	while {getdammage _vehicle < 0.8} do {
		if ([(position _vehicle) select 0,(position _vehicle) select 1] distance _position < 1000) then {
			_position = [wcmaptopright, wcmapbottomleft] call WC_fnc_createposition;
			_pilot domove _position;
		}else{
			_pilot domove _position;
		};
		if (fuel _vehicle < 0.1) then {
			(driver _vehicle) domove (position wclandingzone1);
			waituntil{ ([(position _vehicle) select 0,(position _vehicle) select 1] distance (position wclandingzone1)) < 500};
			_vehicle land 'LAND';
			_vehicle setfuel 1;
		};
		if (!isnull wcradio and random 1 > 0.9) then {
			_zone = "RADIOFIELD";
			_zonepos = getmarkerpos _zone;
			_zonesize = (getmarkersize _zone) select 0;
			if ([_zonepos select 0, _zonepos select 1] distance [(position _vehicle) select 0, (position _vehicle) select 1] < _zonesize) then {
				_pilot dotarget wcradio;
				_pilot dofire wcradio;
			};
		};
		sleep 120;
	};

	true;