// by Xeno
private ["_cmdr","_crewmember","_dir","_direction","_drvr","_gnnr","_grp","_grpskill","_n","_numbervehicles","_pos","_radius","_ret","_the_vehicles","_this","_unit","_vehicle","_vehiclename"];
_numbervehicles = _this select 0;
_pos = _this select 1;
_crewmember = _this select 2;
_vehiclename = _this select 3;
_grp = _this select 4;
_radius = _this select 5;
_direction = _this select 6;
_the_vehicles = [];

_grpskill = (d_skill_array select 0) + (random (d_skill_array select 1));

for "_n" from 1 to _numbervehicles do {
		sleep 0.331;
		_vehicle = createVehicle [_vehiclename, _pos, [], _radius, "NONE"];
		if (_direction != -1.111) then {
			_dir = _direction;
		} else {
			_dir = floor random 360;
		};
		_vehicle setDir _dir;
		_the_vehicles = _the_vehicles + [_vehicle];
		if (x_lock_spawned) then {_vehicle lock true};
		sleep 0.543;
		_cmdr = _vehicle emptypositions "commander";_drvr = _vehicle emptypositions "driver";_gnnr = _vehicle emptypositions "gunner";
		if (_cmdr == 1) then {
			 _unit = _grp createUnit [_crewmember, _pos, [], 0, "NONE"];[_unit] join _grp;_unit setSkill _grpskill;_unit assignAsCommander _vehicle;_unit moveincommander _vehicle;
			if ((format["%1",_unit getVariable "ke"]) == "<null>") then {
				_unit addEventHandler ["killed", {[_this select 0] call XAddDead;}];
				_unit setVariable ["ke", 1];
			};
			sleep 0.531;
		};
		if (_drvr == 1) then {
			_unit = _grp createUnit [_crewmember, _pos, [], 0, "NONE"];[_unit] join _grp;_unit assignAsDriver _vehicle;_unit moveindriver _vehicle;
			if ((format["%1",_unit getVariable "ke"]) == "<null>") then {
				_unit addEventHandler ["killed", {[_this select 0] call XAddDead;}];
				_unit setVariable ["ke", 1];
			};
			sleep 0.432;
		};
		if (_gnnr == 1) then {
			_unit = _grp createUnit [_crewmember, _pos, [], 0, "NONE"];[_unit] join _grp;_unit assignAsGunner _vehicle;_unit moveingunner _vehicle;
			if ((format["%1",_unit getVariable "ke"]) == "<null>") then {
				_unit addEventHandler ["killed", {[_this select 0] call XAddDead;}];
				_unit setVariable ["ke", 1];
			};
			sleep 0.443;
		};
		if ((format["%1",_vehicle getVariable "ke"]) == "<null>") then {
			if (_vehicle isKindOf "Tank") then {
				_vehicle addEventHandler ["killed", {[_this select 0] spawn x_removevehi;[_this select 0, _this select 1] spawn x_dosmoke;}];
			} else {
				_vehicle addEventHandler ["killed", {[_this select 0] spawn x_removevehi;}];
			};
			_vehicle setVariable ["ke", 1];
		};
};
_ret=_the_vehicles;
_ret
