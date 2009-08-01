// -----------------------------------------------
// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// -----------------------------------------------

if (local server) exitWith {};

	waituntil{!isnil("wclevel")};
	sleep 10;
	
	hint format["New Mission defined. Mission : %1 / %2", wclevel, wclevelmax];
	call compile format["task%1 = player createSimpleTask ['objectif %1'];", wclevel];
	call compile format["task%1 setSimpleTaskDescription %2 ;", wclevel, wcmission];
	call compile format["task%1 setSimpleTaskDestination %2;", wclevel, wcmissionposition];