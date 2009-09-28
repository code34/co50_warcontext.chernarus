// Norrn_SlopeFix - AI disabled
// © JUNE 2009 - norrin

_pos 		= _this select 0;
_slope 		= _this select 1; 

_radius = 0;
_found_it = false;
while {_slope >= NORRN_max_slope && !_found_it} do
{
	_center_x = _pos select 0;
	_center_y = _pos select 1;
	_radius = _radius + 10;
	_angle = 0;
		
	while {_angle < 350 && !_found_it} do 
	{
		_x1 = _center_x - (_radius * sin _angle);
		_y1 = _center_y - (_radius * cos _angle);
		_slope = [[_x1, _y1, 0], 1] call GetTerrainSlope;
		if (_slope < NORRN_max_slope) then 
		{
			_pos = [_x1, _y1, 0];
			_found_it = true;		
	}else{
		_angle = _angle + 15;
		sleep 0.005;
		};
	};
};

if (_found_it) then
{
	player setVariable ["NORRN_pos_x", _pos select 0, true];
	player setVariable ["NORRN_pos_y", _pos select 1, true];
};

//file modified 030609