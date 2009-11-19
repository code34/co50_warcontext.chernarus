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

	if (!surfaceIsWater (position _vehicle)) then {
		if ((getposatl _vehicle) select 2 > 70) then {
			{
				if (driver _vehicle != _x) then {
					_x action["EJECT",_vehicle];
					sleep 1;		
				};
			}foreach (crew _vehicle);
			nil = [nil,nil,rHINT,'ParaDrop is finished'] call RE;
		} else {
			nil = [nil,nil,rHINT,'The altitude is too low'] call RE;
		};
	} else {
		hint "Cannot paradrop over sea !";
	};
