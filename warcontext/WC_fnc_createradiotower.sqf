	// -----------------------------------------------
	// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// Deployed an radio
	// -----------------------------------------------
	 private ["_radio", "_position"];

	_position = _this select 0;

	_radiotower = createVehicle ["Land_telek1", _position, [], 100, "NONE"];
	_radiotower setVectorUp [0,0,1];

	_radiotower addEventHandler ["killed", "
		nil = [nil,nil,rHINT,'Radiotower has been destroyed'] call RE;
	"];

	_radiotower;