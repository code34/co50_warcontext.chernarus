	// -----------------------------------------------
	// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// Deployed an radar
	// -----------------------------------------------
	 private ["_position"];

	player playMove "AinvPknlMstpSlayWrflDnon_medic";
	sleep 4;
	_mydir = getdir player;
	_position =  [(getposasl player select 0) + (sin _mydir * 2), (getposasl player select 1) + (cos _mydir * 2), (getposasl player) select 2];
	_list = _position nearObjects 5;

	{
		if (getdammage _x < 1 && (_x isKindOf "Tank" or _x isKindOf "Air")) then {
			_x setdammage 0;
		};
	}foreach _list;