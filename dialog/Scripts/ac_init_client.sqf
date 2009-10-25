//Precompiler les fonctions
call compile preprocessFileLineNumbers "dialog\scripts\ac_functions.sqf";

//permet afficher les règles du serveur
player addaction ["Menu Options","dialog\GUI\Mainmenu.sqf"];