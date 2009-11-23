	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext - Description:
	// Attach a marker to an object
	// -----------------------------------------------

	private ["_player", "_object", "_position", "_markername", "_hospital"];
	
	_player = _this select 1;

	if (side _player == wcside) then {
		_hospital = wchospitalW;
	} else {
		_hospital = wchospitalE;
	};

	if (wchospitalteleport) then {
		if (!alive _hospital) then {
			hint 'Hospital is not deployed';
		}else{
			_position = getposasl _hospital;
			_player setposasl _position;
		};
	} else {
		hint 'Teleport is not actived in this Game mode.';
	};