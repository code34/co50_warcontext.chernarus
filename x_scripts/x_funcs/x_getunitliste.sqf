// by Xeno
private ["_crewmember","_grptype","_how_many","_list","_one_man","_random","_retliste","_side","_side_char","_unitliste","_vehiclename"];
_grptype = _this select 0;
_side = _this select 1;

_unitliste = [];
_vehiclename = ""; 
_side_char = (switch (_side) do {case "EAST": {"E"};case "WEST": {"W"};case "RACS": {"G"};});
_crewmember = call compile format["d_crewman_%1",_side_char];
switch (_grptype) do {
	case "basic": {_unitliste = [call compile format["d_sleader_%1",_side_char]];_how_many = ceil random 8; if (_how_many < 3) then {_how_many = 3;};_list = call compile format ["d_allmen_%1",_side_char];for "_i" from 1 to _how_many do {_unitliste = _unitliste + [(_list select (floor random count _list))];};};
	case "specops": {_how_many = ceil random 5; if (_how_many < 3) then {_how_many = 3;};_list = call compile format ["d_specops_%1",_side_char];for "_i" from 1 to _how_many do {_unitliste = _unitliste + [(_list select (floor random count _list))];};};
	case "heli": {_unitliste = [call compile format["d_sleader_%1",_side_char]];_how_many = ceil random 8; if (_how_many < 3) then {_how_many = 3;};_list = call compile format ["d_allmen_%1",_side_char];for "_i" from 1 to _how_many do {_unitliste = _unitliste + [(_list select (floor random count _list))];};};
	case "tank": {call compile format ["_vehiclename = d_veh_a_%1 select 0;",_side_char];};
	case "bmp": {call compile format ["_vehiclename = d_veh_a_%1 select 1;",_side_char];};
	case "brdm": {call compile format ["_vehiclename = d_veh_a_%1 select 2;",_side_char];};
	case "shilka": {call compile format ["_vehiclename = d_veh_a_%1 select 3;",_side_char];};
	case "uaz_mg": {call compile format ["_crewmember=d_crewman2_%1;_vehiclename = d_veh_a_%1 select 4;",_side_char];};
	case "uaz_grenade": {call compile format ["_crewmember=d_crewman2_%1;_vehiclename = d_veh_a_%1 select 5;",_side_char];};
	case "DSHKM": {call compile format ["_crewmember=d_crewman2_%1;_vehiclename = d_veh_a_%1 select 6;",_side_char];};
	case "AGS": {call compile format ["_crewmember=d_crewman2_%1;_vehiclename = d_veh_a_%1 select 7;",_side_char];};
	case "D30": {call compile format ["_crewmember=d_crewman2_%1;_vehiclename = d_veh_a_%1 select 8;",_side_char];};
	case "uralfuel": {call compile format ["_crewmember=d_crewman2_%1;_vehiclename = d_veh_a_%1 select 9;",_side_char];};
	case "uralrep": {call compile format ["_crewmember=d_crewman2_%1;_vehiclename = d_veh_a_%1 select 10;",_side_char];};
	case "uralammo": {call compile format ["_crewmember=d_crewman2_%1;_vehiclename = d_veh_a_%1 select 11;",_side_char];};
	case "civilian": {for "_i" from 1 to 12 do {_random = floor random 19;_one_man = format ["Civilian%1", _random + 2];_unitliste = _unitliste + [_one_man];sleep 0.0101;};};
};
_retliste = [_unitliste, _vehiclename, _crewmember];
_retliste
