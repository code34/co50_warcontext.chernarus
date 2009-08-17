// -----------------------------------------------
// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext - Description: init
// -----------------------------------------------

viewDist = 1500;
setViewDistance(viewDist);
setTerrainGrid 50;
enableEnvironment false;

switch (param1) do {
	case 1:
		{ 
		wcskill = 0.1; 
		wclevel = 0; 
		wcmaxenemyunit = 4; 
		wcmaxenemyvehicle = 2; 
		wcrandomenemyzone = 20; 
		wctriggersize = 800; 
		wcmaxenemyonmap = 80;
		};
	case 2:
		{ 
		wcskill = 0.1; 
		wclevel = 0; 
		wcmaxenemyunit = 8; 
		wcmaxenemyvehicle = 4; 
		wcrandomenemyzone = 20; 
		wctriggersize = 800; 
		wcmaxenemyonmap = 160;
		};
	case 3:
		{ 
		wcskill = 0.1; 
		wclevel = 0; 
		wcmaxenemyunit = 16; 
		wcmaxenemyvehicle = 8; 
		wcrandomenemyzone = 20; 
		wctriggersize = 800; 
		wcmaxenemyonmap = 320;
		};
	case 4:
		{ 
		wcskill = 0.1; 
		wclevel = 0; 
		wcmaxenemyunit = 32; 
		wcmaxenemyvehicle = 16; 
		wcrandomenemyzone = 20; 
		wctriggersize = 800; 
		wcmaxenemyonmap = 640;
		};
	default
		{ 
		wcskill = 0.05; 
		wclevel = 0; 
		wcmaxenemyunit = 1; 
		wcmaxenemyvehicle = 1; 
		wcrandomenemyzone = 20; 
		wctriggersize = 800; 
		wcmaxenemyonmap = 80;
		};
};

// external scripts
EXT_fnc_atot 			= compile preprocessFile "extern\EXT_fnc_atot.sqf";
EXT_fnc_createcomposition	= compile preprocessFile "extern\EXT_fnc_createcomposition.sqf";

// warcontext scripts
WC_fnc_attachmarker 		= compile preprocessFile "warcontext\WC_fnc_attachmarker.sqf";
WC_fnc_createammobox 		= compile preprocessFile "warcontext\WC_fnc_createammobox.sqf";
WC_fnc_clientside		= compile preprocessFile "warcontext\WC_fnc_clientside.sqf";
WC_fnc_createtimer		= compile preprocessFile "warcontext\WC_fnc_createtimer.sqf";
WC_fnc_creategroup 		= compile preprocessFile "warcontext\WC_fnc_creategroup.sqf";
WC_fnc_createinsertion 		= compile preprocessFile "warcontext\WC_fnc_createinsertion.sqf";
WC_fnc_creategridofposition	= compile preprocessFile "warcontext\WC_fnc_creategridofposition.sqf";
WC_fnc_createmarker 		= compile preprocessFile "warcontext\WC_fnc_createmarker.sqf";
WC_fnc_createmission		= compile preprocessFile "warcontext\WC_fnc_createmission.sqf";
WC_fnc_createparadrop		= compile preprocessFile "warcontext\WC_fnc_createparadrop.sqf";
WC_fnc_createposition 		= compile preprocessFile "warcontext\WC_fnc_createposition.sqf";
WC_fnc_createpositioninmarker 	= compile preprocessFile "warcontext\WC_fnc_createpositioninmarker.sqf";
WC_fnc_debug			= compile preprocessFile "warcontext\WC_fnc_debug.sqf";
WC_fnc_deletemarker		= compile preprocessFile "warcontext\WC_fnc_deletemarker.sqf";
WC_fnc_decreaseviewdistance	= compile preprocessFile "warcontext\WC_fnc_decreaseviewdistance.sqf";
WC_fnc_getobject 		= compile preprocessFile "warcontext\WC_fnc_getobject.sqf";
WC_fnc_getterraformvariance	= compile preprocessFile "warcontext\WC_fnc_getterraformvariance.sqf";
WC_fnc_increaseviewdistance	= compile preprocessFile "warcontext\WC_fnc_increaseviewdistance.sqf";
WC_fnc_initconfig 		= compile preprocessFile "warcontext\WC_fnc_initconfig.sqf";
WC_fnc_isinforest		= compile preprocessFile "warcontext\WC_fnc_isinforest.sqf";
WC_fnc_isonmoutain		= compile preprocessFile "warcontext\WC_fnc_isonmoutain.sqf";
WC_fnc_loadmission		= compile preprocessFile "warcontext\WC_fnc_loadmission.sqf";
WC_fnc_publishmission		= compile preprocessFile "warcontext\WC_fnc_publishmission.sqf";
WC_fnc_randomizegroup 		= compile preprocessFile "warcontext\WC_fnc_randomizegroup.sqf";
WC_fnc_garbagecollector		= compile preprocessFile "warcontext\WC_fnc_garbagecollector.sqf";
WC_fnc_respawnvehicle		= compile preprocessFile "warcontext\WC_fnc_respawnvehicle.sqf";
WC_fnc_setskill 		= compile preprocessFile "warcontext\WC_fnc_setskill.sqf";

// Init global variables
nil = [] call WC_fnc_initconfig;

// Init Mission loader on server
nil = [] spawn WC_fnc_loadmission;

// Init Debugger
nil = [] spawn WC_fnc_debug;