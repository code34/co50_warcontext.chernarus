// by Xeno
private ["_gwp_formations","_ggrp","_gidx","_static"];
_ggrp = _this select 0;
_static = _this select 1;
_gwp_formations = ["COLUMN","STAG COLUMN","WEDGE","ECH LEFT","ECH RIGHT","VEE","LINE","FILE","DIAMOND"];
_ggrp setCombatMode "YELLOW";
_gidx = floor random count _gwp_formations;
_ggrp setFormation (_gwp_formations select _gidx);
_ggrp setFormDir (floor random 360);
_ggrp setSpeedMode "NORMAL";
_ggrp setBehaviour "AWARE";
