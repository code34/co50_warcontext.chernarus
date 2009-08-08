// by Xeno
private ["_ggrp","_gtarget_pos","_gwp"];
_ggrp = _this select 0;
_gtarget_pos = _this select 1;
_ggrp setbehaviour "AWARE";
_gwp = _ggrp addWaypoint [_gtarget_pos,d_attackwaves_radius];
_gwp setwaypointtype "SAD";
_gwp setWaypointSpeed "FULL";
