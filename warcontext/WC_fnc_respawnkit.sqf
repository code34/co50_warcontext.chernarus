	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext - Description:
	// respawn vehicle at their original position
	// Xeno respawn reworks
	// -----------------------------------------------
	if (!isServer) exitWith{};

	private [
		"_position",
		"_list",
		"_object"
	];
	
	_landingzone = ["kitfactory1", "kitfactory2", "kitfactory3", "kitfactory4"];
	
	processInitCommands;

	while {!wcgameend} do {
		{
			_position = getmarkerpos _x;
			_list = nearestObjects [_position, ["Misc_cargo_cont_net1"], 5];
			if(count _list == 0) then {
				_object = "Misc_cargo_cont_net1" createVehicle _position;
				wcconstructionkitposition = _position;
				if (side player == wcside) then {
					wcconstructionkitpositionW = getpos _object;
					publicvariable 'wcconstructionkitpositionW';
				} else {
					wcconstructionkitpositionE = getpos _object;
					publicvariable 'wcconstructionkitpositionE';
				};
			};
		}foreach _landingzone;
		sleep 120 + (random 240);
	};
	true;