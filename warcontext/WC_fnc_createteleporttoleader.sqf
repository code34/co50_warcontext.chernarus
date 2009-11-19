	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext - Description:
	// Attach a marker to an object
	// -----------------------------------------------

	private ["_leader", "_player", "_position"];
	
	_player = _this select 1;

	_leader = (leader (group _player));
	if (vehicle _leader == _leader) then {
		_player setposasl (getposasl _leader);
	} else {
		_position = (vehicle _leader) emptyPositions "cargo";
		if (_position > 0) then {
			_player moveincargo (vehicle _leader);
		};
	};