// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// -----------------------------------------------

	{
		call compile format [" deleteMarker '%1'; ", _x];
	}foreach wcarraymarker;

	wcarraymarker = [];
	publicvariable 'wcarraymarker';

