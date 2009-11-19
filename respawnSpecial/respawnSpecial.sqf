	//respawnSpecial.sqf
	// Edit by nicolas_boiteux@yahoo.fr
	private ["_vehicle"];
	_vehicle = _this select 0;

	player moveINCargo _vehicle;
	player action ["EJECT", _vehicle];
	unassignVehicle player;
	true;
