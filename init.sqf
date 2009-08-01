// -----------------------------------------------
// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// -----------------------------------------------

//while{(true)} do{
//	sleep 0.4;
//	hint format["%1", time];
//	coord = getpos player;
//	x = ceil(coord select 0);
//	y = ceil(coord select 1);
//	hint format["Coord: x:%1, y:%2", x, y];
//};

viewDist = 1500;
setViewDistance(viewDist);
setTerrainGrid 50;


// you can set skill level of IA by setting the wcskill variable as this
// 0 = min , 1 max (stronger)
switch (param1) do {
	case 1:
		{ wcskill = 0.1; wclevel = 0; wcmaxenemyunit = 4; wcmaxenemyvehicle = 2; wcrandomenemyzone = 20; wctriggersize = 800; wcmaxenemyonmap = 80};
	case 2:
		{ wcskill = 0.1; wclevel = 0; wcmaxenemyunit = 8; wcmaxenemyvehicle = 4; wcrandomenemyzone = 20; wctriggersize = 800; wcmaxenemyonmap = 160};
	case 3:
		{ wcskill = 0.1; wclevel = 0; wcmaxenemyunit = 16; wcmaxenemyvehicle = 8; wcrandomenemyzone = 20; wctriggersize = 800; wcmaxenemyonmap = 320};
	case 4:
		{ wcskill = 0.1; wclevel = 0; wcmaxenemyunit = 32; wcmaxenemyvehicle = 16; wcrandomenemyzone = 20; wctriggersize = 800; wcmaxenemyonmap = 640};
	default
		{ wcskill = 0.05; wclevel = 1; wcmaxenemyunit = 1; wcmaxenemyvehicle = 1; wcrandomenemyzone = 20; wctriggersize = 800; wcmaxenemyonmap = 80};
};

func_atot 		= compile preprocessFile "warcontext\atot.sqf";
func_createammo 	= compile preprocessFile "warcontext\createammo.sqf";
func_createclientside 	= compile preprocessFile "warcontext\createclientside.sqf";
func_createcomposition 	= compile preprocessFile "warcontext\createcomposition.sqf";
func_createconvoi 	= compile preprocessFile "warcontext\createconvoi.sqf";
func_creategroup 	= compile preprocessFile "warcontext\creategroup.sqf";
func_createinsertion 	= compile preprocessFile "warcontext\createinsertion.sqf";
func_createintro 	= compile preprocessFile "warcontext\createintro.sqf";
func_createmarker 	= compile preprocessFile "warcontext\createmarker.sqf";
func_createmission	= compile preprocessFile "warcontext\createmission.sqf";
func_createposition 	= compile preprocessFile "warcontext\createposition.sqf";
func_createpositioninmarker = compile preprocessFile "warcontext\createpositioninmarker.sqf";
func_createpositiononroad = compile preprocessFile "warcontext\createpositiononroad.sqf";
func_deletemarker 	= compile preprocessFile "warcontext\deletemarker.sqf";
func_getobject 		= compile preprocessFile "warcontext\getobject.sqf";
func_missionloader 	= compile preprocessFile "warcontext\missionloader.sqf";
func_para 		= compile preprocessFile "warcontext\para.sqf";
func_randomizegroup 	= compile preprocessFile "warcontext\randomizegroup.sqf";
func_remove 		= compile preprocessFile "warcontext\remove.sqf";
func_setskill 		= compile preprocessFile "warcontext\setskill.sqf";

nil = [] spawn func_missionloader;