// by Xeno
private ["_anim","_mag_types","_magazines","_mags_backpack","_muzzles","_p","_primary","_s","_pistol","_base"];

_p = player;
if (pbp_id != -9999) then {
	_p removeAction pbp_id;
	pbp_id = -9999;
};

if (count player_backpack == 0) then {
	_primary = primaryWeapon _p;
	if (_primary != "") then {
		_mag_types = getArray(configFile>> "cfgWeapons" >> _primary >> "magazines");
		_magazines = magazines _p;
		_mags_backpack = [];
		{
			if (_x in _mag_types) then {
				[_mags_backpack, _x] call BIS_fnc_arrayPush;
			};
		} forEach _magazines;
		_muzzles = getArray(configFile>> "cfgWeapons" >> _primary >> "muzzles");
		if (count _muzzles == 2) then {
			_mag_types = getArray(configFile>> "cfgWeapons" >> _primary >> (_muzzles select 1) >> "magazines");
			{
				if (_x in _mag_types) then {
					[_mags_backpack, _x] call BIS_fnc_arrayPush;
				};
			} forEach _magazines;
		};
		d_backpack_helper = [_mags_backpack, _primary];
		_weapons = weapons _p;
		d_backpack_helper = [_magazines, _weapons];
		_pistol = "";
		{
			scopeName "pistolsearch";
			_base = inheritsFrom (configFile >> "cfgWeapons" >> _x);
			for "_xs" from 1 to 3 do {
				if (configName _base == "Pistol") then {
					_pistol = _x;
					breakOut "pistolsearch";
				};
				_base = inheritsFrom (configFile >> "cfgWeapons" >> (configName _base));
			};
		} forEach _weapons;
		if (_pistol != "") then {
			_p removeWeapon _pistol;
		};
		{
			_p removeMagazine _x;
		} forEach _mags_backpack;
		_p removeWeapon _primary;
		_anim = animationState _p;
		player_backpack = [_primary, _mags_backpack];
		waitUntil {animationState player != _anim};
		_p = player;
		if (_pistol != "") then {
			_p addWeapon _pistol;
			_p selectWeapon _pistol;
		};
		if (pbp_id == -9999) then {
			pbp_id = _p addAction ["Backpack Weapon", "x_scripts\x_backpack.sqf",[],-1,false];
		};
		if (alive player) then {
			d_backpack_helper = [];
		};
	};
} else { // switch weapon
	_primary = primaryWeapon _p;
	if (_primary == "") then {
		{
			_p addMagazine _x;
		} forEach (player_backpack select 1);
		_p addWeapon (player_backpack select 0);
		_muzzles = getArray(configFile>>"cfgWeapons" >> (player_backpack select 0) >> "muzzles");
		_p selectWeapon (player_backpack select 0);
		_p selectWeapon (_muzzles select 0);
		player_backpack = [];
		if (pbp_id != -9999) then {
			_p removeAction pbp_id;
			pbp_id = -9999;
		};
		if (pbp_id == -9999) then {
			pbp_id = _p addAction ["Backpack Weapon", "x_scripts\x_backpack.sqf",[],-1,false];
		};
	} else {
		_mag_types = getArray(configFile>> "cfgWeapons" >> _primary >> "magazines");
		_magazines = magazines _p;
		_mags_backpack = [];
		{
			if (_x in _mag_types) then {
				[_mags_backpack, _x] call BIS_fnc_arrayPush;
			};
		} forEach _magazines;
		_muzzles = getArray(configFile>> "cfgWeapons" >> _primary >> "muzzles");
		if (count _muzzles == 2) then {
			_mag_types = getArray(configFile>> "cfgWeapons" >> _primary >> (_muzzles select 1) >> "magazines");
			{
				if (_x in _mag_types) then {
					[_mags_backpack, _x] call BIS_fnc_arrayPush;
				};
			} forEach _magazines;
		};
		{
			_p removeMagazine _x;
		} forEach _mags_backpack;
		_weapons = weapons _p;
		d_backpack_helper = [_mags_backpack, _primary];
		_pistol = "";
		{
			scopeName "pistolsearch2";
			_base = inheritsFrom (configFile >> "cfgWeapons" >> _x);
			for "_xs" from 1 to 3 do {
				if (configName _base == "Pistol") then {
					_pistol = _x;
					breakOut "pistolsearch2";
				};
				_base = inheritsFrom (configFile >> "cfgWeapons" >> (configName _base));
			};
		} forEach _weapons;
		if (_pistol != "") then {
			_p removeWeapon _pistol;
		};
		_p removeWeapon _primary;
		sleep 1;
		_anim = animationState _p;
		waitUntil {animationState player != _anim};
		_p = player;
		{
			_p addMagazine _x;
		} forEach (player_backpack select 1);
		if (_pistol != "") then {
			_p addWeapon _pistol;
		};
		_p addWeapon (player_backpack select 0);
		_muzzles = getArray(configFile>> "cfgWeapons" >> (player_backpack select 0) >> "muzzles");
		_p selectWeapon (player_backpack select 0);
		_p selectWeapon (_muzzles select 0);
		player_backpack = [_primary, _mags_backpack];
		_s = format ["Backpack Weapon", player_backpack select 0];
		if (pbp_id == -9999) then {
			pbp_id = _p addAction [_s, "x_scripts\x_backpack.sqf",[],-1,false];
		};
		if (alive player) then {
			d_backpack_helper = [];
		};
	};
};

if (true) exitWith {};
