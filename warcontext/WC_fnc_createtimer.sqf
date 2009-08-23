// -----------------------------------------------
// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext - description: create a timer
// -----------------------------------------------
if (!isServer) exitWith{};

	private [
		"_count",
		"_time",
		"_timemax",
		"_timeleft",
		"_text"
		];

	_timemax 	= _this select 0;
	_texttorhint	= _this select 1;

	_count = 0;
	_timeleft = _timemax;

	while{(_timeleft > 0)} do{
		sleep 0.99;
		if (_count > 59) then {
			_text = format ["%1 %2 minute(s)", _texttorhint, ceil(_timeleft / 60)];
			nil = [nil,nil,rHINT, _text] call RE;
			_count = 0;
		};
		_count = _count + 1;
		_timeleft = _timeleft - 1;
	};
	true;