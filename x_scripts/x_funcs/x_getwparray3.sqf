// by Xeno
private ["_a","_angle","_atan","_b","_centerx","_centery","_height","_leftx","_lefty","_nolst","_pos","_posi","_px1","_py1","_radius","_width","_wp_array","_wp_counter","_x1","_y1"];
_pos = _this select 0;_a = _this select 1;_b = _this select 2;_angle = _this select 3;
_centerx = _pos select 0;_centery = _pos select 1;_leftx = _centerx - _a;_lefty = _centery - _b;
_width = 2 * _a;_height = 2 * _b;_wp_counter = 0;_wp_array = [];

while {_wp_counter < 100} do {_px1 = _leftx + random _width;_py1 = _lefty + random _height;_radius = _pos distance [_px1,_py1];_atan = (_centerx - _px1) atan2 (_centery - _py1);
	_x1 = _centerx - (_radius * sin (_atan + _angle));_y1 = _centery - (_radius * cos (_atan + _angle));_posi = [_x1, _y1];
	if (!(surfaceiswater [_x1, _y1])) then {_nolst=_posi nearObjects ["House",6];sleep 0.0132;if (count _nolst == 0) then {_wp_array = _wp_array + [_posi];_wp_counter = _wp_counter + 1;};};sleep 0.0152; // 0.2
};

_wp_array
