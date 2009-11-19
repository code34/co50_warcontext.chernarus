	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext - Description:
	// Attach a marker to an object
	// -----------------------------------------------

	private ["_player", "_object", "_position"];

	if (side player == wcside) then {
		_markername = "WHOSPITAL";
	} else {
		_markername = "EHOSPITAL";
	};

	if (wchospitalteleport) then {
		if (format["%1", getmarkerpos _markername] == "[0,0,0]") then {
			hint 'Hospital is not deployed';
		}else{
			_object = nearestObject [(getmarkerpos _markername), "CDF_WarfareBFieldhHospital"];
			_position = getposasl _object;
			_player setposasl _position;
		};
	} else {
		hint 'Teleport is not actived in this Game mode.';
	};