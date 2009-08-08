private ["_vec","_gr"];
if (!isServer) exitWith {};

sleep 4.321;

{
	if (side _x in x_addkilledhandler) then {
		if (_x isKindOf "Man") then { // not needed, I guess ;)
			_gr = group _x;
			if ((format["%1",_gr getVariable "gr_a"]) == "<null>") then {
				_gr setVariable ["gr_a", 1];
				switch (side _x) do {
					case east: {groups_east = groups_east + [[_gr,time + 120]];};
					case west: {groups_west = groups_west + [[_gr,time + 120]];};
					case resistance: {groups_resistance = groups_resistance + [[_gr,time + 120]];};
					case civilian: {groups_civilian = groups_civilian + [[_gr,time + 120]];};
				};
			};
			if (!(isPlayer _x)) then {
				if ((format["%1",_x getVariable "ke"]) == "<null>") then {
					_x addEventHandler ["killed", {[_this select 0] call XAddDead}];
					_x setVariable ["ke", 1];
				};
			};
			if (vehicle _x != _x) then {
				_vec = vehicle _x;
				if ((format["%1",_vec getVariable "ke"]) == "<null>") then {
					_vec addEventHandler ["killed", {[_this select 0] spawn x_removevehi}];
					_vec setVariable ["ke", 1];
				};
			};
		};
	};
	sleep 0.423;
} forEach allUnits;

if (true) exitWith {};