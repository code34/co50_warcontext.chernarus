		// -----------------------------------------------
		// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
		// warcontext 
		// Deployed an radio
		// -----------------------------------------------

		private ["_unit", "_position", "_distance", "_mydir", "_enemy", "_azimuth", "_distance", "_range", "_primaryweapon"];

		_unit = _this select 0;
		_distance = 70;

		while {_distance < 800} do {
			_mydir = getdir player;
			_position =  [(getposasl player select 0) + (sin _mydir * _distance), (getposasl player select 1) + (cos _mydir * _distance)];
			_enemy = (_position nearObjects ["SoldierEB", 10]) select 0;
			if(!isnull _enemy) then {
				_enemy doTarget _unit;
				_enemy dofire _unit;
				_enemy domove (position _unit);
				_distance = 1000;
			};
			_distance = _distance + 10;
		};

		true;