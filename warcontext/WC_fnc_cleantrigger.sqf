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
	"_tempindex",
	"_group"
	];

	// sanity number of minutes
	_minutes = 3;
	
	_trigger 	= _this select 0;
	_markername 	= _this select 1;
	_markersize	= _this select 2;

	_total = 0;

	for "_i" from 1 to _minutes do {
		sleep 60;
		_triggerinventory = list _trigger;
		_count = wcside countSide _triggerinventory;
		if (_count == 0) then { 
			_total = _total + 1;
 		};
	};

	// X minute without players in trigger zone, then delete enemy
	if (_total + 1 >= _minutes) then {
		_triggerinventory = list _trigger;
		{
			_flag = _x getVariable "togarbage";
			if (!isnil "_flag") then {	
				deletevehicle _x;
			};
			_group = group _x;
			if (_group in wcgroups) then { 
				//hint format["group %1", wcgroups];
			} else {
				wcgroups = wcgroups + [_group]; 
				if (wcdebug) then {
					_leader = leader _group;
					[_leader, format["%1", _group], 1, 'ColorGreen', 'ICON', 'FDIAGONAL', 2, 'WARNING', 0 , format["%1", _group]] spawn WC_fnc_attachmarker;
				};
			};
		} foreach _triggerinventory;

		{
			_temp = count(units _x);
			if (_temp == 0) then { 
				wcgroups = wcgroups - [_x];
				deletegroup _x;
			};
		}foreach wcgroups;

		wcgroupcounteast = east countside wcgroups;
		wcgroupcountwest = west countside wcgroups;
		call compile format["wczoneready%1=true; wcsanity%1=true;",_markername];
	} else {
		nil = [_trigger, _markername, _markersize] spawn WC_fnc_cleantrigger;
	};