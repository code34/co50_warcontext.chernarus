// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// MISSION TYPE: 
// -----------------------------------------------
if (!isServer) exitWith{};

	wcmissionauthor = "=[A*C]= Code34";
	wcmissionname = "Dominate them";
	wcmissiondescription = "You have to clean the zone and to destroy the radio tower";
	wcmissiontarget = "Destroy radio tower";


	wcmissionposition = [7000,7000,0];
	nil = [] spawn WC_fnc_publishmission;