// by Xeno
private ["_remove_dead_list", "_max_non_delete", "_gg", "_ele"];

if (!isServer) exitWith{};

sleep 30;

_remove_dead_list = [];
_max_non_delete = 30;

while {true} do {
	// add to the new units list
	if (count dead_list > 0) then {
		_remove_dead_list = _remove_dead_list + dead_list;
		dead_list = [];
		if (count _remove_dead_list > _max_non_delete) then {
			sleep 5.723;
			for "_gg" from 0 to ((count _remove_dead_list) - _max_non_delete) do {
				_ele = _remove_dead_list select _gg;
				if (!isNull _ele) then {
					_ele removealleventhandlers "killed";
					_ele removealleventhandlers "hit";
					deletevehicle _ele;
				};
				_remove_dead_list set [_gg, "XX_RM_ME_XX"];
				sleep 2.622;
			};
			_remove_dead_list = _remove_dead_list - ["XX_RM_ME_XX"];
		};
	};

	sleep 15.461;
};

if (true) exitWith {};
