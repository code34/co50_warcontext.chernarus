// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// -----------------------------------------------
	if (!isServer) exitWith{};

	wcmissionclear = false;
	wcskill = wcskill + 0.05;
	wclevel = wclevel + 1;
	publicvariable "wclevel";

	{
		call compile format [" deleteMarker '%1'; ", _x select 0];
	}foreach wcarraymarker;

	wcarraymarker = [];
	publicvariable "wcarraymarker";

	hint format["wclevel: %1", wclevel]; 
	
	true;

