	// -----------------------------------------------
	// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext - check radio
	// -----------------------------------------------
	if (!isServer) exitWith{};

	private ["_radar", "_side", "_array", "_vehicle", "_pilot", "_position"];

	_radar = _this select 0;
	_side  = _this select 1;

	WC_fnc_check_radarenemy = {
		private ["_size", "_radar", "_array", "_side", "_vehicle"];
		_radar = _this select 0;
		_side  = _this select 1;
		_vehicle = _this select 2;

		_size = ((getposasl _radar) select 2) * 5;
		while {alive _radar} do {
			_array = nearestObjects [_radar, ["Air"], _size];
			{
				if (side _x != _side && (getposatl _x) select 2 > 20) then {
					_vehicle dotarget _x;
					_vehicle dofire _x;
				};
			}foreach _array;
			sleep 2;
		};
	};


	if(_side == wcside) then {
		_marker = ["WRADARMRK", ((getposasl _radar) select 2) * 5, position _radar, 'ColorBLUE', 'ICON', 'FDIAGONAL', 'EMPTY', 0, '', true] call WC_fnc_createmarker;
		_position = [_marker, "onmountain"] call WC_fnc_createpositioninmarker;
		_array = [_position, 0, "Stinger_Pod", wcside] call BIS_fnc_spawnVehicle;
		_vehicle = _array select 0;
		_pilot = (_array select 1) select 0;
		nil = [_pilot, wcskill] spawn WC_fnc_setskill;
		nil = [_radar, _side, _vehicle] spawn WC_fnc_check_radarenemy;
	} else {

		_marker = ["ERADARMRK", ((getposasl _radar) select 2) * 5, position _radar, 'ColorBLUE', 'ICON', 'FDIAGONAL', 'EMPTY', 0, '', true] call WC_fnc_createmarker;
		_position = [_marker, "onmountain"] call WC_fnc_createpositioninmarker;
		_array = [_position, 0, "Igla_AA_pod_Eas", wcenemyside] call BIS_fnc_spawnVehicle;
		_vehicle = _array select 0;
		_pilot = (_array select 1) select 0;
		nil = [_pilot, wcskill] spawn WC_fnc_setskill;
		nil = [_radar, _side, _vehicle] spawn WC_fnc_check_radarenemy;
	};

	waituntil {!alive _radar;};

	if(_side == wcside) then {
		wcradarW = objnull;
		publicvariable "wcradarW";
		nil = [nil,nil,rHINT,'West radar has been destroyed'] call RE;
		deletevehicle _vehicle;
		deletevehicle _pilot;
		wcarraymarker = wcarraymarker - [_marker];
		deletemarker _marker;
	} else {
		wcradarE = objnull;
		publicvariable "wcradarE";
		nil = [nil,nil,rHINT,'East radar has been destroyed'] call RE;
		deletevehicle _vehicle;
		deletevehicle _pilot;
		wcarraymarker = wcarraymarker - [_marker];
		deletemarker _marker;
	};
	true;