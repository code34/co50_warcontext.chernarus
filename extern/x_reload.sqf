// by Xeno
private ["_config","_count","_i","_magazines","_object","_type","_type_name"];

_object 	= _this select 0;
_type 		= typeof _object;

if (_object isKindOf "ParachuteBase") exitWith {};

if (isNil "x_reload_time_factor") then {x_reload_time_factor = 1;};

if (!alive _object) exitWith {};
_object setVehicleAmmo 1;	// Reload turrets / drivers magazine
_object setfuel 0;

_type_name = typeOf _object;

_object vehicleChat format ["Servicing %1... Please stand by...", _type];

_magazines = getArray(configFile >> "CfgVehicles" >> _type >> "magazines");

if (count _magazines > 0) then {
	_removed = [];
	{
		if (!(_x in _removed)) then {
			_object removeMagazines _x;
			_removed = _removed + [_x];
		};
	} forEach _magazines;
	{
		_object vehicleChat format ["Reloading %1", _x];
		sleep x_reload_time_factor;
		if (!alive _object) exitWith {};
		_object addMagazine _x;
	} forEach _magazines;
};

_count = count (configFile >> "CfgVehicles" >> _type >> "Turrets");

if (_count > 0) then {
	for "_i" from 0 to (_count - 1) do {
		scopeName "xx_reload2_xx";
		_config = (configFile >> "CfgVehicles" >> _type >> "Turrets") select _i;
		_magazines = getArray(_config >> "magazines");
		_removed = [];
		{
			if (!(_x in _removed)) then {
				_object removeMagazines _x;
				_removed = _removed + [_x];
			};
		} forEach _magazines;
		{
			_object vehicleChat format ["Reloading %1", _x];
			sleep x_reload_time_factor;
			if (!alive _object) then {breakOut "xx_reload2_xx"};
			_object addMagazine _x;
			sleep x_reload_time_factor;
			if (!alive _object) then {breakOut "xx_reload2_xx"};
		} forEach _magazines;
		// check if the main turret has other turrets
		_count_other = count (_config >> "Turrets");
		// this code doesn't work, it's not possible to load turrets that are part of another turret :(
		// nevertheless, I leave it here
		if (_count_other > 0) then {
			for "_i" from 0 to (_count_other - 1) do {
				_config2 = (_config >> "Turrets") select _i;
				_magazines = getArray(_config2 >> "magazines");
				_removed = [];
				{
					if (!(_x in _removed)) then {
						_object removeMagazines _x;
						_removed = _removed + [_x];
					};
				} forEach _magazines;
				{
					_object vehicleChat format ["Reloading %1", _x]; 
					sleep x_reload_time_factor;
					if (!alive _object) then {breakOut "xx_reload2_xx"};
					_object addMagazine _x;
					sleep x_reload_time_factor;
					if (!alive _object) then {breakOut "xx_reload2_xx"};
				} forEach _magazines;
			};
		};
	};
};
_object setVehicleAmmo 1;	// Reload turrets / drivers magazine
sleep x_reload_time_factor;

_object vehicleChat "Loading Construction Kit...";
_object setVariable ["wcconstructionkit", true, true];
sleep 10;

_object vehicleChat "Loading Ammo crate ...";
_object setVariable ["wcammocrate", true, true];
sleep 10;

_object vehicleChat "Loading Smoke crate ...";
_object setVariable ["wcsmoke", true, true];
sleep 5;

if (!alive _object) exitWith {};
_object vehicleChat "Repairing...";
_object setDamage 0;
sleep x_reload_time_factor;
if (!alive _object) exitWith {};
_object vehicleChat "Refueling...";
while {fuel _object < 0.99} do {
	_object setFuel 1;
	sleep 0.01;
};
sleep x_reload_time_factor;
if (!alive _object) exitWith {};
_object vehicleChat format ["%1 is ready...", _type_name];

if (true) exitWith {};
