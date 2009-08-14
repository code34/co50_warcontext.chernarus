// -----------------------------------------------
// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// -----------------------------------------------
	if (!local player) exitWith {};

	waituntil {(!isnil ("wclevel"))};
	waituntil {(!isnil ("wcmission"))};
	waituntil {(!isnil ("wcmissionposition"))};
	
	// remet a jour le briefing
	// affiche un message indiquant le nombre de missions faites	
	hint format["New Mission defined. Mission : %1 / %2", wclevel, wclevelmax];
	call compile format["task%1 = player createSimpleTask ['objectif %1'];", wclevel];
	call compile format["task%1 setSimpleTaskDescription %2 ;", wclevel, wcmission];
	call compile format["task%1 setSimpleTaskDestination %2;", wclevel, wcmissionposition];