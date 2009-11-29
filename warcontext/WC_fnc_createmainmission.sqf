	// -----------------------------------------------
	// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// -----------------------------------------------
	if (!local player) exitWith {};

	private ["_location", "_marker", "_markername", "_task", "_index"];

	if (side player == wcside) then {
		waituntil {!isnil "wcmainmissionW"};
		_location = wcmainmissionW;
	} else {
		waituntil {!isnil "wcmainmissionE"};
		_location = wcmainmissionE;
	};

	if(_location in wcmypersonnalmainmissionlist) exitWith {};
	wcmypersonnalmainmissionlist = wcmypersonnalmainmissionlist + [_location];

	wcmainmissionindex = wcmainmissionindex + 1;

	wcmainposition = position _location;
	_markername = 'cleartown';
	deletemarkerlocal _markername;

	call compile format["main%1 = player createSimpleTask ['Main target: %1'];", wcmainmissionindex];
	call compile format ["_task = ['Clear the town of %1', 'Main target: %1', 'Main target']", text _location];
	call compile format["main%1 setSimpleTaskDescription %2;", wcmainmissionindex, _task];
	call compile format["main%1 setSimpleTaskDestination %2;", wcmainmissionindex, position _location];
	[objNull, objNull, call compile format["main%1", wcmainmissionindex], "CREATED"] execVM "CA\Modules\MP\data\scriptCommands\taskHint.sqf";

	_marker = ['cleartown', 3, wcmainposition, 'ColorRed', 'ICON', 'FDIAGONAL', 'Select', 0, 'MAIN TARGET', true] call WC_fnc_createmarkerlocal;
	nil = ['cleartown'] spawn WC_fnc_markerhintlocal;

	_index = wcmainmissionindex;

	//Wait for the lunch of new main mission
	waituntil {wcmainmissionindex != _index};

	// use backup of index to validate mission
	if (side player == wcside) then {
		call compile format["main%1 settaskstate 'Succeeded';", _index];
	} else {
		call compile format["main%1 settaskstate 'Failed';", _index];
	};

	true;