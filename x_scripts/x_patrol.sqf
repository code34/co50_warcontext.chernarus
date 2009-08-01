private ["_grp","_grp_array","_leader","_not_reached_wp_array","_start_pos","_wp_array","_wp_pos","_private_patrol_group_array"];

_not_reached_wp_array = [];
_private_patrol_group_array = [];
if (isNil "ROMM_IA_GROUPS") then {ROMM_IA_GROUPS = []};
if (isNil "attacking_xlgroups") then {attacking_xlgroups = []};
while {true} do {
	{
		_grp_array = _x;
		_grp = _grp_array select 0;
		if (!(isNull _grp) && ({alive _x} count (units _grp)) > 0 && !(_grp in ROMM_IA_GROUPS)) then {
			if (!(_grp in attacking_xlgroups)) then {
				_wp_array = _grp_array select 3;
				_leader = leader _grp;
				_start_pos = position _leader;
				sleep 0.01;
				if (!(_grp in _not_reached_wp_array)) then {
					_wp_pos = _wp_array select ([count _wp_array] call x_getrandom);
					_not_reached_wp_array = _not_reached_wp_array + [_grp];
					sleep 0.01;
					if (!isNull _grp) then {
						if (({alive _x} count units _grp) > 0) then {
							while {_wp_pos distance _start_pos < 20} do {
								_wp_pos = _wp_array select ([count _wp_array] call x_getrandom);
								sleep 0.01;
							};
							_grp move _wp_pos;
							_grp setSpeedMode "LIMITED";
							_grp_array set [4, _wp_pos];
						};
					};
				} else {
					if ((position _leader) distance (_grp_array select 4) < 10) then {
						if (!isNull _grp) then {
							if (({alive _x} count units _grp) > 0) then {
								_wp_pos = _wp_array select ([count _wp_array] call x_getrandom);
								while {_wp_pos distance _start_pos < 20} do {
									_wp_pos = _wp_array select ([count _wp_array] call x_getrandom);
									sleep 0.01;
								};
								_grp move _wp_pos;
								_grp setSpeedMode "LIMITED";
								_grp_array set [4, _wp_pos];
							};
						};
					};
				};
			};
		} else {
			if (_grp in _not_reached_wp_array) then {
				_not_reached_wp_array = _not_reached_wp_array - [_grp];
			};
		};
		sleep 3.528;
	} forEach _private_patrol_group_array;
	sleep 1.076;
	for "_tp" from 0 to (count _private_patrol_group_array - 1) do {
		_grp_array = _private_patrol_group_array select _tp;
		_grp = _grp_array select 0;
		if (isNull _grp || ({alive _x} count (units _grp)) == 0) then {
			_private_patrol_group_array set [_tp, objNull];
		};
		sleep 0.012;
	};
	_private_patrol_group_array = _private_patrol_group_array - [objNull];
	sleep 0.5321;
	for "_tp" from 0 to (count _not_reached_wp_array - 1) do {
		_grp = _not_reached_wp_array select _tp;
		if (isNull _grp || ({alive _x} count (units _grp)) == 0) then {
			_not_reached_wp_array set [_tp, objNull];
		};
		sleep 0.012;
	};
	_not_reached_wp_array = _not_reached_wp_array - [objNull];
	sleep 12.631;
	if (count patrol_groups_array > 0) then {
		can_add_patrol_group = false;
		_private_patrol_group_array = _private_patrol_group_array + patrol_groups_array;
		patrol_groups_array = nil;
		patrol_groups_array = [];
		can_add_patrol_group = true;
		sleep 1.218;
	};
};

if (true) exitWith {};