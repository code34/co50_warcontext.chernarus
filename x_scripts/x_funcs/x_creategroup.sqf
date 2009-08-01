private ["_found_empty","_grp","_i","_side","_side_str","_this","_tmp_grp","_tmp_grp_a","_tmp_time","_x"];
can_create_group = false;
_side = _this select 0;_grp = grpNull;
_side_str = (switch (_side) do {case "EAST": {"east"};case "WEST": {"west"};case "RACS": {"resistance"};case "CIV": {"civilian"};});
call compile format ["
	if (count groups_%1 > 0) then {
		for ""_i"" from 0 to (count groups_%1 - 1) do {
			_tmp_grp_a = groups_%1 select _i;
			_tmp_time = _tmp_grp_a select 1;
			if (time >= _tmp_time) then {
				_tmp_grp = _tmp_grp_a select 0;
				if (isNull _tmp_grp) then {
					groups_%1 set [_i, objNull];
				} else {
					if (count (units _tmp_grp) == 0) then {
						deleteGroup _tmp_grp;
						groups_%1 set [_i, objNull];
					};
				};
			};
		};
		groups_%1 = groups_%1 - [objNull];
	};
	_grp = createGroup %1;
	groups_%1 = groups_%1 + [[_grp, time + 120]];
",_side_str];
can_create_group = true;
_grp