	// -----------------------------------------------
	// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext - Description: init
	// -----------------------------------------------

	finishMissionInit;

	if (!isServer) exitWith{};
	
	// Create LHD
	nil = [] execVM "extern\EXT_fnc_createCarrier.sqf";
	
	// external scripts
	EXT_fnc_atot 			= compile preprocessFile "extern\EXT_fnc_atot.sqf";
	EXT_fnc_createcomposition	= compile preprocessFile "extern\EXT_fnc_createcomposition.sqf";
	EXT_BIS_fnc_supplydrop		= compile preprocessFile "extern\EXT_BIS_fnc_supplydrop.sqf";
	EXT_fnc_HousePatrol		= compile preprocessFile "extern\HousePatrol.sqf";
	EXT_fnc_vftcas			= compile preprocessFile "extern\EXT_fnc_vftcas.sqf";
	
	// warcontext scripts
	WC_fnc_attachmarker 		= compile preprocessFile "warcontext\WC_fnc_attachmarker.sqf";
	WC_fnc_attachtrigger 		= compile preprocessFile "warcontext\WC_fnc_attachtrigger.sqf";
	WC_fnc_backupbuilding		= compile preprocessFile "warcontext\WC_fnc_backupbuilding.sqf";
	WC_fnc_createammobox 		= compile preprocessFile "warcontext\WC_fnc_createammobox.sqf";
	WC_fnc_createconvoy 		= compile preprocessFile "warcontext\WC_fnc_createconvoy.sqf";
	WC_fnc_createtracer	 	= compile preprocessFile "warcontext\WC_fnc_createtracer.sqf";
	WC_fnc_cleantrigger	 	= compile preprocessFile "warcontext\WC_fnc_cleantrigger.sqf";
	WC_fnc_createtimer		= compile preprocessFile "warcontext\WC_fnc_createtimer.sqf";
	WC_fnc_creategroup 		= compile preprocessFile "warcontext\WC_fnc_creategroup.sqf";
	WC_fnc_createinsertion 		= compile preprocessFile "warcontext\WC_fnc_createinsertion.sqf";
	WC_fnc_creategridofposition	= compile preprocessFile "warcontext\WC_fnc_creategridofposition.sqf";
	WC_fnc_createhousepatrol	= compile preprocessFile "warcontext\WC_fnc_createhousepatrol.sqf";
	WC_fnc_createmarker 		= compile preprocessFile "warcontext\WC_fnc_createmarker.sqf";
	WC_fnc_createairpatrol 		= compile preprocessFile "warcontext\WC_fnc_createairpatrol.sqf";
	WC_fnc_createposition 		= compile preprocessFile "warcontext\WC_fnc_createposition.sqf";
	WC_fnc_createpositioninmarker 	= compile preprocessFile "warcontext\WC_fnc_createpositioninmarker.sqf";
	WC_fnc_createtownpatrol		= compile preprocessFile "warcontext\WC_fnc_createtownpatrol.sqf";
	WC_fnc_createtrigger	 	= compile preprocessFile "warcontext\WC_fnc_createtrigger.sqf";
	WC_fnc_createwarcontext	 	= compile preprocessFile "warcontext\WC_fnc_createwarcontext.sqf";
	WC_fnc_debug			= compile preprocessFile "warcontext\WC_fnc_debug.sqf";
	WC_fnc_deletemarker		= compile preprocessFile "warcontext\WC_fnc_deletemarker.sqf";
	WC_fnc_getobject 		= compile preprocessFile "warcontext\WC_fnc_getobject.sqf";
	WC_fnc_getterraformvariance	= compile preprocessFile "warcontext\WC_fnc_getterraformvariance.sqf";
	WC_fnc_initconfig 		= compile preprocessFile "warcontext\WC_fnc_initconfig.sqf";
	WC_fnc_isinforest		= compile preprocessFile "warcontext\WC_fnc_isinforest.sqf";
	WC_fnc_isonmoutain		= compile preprocessFile "warcontext\WC_fnc_isonmoutain.sqf";
	WC_fnc_loadmission		= compile preprocessFile "warcontext\WC_fnc_loadmission.sqf";
	WC_fnc_loadcampaign		= compile preprocessFile "warcontext\WC_fnc_loadcampaign.sqf";
	WC_fnc_publishmission		= compile preprocessFile "warcontext\WC_fnc_publishmission.sqf";
	WC_fnc_randomizegroup 		= compile preprocessFile "warcontext\WC_fnc_randomizegroup.sqf";
	WC_fnc_garbagecollector		= compile preprocessFile "warcontext\WC_fnc_garbagecollector.sqf";
	WC_fnc_respawnvehicle		= compile preprocessFile "warcontext\WC_fnc_respawnvehicle.sqf";
	WC_fnc_restorebuilding		= compile preprocessFile "warcontext\WC_fnc_restorebuilding.sqf";
	WC_fnc_restorebuildingfrommerlin= compile preprocessFile "warcontext\WC_fnc_restorebuildingfrommerlin.sqf";
	WC_fnc_setskill 		= compile preprocessFile "warcontext\WC_fnc_setskill.sqf";
	WC_fnc_supplygroup 		= compile preprocessFile "warcontext\WC_fnc_supplygroup.sqf";
	
	
	// Init global variables
	nil = [] call WC_fnc_initconfig;

	// Init Warcontext
	nil = [] spawn WC_fnc_createwarcontext;

	// Choose between Random mission or Campaign mode
	if (paramsArray select 3 == 1) then {	
		// Init Campaign loader on server
		nil = [] spawn WC_fnc_loadcampaign;
	} else {
		// Init Mission loader on server
		nil = [] spawn WC_fnc_loadmission;
	};	

	// Init Debugger
	nil = [] spawn WC_fnc_debug;
	
	// Init Revive
	server execVM "revive_init.sqf";