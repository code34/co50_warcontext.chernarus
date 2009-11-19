	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// -----------------------------------------------
	if (!local player) exitWith {};

	private [
		"_list",
		"_vehicle",
		"_para",
		"_object",
		"_position",
		"_mydir"
		];

	_vehicle = vehicle player;

	if !(_vehicle getVariable "wcammocrate") exitWith {hint "No Ammo crate in board";};

	if (!surfaceIsWater (position _vehicle)) then {
		if ((getposatl _vehicle) select 2 > 70) then {
			_para = "ParachuteBigWest" createVehicle [(getposatl _vehicle) select 0, (getposatl _vehicle) select 1,((getposatl _vehicle) select 2) - 20];
			_object = "USVehicleBox" createVehicle [(getposatl _vehicle) select 0, (getposatl _vehicle) select 1, ((getposatl _vehicle) select 2) - 25];
			_para setposasl [(getposatl _vehicle) select 0, (getposatl _vehicle) select 1,((getposatl _vehicle) select 2) - 20];
			_object setposasl [(getposatl _vehicle) select 0, (getposatl _vehicle) select 1,((getposatl _vehicle) select 2) - 25];		
			_object attachTo [_para,[0,0,0],"paraEnd"];
			_vehicle setVariable ["wcammocrate", false, true];
			waituntil {((((position _object) select 2) < 0.6) || (isNil "_para"))};
			detach _object;
			_object SetVelocity [0,0,-5];
			sleep 0.3;
			_position = [(position _object) select 0, (position _object) select 1, 0];
			deletevehicle _object;

			if (side player == wcside) then {
				wcammoboxpositionW = _position;
				publicvariable "wcammoboxpositionW";
			} else {
				wcammoboxpositionE = _position;
				publicvariable "wcammoboxpositionE";				
			};
			nil = [_position] spawn WC_fnc_createammobox;
			hint "Drop is finished"; 
		} else {
				if ((getpos _vehicle) select 2 < 1) then {
					_mydir = getdir _vehicle;
					_position =  [(getpos _vehicle select 0) + (sin _mydir * 10), (getpos _vehicle select 1) + (cos _mydir * 10)];
					if (side player == wcside) then {
						wcammoboxpositionW = _position;
						publicvariable "wcammoboxpositionW";
					} else {
						wcammoboxpositionE = _position;
						publicvariable "wcammoboxpositionE";				
					};
					nil = [_position] spawn WC_fnc_createammobox;
					nil = ["", _object] spawn WC_fnc_createammobox;
					_vehicle setVariable ["wcammocrate", false, true];
					hint "Drop is finished";
				} else {
					hint "The altitude is not enough High";
				};
		};
	} else {
		hint "Cannot paradrop over sea !";
	};