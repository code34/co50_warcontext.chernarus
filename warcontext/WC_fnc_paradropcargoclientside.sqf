	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext  - paragroup
	// -----------------------------------------------
	if (!local player) exitWith {};

	if (!surfaceIsWater (position _vehicle)) then {
		if ((getposatl _vehicle) select 2 > 70) then {
			wcparadropcargo = vehicle player;
			publicvariable 'wcparadropcargo';
		} else {
			hint 'altitude is too low';
		};
	} else {
		hint "Cannot paradrop over sea !";
	};

	// To debug Handler
	if(local player && isserver) then {
		nil = [] spawn WC_fnc_paradropcargoserverside;
	};

	true;