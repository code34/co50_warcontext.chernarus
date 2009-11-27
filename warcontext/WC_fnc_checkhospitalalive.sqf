	// -----------------------------------------------
	// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext - check radio
	// -----------------------------------------------
	if (!isServer) exitWith{};
	private ["_hospital", "_side", "_marker"];

	_hospital = _this select 0;
	_side  = _this select 1;

	if(_side == wcside) then {
		_marker = ["WHOSPITALMRK", 1, position _hospital, 'ColorBLUE', 'ICON', 'FDIAGONAL', 'EMPTY', 0, '', true] call WC_fnc_createmarker;
	} else {
		_marker = ["EHOSPITALMRK", 1, position _hospital, 'ColorBLUE', 'ICON', 'FDIAGONAL', 'EMPTY', 0, '', true] call WC_fnc_createmarker;
	};

	waituntil {!alive _hospital;};

	if(_side == wcside) then {
		wcarraymarker = wcarraymarker - [_marker];
		deletemarker _marker;
		wchospitalW = objnull;
		publicvariable "wchospitalW";
		wcmessageW = "West hospital has been destroyed";
		publicvariable "wcmessageW";
	} else {
		wcarraymarker = wcarraymarker - [_marker];
		deletemarker _marker;
		wchospitalE = objnull;
		publicvariable "wchospitalE";
		wcmessageE = "East hospital has been destroyed";
		publicvariable "wcmessageE";
	};
	true;