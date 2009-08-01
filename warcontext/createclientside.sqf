// -----------------------------------------------
// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// Enhancement with Xeno script x_playerweapons.sqf
// Client Side logic
// -----------------------------------------------

private [
	"_position", 
	"_magazines",
	"_weapons",
	"_primw",
	"_muzzles"
	];

	// creation des ammobox sur le LHD
	_position = [13718, 1136, 16.7];
	nil = [_position] call func_createammo;
	_position = [13625, 1100, 16.7];
	nil = [_position] call func_createammo;

	// creation du trigger en local qui va
	// afficher l introduction des missions
	// creer le briefing des nouvelles missions
	_trg = createTrigger["EmptyDetector",_position]; 
	_trg setTriggerArea[5,5,0,false];
	_trg setTriggerActivation["NONE","PRESENT",true];
	_trg setTriggerStatements["wceventmission","
		wceventmission = false;
		nil = [] spawn func_createmission; 
		nil = [] spawn func_createintro;
	",""];

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
		nil = [] call func_createmission;
	};

	player addeventhandler ['killed', {
		nil = [] spawn torespawn;
	}];

	// Indique la mission comme accomplie quand le compteur de mission augmente de 1
	"wclevel" addPublicVariableEventHandler {
		call compile format["task%1 setTaskState 'Succeeded';", wclevel - 1];
	};