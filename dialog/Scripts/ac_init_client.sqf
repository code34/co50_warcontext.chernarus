vec_ass = -8876;

//Precompiler les fonctions
call compile preprocessFileLineNumbers "dialog\scripts\ac_functions.sqf";

//permet afficher les règles du serveur
if (vec_ass == -8876) then {
vec_ass = player addaction ["Menu Options","dialog\GUI\Mainmenu.sqf",[],-1,false];
};

// Trigger from Xeno
_trigger = createTrigger["EmptyDetector" , position player];
_trigger setTriggerArea [0, 0, 0, false];
_trigger setTriggerActivation ["NONE", "PRESENT", true];

_trigger setTriggerStatements[
		"vehicle player != player", 
		"ts_vehicle = vehicle player;if (vec_ass == -8876) then {vec_ass = ts_vehicle addAction ['Menu Options', 'dialog\GUI\Mainmenu.sqf',[],-1,false];};", 
		"if (vec_ass != -8876) then {ts_vehicle removeAction vec_ass;vec_ass = -8876;}
		"];
