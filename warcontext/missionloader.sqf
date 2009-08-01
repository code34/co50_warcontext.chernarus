// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// Mission loader - list all missions and load them
// -----------------------------------------------

private [
	"_markername",
	"_position", 
	"_markersize",
	"_object",
	"_objindex",
	"_vehicle",
	"_vehicle2",
	"_driver",
	"_dummygroup",
	"_soustract",
	"_xmove",
	"_ymove",
	"_counti",
	"_i",
	"_statement",
	"_wcbeginingposition"
	];

	// IA level : 1 is stronger
	// wcskill		= 1;

	// debug for warcontext :)
	wcdebug		= false;
	wcdebugstartposition	= [19033.5,13814.3,0];
	
	// size of dynamic zone generation. At 1500 of zone IA will begin to generate 
	// wctriggersize 	= 800;
	
	// friendly side resistance / east / west
	wcside 		= west;
	
	// enemy side
	wcenemyside	= east;

	// nombre de missions maximun
	wclevelmax	= 4;

	// number max of unit by zone
	// wcmaxenemyunit = 10;

	// number max of enemy vehicle by zone
	// wcmaxenemyvehicle = 5;

	// enemy airfield position
	// wcenemyairfieldposition = [19263,13935,0];

	// limit of map
	wcmaptopright 	= [14000, 13000];
	wcmapbottomleft = [1600, 1800];

	// creation du journal sur la carte
	_diary1 = player createDiaryRecord ["Diary", ["Briefing", "Chernarus is at war since few months. You are one of the army group that fight against the russian troups. Your base is located at few miles of the Chernarus coast. You must search and destroy the Enemy. The enmy zone are red zone on maps. You mission starts on the <marker name=""bonhomme"">U.S.S. Bon Homme Richard</marker>, be quiete, don't abuse of the air planes, and all should be ok. good luck."]];

	// do not edit below

	if (isServer) then {
		// global variables initilisation
		wcgroupindex = 0;
		wcgroupcount = 0;
		wccounttotalunit = 0;
		wcmissionclear = true;
		wconconnected = true;
	
		// liste des variables que le serveur envoie
		// aux joueurs rejoignant la partie en cours
		// les variables sont traites par le script
		// createclientside.sqf
		setupvariables = {
			publicvariable "wclevel";
			publicvariable "wclevelmax";
			publicvariable "wcmission";
			publicvariable "wcmissionposition";
			publicvariable 'wcmissionname';
			publicvariable 'wcmissionauthor';
			publicvariable 'wceventmission';
		};
		
		onPlayerConnected call setupvariables;
	
		// declaration de toutes les missions utilisables
		mission0 = compile preprocessFile "missions\mission0.sqf";
		mission1 = compile preprocessFile "missions\mission1.sqf";
		mission2 = compile preprocessFile "missions\mission2.sqf";
		mission3 = compile preprocessFile "missions\mission3.sqf";
		mission4 = compile preprocessFile "missions\mission4.sqf";
		//mission5 = compile preprocessFile "missions\mission5.sqf";
		mission6 = compile preprocessFile "missions\mission6.sqf";
		mission7 = compile preprocessFile "missions\mission7.sqf";
		mission8 = compile preprocessFile "missions\mission8.sqf";
	
		// creation du trigger qui declenche les missions
		// si wcmissionclear = true alors on cree une nouvelle mission
		// la mission utilise par defaut est la 0

		_position = [0,0,0];
		wcmissiontrg = createTrigger["EmptyDetector", _position]; 
		wcmissiontrg setTriggerArea[5,5,0,false];
		wcmissiontrg setTriggerActivation["NONE","PRESENT", true];
		call compile format ["wcmissiontrg setTriggerStatements[""wcmissionclear"", ""
			wcmissionclear = false;
			wcskill = wcskill + 0.05;
			wclevel = wclevel + 1;
			publicvariable 'wclevel';
			nil = [] spawn mission0;
			wcmission = [wcmissiondescription, wcmissionname, wcmissiontarget];
			publicvariable 'wcmission';
			publicvariable 'wcmissionname';
			publicvariable 'wcmissionauthor';
			publicvariable 'wcmissionposition'; 
			wceventmission = true;
			publicvariable 'wceventmission';
		"", """"];", wclevel];

	};

	// code utilise pour faire du debugage
	if (wcdebug) then {
		//player setpos wcdebugstartposition;
		while{(true)} do{
			sleep 4;
			hint format["
			Nb enemi: %1
			zone: %2
			Time: %3
			Beginzone: %4
			inventory: %5
			groupcount: %6
			level: %7
			maxenemyonmap: %8
			", wccounttotalunit, wctriggername, wcmarkertime, _wcbeginingposition, wctriggerinventory, wcgroupcount, wclevel, wcmaxenemyonmap];
		};
	};