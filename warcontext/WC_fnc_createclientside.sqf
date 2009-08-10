// -----------------------------------------------
// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// Enhancement with Xeno script x_playerweapons.sqf
// Client Side logic
// -----------------------------------------------
if (isServer) exitWith {};

private [
	"_position", 
	"_magazines",
	"_weapons",
	"_primw",
	"_muzzles"
	];

	// creation des ammobox sur le LHD
	_position = [13718, 1136, 16.7];
	nil = [_position] call WC_fnc_createammobox;
	_position = [13625, 1100, 16.7];
	nil = [_position] call WC_fnc_createammobox;

	// creation du journal sur la carte
	_diary = player createDiaryRecord ["Diary", ["Briefing", "Chernarus is at war since few months. You are one of the army group that fight against the russian troups. Your base is located at few miles of the Chernarus coast. You must search and destroy the Enemy. The enmy zone are red zone on maps. You mission starts on the <marker name=""bonhomme"">U.S.S. Bon Homme Richard</marker>, be quiete, don't abuse of the air planes, and all should be ok. good luck."]];

	// creation du trigger en local qui va
	// afficher l introduction des missions
	// creer le briefing des nouvelles missions
	//_trg = createTrigger["EmptyDetector",_position]; 
	//_trg setTriggerArea[5,5,0,false];
	//_trg setTriggerActivation["NONE","PRESENT",true];
	//_trg setTriggerStatements["wceventmission","
	//	wceventmission = false;
	//	nil = [] spawn WC_fnc_createmission; 
	//	nil = [] spawn WC_fnc_createintro;
	//",""];

	// code a executer quand le joueur respawn
	// recuperation des armes identiques a avant la mort
	// re creation du briefing pour contourner le bug arma
	torespawn = {
		hidebody player;
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
		//nil = [] call WC_fnc_createmission;
	};

	player addeventhandler ['killed', {
		nil = [] spawn torespawn;
	}];

	// Indique la mission comme accomplie quand le compteur de mission augmente de 1
	"wclevel" addPublicVariableEventHandler {
		call compile format["task%1 setTaskState 'Succeeded';", wclevel - 1];
	};

	"wcmission" addPublicVariableEventHandler {
		wceventmission = false;
		nil = [] spawn WC_fnc_createmission; 
	};

	"wcmissionname" addPublicVariableEventHandler {
		nil = [] spawn WC_fnc_createmission; 
	};