	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext - Description:
	// Attach a marker to an object
	// -----------------------------------------------

	private ["_player", "_object", "_position"];

	_player = _this select 1;

	if (wchospitalteleport) then {
		if (format["%1", getmarkerpos "HOSPITAL"] == "[0,0,0]") then {
			hint 'Hospital is not deployed';
		}else{
			_object = nearestObject [(getmarkerpos "HOSPITAL"), "CDF_WarfareBFieldhHospital"];
			_position = getposasl _object;
			_player setposasl _position;
		};
	} else {
		hint 'Teleport is not actived in this Game mode.';
	};