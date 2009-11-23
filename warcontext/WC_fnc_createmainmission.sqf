	// -----------------------------------------------
	// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// -----------------------------------------------
	if (!local player) exitWith {};

	private ["_location", "_position", "_marker", "_markername"];

	if (side player == wcside) then {
		waituntil {!isnil "wcmainmissionW"};
		_location = wcmainmissionW;
	} else {
		waituntil {!isnil "wcmainmissionE"};
		_location = wcmainmissionE;
	};

	_position = position _location;
	_markername = 'cleartown';
	deletemarkerlocal _markername;
	_marker = ['cleartown', 3, _position, 'ColorRed', 'ICON', 'FDIAGONAL', 'Select', 0, 'MAIN TARGET', true] call WC_fnc_createmarkerlocal;
	nil = ['cleartown'] spawn WC_fnc_markerhintlocal;

	true;