// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// MISSION TYPE: DESTROY
// -----------------------------------------------
if (!isServer) exitWith{};

	wcmissionauthor ="=[A*C]=Lueti";
	wcmissionname = "Buzz of fly";
	wcmissiondescription = "The Russians still have shoots down one of our copters. That is enough! We just receive orders to destroy the antiaircraft site responsible for this slaughter";
	wcmissiontarget = "Anti_air_site";
	
	_position = [11478,11346,0];
	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;

	_target = "anti-air_ru1";
	_target = [_target, 0, _position] call EXT_fnc_createcomposition;

	_markername = "AAsite";
	_markersize = 300;

	_marker = [_markername, _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;

	_target2 = createVehicle ["Land_Antenna", _position, [], 0, "NONE"];
	[_target2, "Radio", 1, 'ColorGreen', 'ICON', 'FDIAGONAL', 2, 'WARNING', 0 , 'Radio'] spawn WC_fnc_attachmarker;

	player setpos _position;

	_target addeventhandler ['killed', {
		wcsuccess = true; 
		publicvariable 'wcsuccess'; 
		wcsuccess = false;
		nil = [nil,nil,rHINT,'Radio has been destroyed.'] call RE;
		wcmissionok = true;
		wcmissionclear = true;
	}];