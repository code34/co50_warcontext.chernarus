// -----------------------------------------------
// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// -----------------------------------------------
if (!isServer) exitWith{};

private [
	"_markername",
	"_markersize",
	"_trigger",
	"_triggerinventory",
	"_total",
	"_count",
	"_wcside",
	"_position",
	"_line",
	"_temp",
	"_tempindex"
	];

	// sanity number of minutes
	_minutes = 5;
	
	_trigger 	= _this select 0;
	_markername 	= _this select 1;
	_markersize	= _this select 2;

	_total = 0;

	for "_i" from 1 to _minutes do {
		sleep 10;
		_triggerinventory = list _trigger;
		_count = wcside countSide _triggerinventory;
		if (_count == 0) then { 
			_total = _total + 1;
 		};
	};
	
	// X minute without players in trigger zone, then delete enemy
	if (_total + 1 >= _minutes) then {
		_trigger setTriggerArea[_markersize, _markersize, 0, false];
		sleep 5;
		_triggerinventory = list _trigger;		
		{
			deletevehicle _x;
			wccounttotalunit = wccounttotalunit - 1;
		} foreach _triggerinventory;
		for "_tempindex" from 1 to wcgroupindex step 1 do {
			call compile format["if(typename wcgroup%1 == ""GROUP"") then {_temp = count(units wcgroup%1);}else{_temp = 1;};",  _tempindex];
			if (_temp == 0) then {
				call compile format["deletegroup wcgroup%1; wcgroup%1 = nil; ",  _tempindex];
				wcgroupcount = wcgroupcount - 1;
			}
		};
		_trigger setTriggerArea [wctriggersize, wctriggersize, 0, false];
		call compile format["wczoneready%1=true;wcsanity%1=true;",_markername];
	} else {
		nil = [_trigger, _markername, _markersize] spawn WC_fnc_cleantrigger;
	};