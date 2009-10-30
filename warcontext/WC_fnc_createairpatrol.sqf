	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// -----------------------------------------------
	if (!isServer) exitWith{};

	private [
		"_typeof",
		"_position",
		"_arrayvehicle",
		"_driver",
		"_waypoint",
		"_vehicle",
		"_group",
		"_combatmode",
		"_behaviour",
		"_vehicle",
		"_fuel"
	];

	_typeof = _this select 0;

	if (isnil "_combatmode") then {_combatmode = "RED";};
	if (isnil "_behaviour") then {_behaviour = "AWARE";};

	_position = [wcmaptopright, wcmapbottomleft] call WC_fnc_createposition;

	sleep 2;

	call compile format["_arrayvehicle = [[_position select 0, _position select 1, 200], 0, '%1', east] call BIS_fnc_spawnVehicle;", _typeof];
	_vehicle = _arrayvehicle select 0;
	_driver = (_arrayvehicle select 1) select 0;

	_group = group _driver;
	_group setCombatMode _combatmode;
	_group setBehaviour _behaviour;
	_vehicle flyInHeight 250;
	_vehicle setVariable ["refuel", true, true];
	_vehicle setfuel 0.2;

	_vehicle addeventhandler ['killed', "
		_this spawn WC_fnc_garbagecollector;
	"];


	_vehicle addEventHandler ["hit", "
		(_this select 0) doTarget (_this select 1);
	"];

	while {alive _vehicle} do {
		_position = [wcmaptopright, wcmapbottomleft] call WC_fnc_createposition;
		_waypoint = _group addWaypoint [_position, 0];
		[_group, 0] setWaypointType "DESTROY";
		_group setCurrentWaypoint _waypoint;
		while {(_driver distance _position) > 500} do {
			_driver domove _position;
			sleep 5;
		};
		deleteWaypoint [_group, 0];
		if (fuel _vehicle < 0.1) then {
			(driver _vehicle) domove (position wclandingzone1);
			waituntil{ (_vehicle distance (position wclandingzone1)) < 300};
			_vehicle land 'LAND';
			_vehicle setfuel 0.2;
		};
	};

	_arrayvehicle;