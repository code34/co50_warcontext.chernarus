// by Xeno
private["_tc", "_radius","_center_x", "_center_y", "_wp_counter", "_wp_array","_angle","_x1","_y1","_posi","_nolst"];
_tc = _this select 0;
_radius = _this select 1;

_center_x = _tc select 0;
_center_y = _tc select 1;

_wp_counter = 0;
_wp_array = [];

while {_wp_counter < 100} do {
	_angle = floor (random 360);_x1 = _center_x - ((random _radius) * sin _angle);_y1 = _center_y - ((random _radius) * cos _angle);_posi = [_x1, _y1];
	if (!(surfaceiswater [_x1, _y1])) then {_nolst=_posi nearObjects ["Static",6];sleep 0.0132;if (count _nolst == 0) then {_wp_array = _wp_array + [_posi];_wp_counter = _wp_counter + 1;};};sleep 0.0152; // 0.2
};

_wp_array
