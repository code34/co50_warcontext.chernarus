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
		"_behaviour"
	];

	_typeof = _this select 0;

	if (isnil "_combatmode") then {_combatmode = "RED";};
	if (isnil "_behaviour") then {_behaviour = "AWARE";};

	_position = [wcmaptopright, wcmapbottomleft] call WC_fnc_createposition;

	call compile format["_arrayvehicle = [[_position select 0, _position select 1, 200], 0, '%1', east] call BIS_fnc_spawnVehicle;", _typeof];
	_vehicle = _arrayvehicle select 0;
	_driver = (_arrayvehicle select 1) select 0;

	_group = group _driver;
	_group setCombatMode _combatmode;
	_group setBehaviour _behaviour;
	_vehicle flyInHeight 250;
	_vehicle addeventhandler ['killed', {_this spawn WC_fnc_garbagecollector}];


	_vehicle addEventHandler ["hit", "
		(_this select 0) doTarget (_this select 1);
		hint format ['%1', _this select 0];
	"];

	while {alive _driver} do {
		_position = [wcmaptopright, wcmapbottomleft] call WC_fnc_createposition;
		_waypoint = _group addWaypoint [_position, 0];
		[_group, 0] setWaypointType "DESTROY";
		_group setCurrentWaypoint [_group, 0];
		waituntil {(_driver distance _position) < 500};
		deleteWaypoint [_group, 0];
	};
	_arrayvehicle;