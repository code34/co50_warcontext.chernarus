	// -----------------------------------------------
	// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// Enhancement with Xeno script x_playerweapons.sqf
	// Client Side logic
	// -----------------------------------------------
	if (!local player) exitWith {};

	waituntil {!isNull player};

	private [
		"_position", 
		"_magazines",
		"_weapons",
		"_primw",
		"_muzzles"
		];

	//Init variables
	wcside = west;
	wcenemyside = east;
	player_backpack = [];
	wcmypersonnalmissionlist = [];
	wcmypersonnalmainmissionlist = [];
	wcammoboxindex = 0;
	wcmainmissionindex = 0;
	wcconstructionkitindex = 0;
	wcammoused = 1;
	wcnumberofkill = 0;
	wcgameend = false;

	// Init Revive
	nil = server execVM "revive_init.sqf";

	WC_fnc_attachmarkerlocal	= compile preprocessFile "warcontext\WC_fnc_attachmarkerlocal.sqf";
	WC_fnc_createbonusevent		= compile preprocessFile "warcontext\WC_fnc_createbonusevent.sqf";
	WC_fnc_createconstructionkit	= compile preprocessFile "warcontext\WC_fnc_createconstructionkit.sqf";
	WC_fnc_createmission		= compile preprocessFile "warcontext\WC_fnc_createmission.sqf";
	WC_fnc_createmainmission	= compile preprocessFile "warcontext\WC_fnc_createmainmission.sqf";
	WC_fnc_createammobox		= compile preprocessFile "warcontext\WC_fnc_createammobox.sqf";
	WC_fnc_createmarker 		= compile preprocessFile "warcontext\WC_fnc_createmarker.sqf";
	WC_fnc_createmarkerlocal	= compile preprocessFile "warcontext\WC_fnc_createmarkerlocal.sqf";
	WC_fnc_createmarkerlocalanddelete= compile preprocessFile "warcontext\WC_fnc_createmarkerlocalanddelete.sqf";
	WC_fnc_createmortar 		= compile preprocessFile "warcontext\WC_fnc_createmortar.sqf";
	WC_fnc_createradio 		= compile preprocessFile "warcontext\WC_fnc_createradio.sqf";
	WC_fnc_createradar 		= compile preprocessFile "warcontext\WC_fnc_createradar.sqf";
	WC_fnc_createtrench 		= compile preprocessFile "warcontext\WC_fnc_createtrench.sqf";
	WC_fnc_paradropsmoke		= compile preprocessFile "warcontext\WC_fnc_paradropsmoke.sqf";
	WC_fnc_repairvehicle 		= compile preprocessFile "warcontext\WC_fnc_repairvehicle.sqf";
	WC_fnc_getobject		= compile preprocessFile "warcontext\WC_fnc_getobject.sqf";
	WC_fnc_ianotblind		= compile preprocessFile "warcontext\WC_fnc_ianotblind.sqf";
	WC_fnc_followvehicle		= compile preprocessFile "warcontext\WC_fnc_followvehicle.sqf";
	WC_fnc_followhackedplayer	= compile preprocessFile "warcontext\WC_fnc_followhackedplayer.sqf";
	WC_fnc_followplayer		= compile preprocessFile "warcontext\WC_fnc_followplayer.sqf";
	WC_fnc_followradar		= compile preprocessFile "warcontext\WC_fnc_followradar.sqf";
	WC_fnc_followhospital		= compile preprocessFile "warcontext\WC_fnc_followhospital.sqf";
	WC_fnc_markerhintlocal		= compile preprocessFile "warcontext\WC_fnc_markerhintlocal.sqf";
	WC_fnc_lifeslider		= compile preprocessFile "warcontext\WC_fnc_lifeslider.sqf";
	WC_fnc_paradropcargoclientside	= compile preprocessFile "warcontext\WC_fnc_paradropcargoclientside.sqf";
	call compile preprocessFile "warcontext\WC_fnc_checkspotter.sqf";

	nil = [] spawn WC_fnc_lifeslider;

	// Init Dialog BOX
	player addaction ["Warcontext Menu","dialog\GUI\Mainmenu.sqf",[],-1,false];

	wcmissionokE = "";
	wclientinitialised = false;

	"wcbonuseventE" addPublicVariableEventHandler {
		nil = [] spawn WC_fnc_createbonusevent;
	};

	"wcpatria" addPublicVariableEventHandler {
		PATRIA=[East,"HQ"]; PATRIA SideChat wcpatria;
	};

	"wcmissionE" addPublicVariableEventHandler {
		if (wcinitialised && wclientinitialised) then {
			nil = [] spawn WC_fnc_createmission; 
		};
	};

	"wcmainmissionE" addPublicVariableEventHandler {
		nil = [] spawn WC_fnc_createmainmission; 
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

	"wcconstructionkitpositionE" addPublicVariableEventHandler {
		nil = [wcconstructionkitpositionE] spawn WC_fnc_createconstructionkit;
	};

	"wckilledby" addPublicVariableEventHandler {
		if( wckilledby select 1 == player) then {
			wcnumberofkill = wcnumberofkill + 1;
		};
	};

	"wcmessageE" addPublicVariableEventHandler {
		PATRIA=[East,"HQ"]; PATRIA SideChat wcmessageE;
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
	"wcvehicle = vehicle player; wcactionmenuoption = wcvehicle addAction ['Warcontext Menu', 'dialog\GUI\Mainmenu.sqf',[],-1,false];", 
	"wcvehicle removeAction wcactionmenuoption;"];

	if (typeOf player == "RU_Soldier_Pilot") then {
		_trgparadropcrate = createTrigger["EmptyDetector" , position player];
		_trgparadropcrate setTriggerArea [0, 0, 0, false];
		_trgparadropcrate setTriggerActivation ["NONE", "PRESENT", true];
		_trgparadropcrate setTriggerStatements[
		"vehicle player != player && (vehicle player) isKindOf 'Air' && (driver (vehicle player)) == player", 
		"
		wcvehicle = vehicle player; 
		wcmenulift = wcvehicle addaction ['Lift','warcontext\WC_fnc_helilift.sqf',[],6,false];
		wcactionparadrop = wcvehicle addAction ['Paradrop an Ammo crate', 'warcontext\WC_fnc_paradropcrate.sqf',[],-1,false];
		wcactionparadropcargo = wcvehicle addAction ['Paradrop Group', 'warcontext\WC_fnc_paradropcargoclientside.sqf',[],-1,false];
		wcactionparadropgift = wcvehicle addAction ['Paradrop a construction Kit', 'warcontext\WC_fnc_paradropgift.sqf',[],-1,false];
		wcactionparadropsmoke = wcvehicle addAction ['Paradrop smoke', 'warcontext\WC_fnc_paradropsmoke.sqf',[],-1,false];
		", 
		"
		wcvehicle removeAction wcactionparadrop;
		wcvehicle removeAction wcactionparadropcargo;
		wcvehicle removeAction wcactionparadropgift;
		wcvehicle removeAction wcmenulift;
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
	// wcbackpack = player addAction ["Backpack Weapon", "extern\x_scripts\x_backpack.sqf",[],-1,false];
	wccreatetrench = player addAction ["Create Trench", "warcontext\WC_fnc_createtrench.sqf",[],-1,false];

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
	WC_fnc_torespawnE = {
		sleep 10;
		if(wcreinitscoreifdie) then {
			wcresetscore = player;
			publicvariable 'wcresetscore';
		};
		// ReInit Dialog BOX
		player addaction ["Warcontext Menu","dialog\GUI\Mainmenu.sqf",[],-1,false];
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
		//wcbackpack = player addAction ["Backpack Weapon", "extern\x_scripts\x_backpack.sqf",[],-1,false];
		wccreatetrench = player addAction ["Create Trench", "warcontext\WC_fnc_createtrench.sqf",[],-1,false];
		//waituntil {(velocity player select 1) > 1};
		//nil = [] spawn WC_fnc_lifeslider;
	};

	player addEventHandler ['Fired', '
		nil = [(_this select 0)] spawn WC_fnc_ianotblind;
		wcammoused = wcammoused + 1;
	'];

	player addeventhandler ['killed', {
		wckilledby = [_this select 0, _this select 1]; publicvariable 'wckilledby';
		nil = [_this select 0, _this select 1] spawn WC_fnc_checkspotterE;
		nil = [] spawn WC_fnc_torespawnE;
	}];

	// introduction text
	PATRIA=[East,"HQ"]; PATRIA SideChat "Hi there. Your mission is to defend PATRIA against US INVASION! You will receive your first instructions in few minutes. During this time take some ammos. Good luck soldiers";

	// Init mission for JIP players
	nil = [] spawn WC_fnc_createmission;
	nil = [] spawn WC_fnc_createmainmission;

	// Preloading all textures
	waitUntil {20000 preloadObject player};

	// Mark friendly vehicle
	nil = [] spawn WC_fnc_followvehicle;
	nil = [] spawn WC_fnc_followplayer;
	//nil = [] spawn WC_fnc_followhackedplayer;
	nil = [] spawn WC_fnc_followradar;
	nil = [] spawn WC_fnc_followhospital;

	hint "Init is done!";

	WC_fnc_lockme = {
		private ["_arrayobjects", "_object", "_actionlocked", "_result", "_seed", "_name"];
		_seed = floor(random 36000);
		while { !wcgameend } do {
			_arrayobjects = nearestObjects [player, ["Air", "Car", "LandVehicle", "Tank"], 20];
			if (count _arrayobjects > 0) then {
				_object = _arrayobjects select 0;
				_name = name player + format["%1", _seed];
				_result = _object getVariable _name;
				if(isnil "_result") then {_object setVariable [_name, false, true];};
				if!(_result) then {
					_object addaction ["Lock / Unlock Vehicle","warcontext\WC_fnc_lockvehicle.sqf", [_seed],-1,false,true];
					_object setVariable [_name, true, true];
				};
			};
			sleep 4;
		};
	};

	nil = [] spawn WC_fnc_lockme;

	// sleep for ignoring first briefing trigger by eventhandler
	sleep 30;

	wclientinitialised = true;