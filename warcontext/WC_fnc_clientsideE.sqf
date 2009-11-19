	// -----------------------------------------------
	// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// Enhancement with Xeno script x_playerweapons.sqf
	// Client Side logic
	// -----------------------------------------------
	if (!local player) exitWith {};

	private [
		"_position", 
		"_magazines",
		"_weapons",
		"_primw",
		"_muzzles"
		];

	wcside = west;
	wcenemyside = east;
	wcterraingrid = 25;
	wcviewDist = 1500;
	setViewDistance wcviewDist;
	setTerrainGrid wcterraingrid;
	player_backpack = [];

	// Init Revive
	nil = server execVM "revive_init.sqf";

	WC_fnc_attachmarkerinzone2 	= compile preprocessFile "warcontext\WC_fnc_attachmarkerinzone2.sqf";
	WC_fnc_createmission		= compile preprocessFile "warcontext\WC_fnc_createmission.sqf";
	WC_fnc_createammobox		= compile preprocessFile "warcontext\WC_fnc_createammobox.sqf";
	WC_fnc_createmarker 		= compile preprocessFile "warcontext\WC_fnc_createmarker.sqf";
	WC_fnc_createmarkerlocal	= compile preprocessFile "warcontext\WC_fnc_createmarkerlocal.sqf";
	WC_fnc_createmortar 		= compile preprocessFile "warcontext\WC_fnc_createmortar.sqf";
	WC_fnc_createradio 		= compile preprocessFile "warcontext\WC_fnc_createradio.sqf";
	WC_fnc_createradar 		= compile preprocessFile "warcontext\WC_fnc_createradar.sqf";
	WC_fnc_repairvehicle 		= compile preprocessFile "warcontext\WC_fnc_repairvehicle.sqf";
	WC_fnc_getobject		= compile preprocessFile "warcontext\WC_fnc_getobject.sqf";
	WC_fnc_ianotblind		= compile preprocessFile "warcontext\WC_fnc_ianotblind.sqf";
	WC_fnc_followvehicle		= compile preprocessFile "warcontext\WC_fnc_followvehicle.sqf";

	// Init Dialog BOX
	nil = execVM "dialog\Scripts\ac_init_client.sqf";

	wcmissionokE = "";
	wclientinitialised = false;

	"wcpatria" addPublicVariableEventHandler {
		PATRIA=[East,"HQ"]; PATRIA SideChat wcpatria;
	};

	"wcmissionE" addPublicVariableEventHandler {
		if (wcinitialised && wclientinitialised) then {
			nil = [] spawn WC_fnc_createmission; 
		};
	};

	"wcmissionokE" addPublicVariableEventHandler {
		wccompletenumber = wcmissionokE select 0;
		wccompleteresult = wcmissionokE select 1;
		if(wccompleteresult) then {
			call compile format["task%1 settaskstate 'Succeeded'; ", wccompletenumber];
		} else {
			call compile format["task%1 settaskstate 'Failed'; ", wccompletenumber];
		};
		wcmissionokE = "";
	};

	"wcammoboxpositionE" addPublicVariableEventHandler {
		nil = [wcammoboxpositionE] spawn WC_fnc_createammobox;
	};

	// Trigger for para jump
	_trgpara = createTrigger["EmptyDetector" , position player];
	_trgpara setTriggerArea [0, 0, 0, false];
	_trgpara setTriggerActivation ["NONE", "PRESENT", true];
	_trgpara setTriggerStatements[
	"(typeof (vehicle player)) == 'ParachuteEast'", 
	"deletevehicle (vehicle player); [player, ((getpos(vehicle player)) select 2)] exec 'ca\air2\halo\data\Scripts\HALO_init.sqs'", 
	""];

	// Trigger for menu options
	_trgmenuoption = createTrigger["EmptyDetector" , position player];
	_trgmenuoption setTriggerArea [0, 0, 0, false];
	_trgmenuoption setTriggerActivation ["NONE", "PRESENT", true];
	_trgmenuoption setTriggerTimeout [5, 5, 5, false];
	_trgmenuoption setTriggerStatements[
	"vehicle player != player", 
	"wcvehicle = vehicle player; wcactionmenuoption = wcvehicle addAction ['Menu Options', 'dialog\GUI\Mainmenu.sqf',[],-1,false];", 
	"wcvehicle removeAction wcactionmenuoption;"];

	if (typeOf player == "RU_Soldier_Pilot") then {
		_trgparadropcrate = createTrigger["EmptyDetector" , position player];
		_trgparadropcrate setTriggerArea [0, 0, 0, false];
		_trgparadropcrate setTriggerActivation ["NONE", "PRESENT", true];
		_trgparadropcrate setTriggerStatements[
		"vehicle player != player && (vehicle player) isKindOf 'Air'", 
		"
		wcvehicle = vehicle player; wcactionparadrop = wcvehicle addAction ['Paradrop an Ammo crate', 'warcontext\WC_fnc_paradropcrate.sqf',[],-1,false];
		wcvehicle = vehicle player; wcactionparadropcargo = wcvehicle addAction ['Paradrop Group', 'warcontext\WC_fnc_paradropcargoclientside.sqf',[],-1,false];
		wcvehicle = vehicle player; wcactionparadropgift = wcvehicle addAction ['Paradrop a construction Kit', 'warcontext\WC_fnc_paradropgift.sqf',[],-1,false];
		", 
		"
		wcvehicle removeAction wcactionparadrop;
		wcvehicle removeAction wcactionparadropcargo;
		wcvehicle removeAction wcactionparadropgift;
		"];
	};


	if (typeOf player == "RU_Soldier") then {
		player addaction ["Build \ Remove Mortar","warcontext\WC_fnc_createmortar.sqf",[],-1,false];
	};

	if (typeOf player == "RU_Soldier_Medic") then {
		player addaction ["Build \ Remove hospital","warcontext\WC_fnc_createhospital.sqf",[],-1,false];
	};

	if (typeOf player == "RU_Soldier_Crew") then {
		player addaction ["Build \ Remove Radar","warcontext\WC_fnc_createradar.sqf",[],-1,false];
		player addaction ["Repair Vehicle","warcontext\WC_fnc_repairvehicle.sqf",[],-1,false];
	};

	if (typeOf player == "RU_Soldier_Light") then {
		player addaction ["Build \ Remove Radio","warcontext\WC_fnc_createradio.sqf",[],-1,false];
	};

	// ADD BACKPACK
	wcbackpack = player addAction ["Backpack Weapon", "extern\x_scripts\x_backpack.sqf",[],-1,false];

	// creation des ammobox sur le LHD
	_position = [((getposasl EBASE_MOBILE) select 0) + 20,  ((getposasl EBASE_MOBILE) select 1), ((getposasl EBASE_MOBILE) select 2)];
	_crate = [_position] call WC_fnc_createammobox;
	_crate setposasl _position;
	_crate setVectorUp [0,0,1];

	// add GPS
	player addweapon "ITEMGPS";

	// creation du journal sur la carte
	_diary = player createDiaryRecord ["Diary", ["Campaign", "Chernarus is at war since few months. You are one of the army group that fight against the russian troups. Your base is located at few miles of the Chernarus coast. You must search and destroy the Enemy. The enemy zone is blue on map. Your mission starts on the <marker name=""bonhomme"">U.S.S. Bon Homme Richard</marker>, be quiet, don't abuse of airplanes, and everything should be ok. Good luck!"]];

	// code a executer quand le joueur respawn
	// recuperation des armes identiques a avant la mort
	torespawn = {
		if(wcreinitscoreifdie) then {
			wcresetscore = player;
			publicvariable 'wcresetscore';
		};
		_weapons = weapons player;
		_magazines = magazines player;
		waitUntil {alive player};
		removeAllItems player;
		removeAllWeapons player;
		{player addMagazine _x;} forEach _magazines;
		{player addWeapon _x;} forEach _weapons;
		_primw = primaryWeapon player;
		if (_primw != "") then {
		        player selectWeapon _primw;
			_muzzles = getArray(configFile>>"cfgWeapons" >> _primw >> "muzzles");
			player selectWeapon (_muzzles select 0);
		};
		// ReInit Dialog BOX
		nil = execVM "dialog\Scripts\ac_init_client.sqf";
		if (typeOf player == "RU_Soldier") then {
			player addaction ["Build \ Remove Mortar","warcontext\WC_fnc_createmortar.sqf",[],-1,false];
		};

		if (typeOf player == "RU_Soldier_Medic") then {
			player addaction ["Build \ Remove hospital","warcontext\WC_fnc_createhospital.sqf",[],-1,false];
		};
		if (typeOf player == "RU_Soldier_Crew") then {
			player addaction ["Build \ Remove Radar","warcontext\WC_fnc_createradar.sqf",[],-1,false];
			player addaction ["Repair Vehicle","warcontext\WC_fnc_repairvehicle.sqf",[], -1,false];
		};
		if (typeOf player == "RU_Soldier_Light") then {
			player addaction ["Build \ Remove Radio","warcontext\WC_fnc_createradio.sqf",[],-1,false];
		};

		[player, name player, 0.5, 'ColorGreen', 'ICON', 'FDIAGONAL', 2, 'Dot', 0 , name player, false, 'RADIOFIELDE'] spawn WC_fnc_attachmarkerinzone2;
		wcbackpack = player addAction ["Backpack Weapon", "extern\x_scripts\x_backpack.sqf",[],-1,false];
	};

	player addEventHandler ['Fired', '
		nil = [(_this select 0)] spawn WC_fnc_ianotblind;
	'];

	player addeventhandler ['killed', {
		hidebody (_this select 0);
		nil = [] spawn torespawn;
	}];

	// introduction text
	PATRIA=[East,"HQ"]; PATRIA SideChat "Hi there. Your mission is to defend PATRIA against US INVASION! You will receive your first instructions in few minutes. During this time take some ammos. Good luck soldiers";

	// Init mission for JIP players
	nil = [] spawn WC_fnc_createmission;

	// Preloading all textures
	waitUntil {20000 preloadObject player};

	[player, name player, 0.5, 'ColorGreen', 'ICON', 'FDIAGONAL', 2, 'Dot', 0 , name player, false, 'RADIOFIELDE'] spawn WC_fnc_attachmarkerinzone2;

	// Mark friendly vehicle
	nil = [] spawn WC_fnc_followvehicle;

	hint "Init is done!";

	// sleep for ignoring first briefing trigger by eventhandler
	sleep 30;

	wclientinitialised = true;