// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
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
	
	// number of principal main mission
	wcnumbertarget 	= 1;

	// number of friend base
	wcnumberfriendbase = 5;

	// number of random enemy spot
	 wcrandomenemyzone = 1;

	// number max of unit by zone
	// wcmaxenemyunit = 10;

	// number max of enemy vehicle by zone
	// wcmaxenemyvehicle = 5;

	// enemy airfield position
	wcenemyairfieldposition = [19263,13935,0];

	// limit of map
	wcmaptopright 	= [14000, 13000];
	wcmapbottomleft = [1600, 1800];


	_diary1 = player createDiaryRecord ["Diary", ["Briefing", "Chernarus is at war since few months. You are one of the army group that fight against the russian troups. Your base is located at few miles of the Chernarus coast. You must search and destroy the Enemy. The enmy zone are red zone on maps. You mission starts on the <marker name=""bonhomme"">U.S.S. Bon Homme Richard</marker>, be quiete, don't abuse of the air planes, and all should be ok. good luck."]];


	// do not edit below

	// global variables initilisation
	wcgroupindex = 0;
	wcgroupcount = 0;
	wccounttotalunit = 0;
	wcsanitycheck = true;

	if (isServer) then {
			wcammobox = [];
			wcallposition = [];
			wcobjectiveclear = true; 
			publicvariable "wcobjectiveclear";

			buildobjective = {
				_position = [wcmaptopright, wcmapbottomleft] call func_createposition; 
				call compile format["['mrkrandom1', %1, 300, '', 1] spawn func_createtrigger;", _position];
				wcallposition = _position; publicvariable "wcallposition";
				wcobjectiveclear = false; 
				wcsanitycheck = false; 
				wceventobjective = true;
				publicvariable "wceventobjective";
			};

			// create random zone here
			//for "_i" from 1 to wcrandomenemyzone step 1 do {
			//	_position = [wcmaptopright, wcmapbottomleft] call func_createposition;
			//	wcallposition = wcallposition + [_position];
			//};

			//_objindex = 0;
			//{
			//	_objindex 	= _objindex + 1;
			//	call compile format["['mrkrandom%2', %1, 300, '', %2] spawn func_createtrigger;", _x, _objindex];
			//}foreach wcallposition;

			// DETECTOR TRIGGER
			_position = [wcmaptopright, wcmapbottomleft] call func_createposition;
			objtrg = createTrigger["EmptyDetector",_position]; 
			objtrg setTriggerArea[1,1,0,false];
			objtrg setTriggerActivation["NONE","PRESENT", TRUE];
			objtrg setTriggerStatements["wcobjectiveclear && wcsanitycheck", "
			deletemarker mrkrandom1;
			deletemarker mrkrandom1ups;
			deletemarker mrkrandom1debug;
			deletevehicle mrkrandom1trg;
			deletevehicle mrkrandom1trgsanity;
			deletevehicle mrkrandom1trgend;
			call buildobjective;
			", ""];

			_position = [wcmaptopright, wcmapbottomleft] call func_createposition;
			deltrg = createTrigger["EmptyDetector",_position]; 
			deltrg setTriggerArea[20000,20000,0,false];
			deltrg setTriggerActivation["EAST","PRESENT", TRUE];
			deltrg setTriggerStatements["this && wcobjectiveclear", "
			{
				_x setdamage 1;
			}foreach thislist;
			wcsanitycheck = true;
			", ""];
	};

	setupvariables = {
		publicvariable "wcallposition";
		publicvariable "wclevel";
		publicvariable "wcmission";
		publicvariable "wcmissionauthor";
		publicvariable "wcmissionposition";	
	};
	
	onPlayerConnected call setupvariables;

	call compile format["['mrkrandom1', %1, 300, '', 1] spawn func_createtriggerclientside;", wcallposition];

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