	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: 
	// -----------------------------------------------
	if (!isServer) exitWith{};

	wcmissionauthor = "=[A*C]= Koss";
	wcmissionname = "Sabotage a futur ammo stock";
	wcmissiondescription = "In few days, Russian Army will receive an important stock of Ammo. As there no other way to do, you must destroy the building that will receipt it.";
	wcmissiontarget = "Destroy building";

	wcmissionposition = [2932.69,5433.77,0];
	nil = [] spawn WC_fnc_publishmission;

	_composition = [["Select map object",101,[],[2932.69,5433.77,0]],["Create",102,[["RU_Soldier_TL","RU_Soldier_MG","RU_Soldier_MG","RU_Soldier"],"Regular","Search Area",-910,30,0],[2897.2,5460,0]],["Create",103,[["RU_Soldier_TL","RU_Soldier_MG","RU_Soldier_MG","RU_Soldier"],"Regular","Search Area",-910,30,0],[2963.7,5485.4,0]],["Create",104,[["RU_Soldier","RU_Soldier","RU_Soldier"],"Regular","Search Area",-910,30,0],[2996.3,5415.7,0]],["Create",105,[["GAZ_Vodnik","RU_Soldier_SL","RU_Soldier_MG","RU_Soldier_GL"],"Regular","Search Area",-910,30,0],[2913.5,5510.9,0]]];
	nil = [_composition, true] spawn WC_fnc_restorebuildingfrommerlin;