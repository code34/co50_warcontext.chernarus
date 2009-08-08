// by Xeno
private ["_activate","_i","_number_basic","_number_bmp","_number_brdm","_number_shilka","_number_specops","_number_tank","_number_uaz_grenade","_number_uaz_mg","_radius","_random_val","_side","_sides","_startposi","_this","_trg_center","_trig_array","_trigger","_type_list_attack","_typeidx","_wp_array","_x","_xx"];
if (!isServer) exitWith{};

_startposi = _this select 0;
_radius = _this select 1;
_number_basic = _this select 2;
_number_specops = _this select 3;
_number_tank = _this select 4;
_number_bmp = _this select 5;
_number_brdm = _this select 6;
_number_uaz_mg = _this select 7;
_number_uaz_grenade = _this select 8;
_number_shilka = _this select 9;
_side = _this select 10;

_trg_center = _startposi;
if (typeName _side == "ARRAY") then {
	// _side array ist dann: seite die gespawned werden soll, array mit den feindseiten, entfernung von feind einheiten, ab der gespawnt wird
	// ["EAST", ["WEST","RACS"], 800]
	_sides = _side select 1;
	_random_val = floor random 1000000;
	while {_random_val in x_ran_val_array} do {
		_random_val = floor random 1000000;
	};
	x_ran_val_array = x_ran_val_array + [_random_val];
	call compile format ["x_finder_%1 = false;", _random_val];
	_trig_array = [];
	for "_i" from 0 to (count _sides - 1) do {
		_trigger = createTrigger["EmptyDetector" ,_trg_center];
		_trigger setTriggerArea [_side select 2, _side select 2, 0, false];
		_activate = (
			switch (_sides select _i) do {
				case "WEST": {"WEST"};
				case "EAST": {"EAST"};
				case "RACS": {"GUER"};
			}
		);
		_trigger setTriggerActivation [_activate, "PRESENT", false];
		call compile format ["_trigger setTriggerStatements[""this"", ""x_finder_%1 = true"", """"];", _random_val];
		_trig_array = _trig_array + [_trigger];
	};
	
	call compile format ["waitUntil {x_finder_%1};", _random_val];

	{
		deleteVehicle _x;
	} forEach _trig_array;
	x_ran_val_array = x_ran_val_array - [_random_val];
	call compile format ["x_finder_%1 = nil;", _random_val];
	
	_side = _side select 0;
};

_type_list_attack = [["basic",0],["specops",0],["tank",1],["bmp",1],["brdm",1],["uaz_mg",1],["uaz_grenade",1],["shilka",1]];

_wp_array = (if (typeName _radius == "ARRAY") then {[_startposi, _radius select 0, _radius select 1, _radius select 2] call x_getwparray3} else {[_startposi, _radius] call x_getwparray});

sleep 0.112;

for "_xx" from 0 to (count _type_list_attack - 1) do {
	_typeidx = _type_list_attack select _xx;
	call compile format["if (_number_%1 > 0) then {for ""_i"" from 1 to _number_%1 do {[_typeidx select 0, _wp_array, _startposi, _typeidx select 1, ""patrol"",_side,objNull,-1.111] execVM ""x_scripts\x_makegroup.sqf"";sleep 1.323;};};",_typeidx select 0];
};

xlink_running = true;

if (true) exitWith {};