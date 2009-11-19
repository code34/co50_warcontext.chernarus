	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext  - paragroup
	// -----------------------------------------------
	if (!local player) exitWith {};

	wcparadropcargo = vehicle player;
	publicvariable 'wcparadropcargo';

	// To debug Handler
	if(local player && isserver) then {
		nil = [] spawn WC_fnc_paradropcargoserverside;
	};

	true;