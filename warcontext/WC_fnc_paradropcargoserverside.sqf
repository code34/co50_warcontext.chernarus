	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext  - paragroup
	// -----------------------------------------------
	if (!isServer) exitWith{};

	private [
		"_list",
		"_vehicle",
		"_para"
		];

	_vehicle = wcparadropcargo;

	{
		if (driver _vehicle != _x) then {
			_x action["EJECT",_vehicle];
			sleep 1;		
		};
	}foreach (crew _vehicle);
