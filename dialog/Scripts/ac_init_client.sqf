//Precompiler les fonctions
call compile preprocessFileLineNumbers "dialog\scripts\ac_functions.sqf";

//permet afficher les r�gles du serveur
player addaction ["Menu Options","dialog\GUI\Mainmenu.sqf"];