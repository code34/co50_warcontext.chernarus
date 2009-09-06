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

	wcsuccess = false;
	wcfail = false;
	wclientinitialised = false;

	"wcmission" addPublicVariableEventHandler {
		if (wcinitialised && wclientinitialised) then {
			nil = [] spawn WC_fnc_createmission; 
		};
	};

	"wcsuccess" addPublicVariableEventHandler {
		call compile format["task%1 settaskstate 'Succeeded'; ", wclevel];
		wcsuccess = false;
	};

	"wcfail" addPublicVariableEventHandler {
		call compile format["task%1 settaskstate 'Failed'; ", wclevel];
		wcfail = false;
	};


	// creation des ammobox sur le LHD
	_position = [13718, 1136, 16.6];
	nil = [_position] call WC_fnc_createammobox;
	_position = [13625, 1100, 16.6];
	nil = [_position] call WC_fnc_createammobox;

	// creation du journal sur la carte
	_diary = player createDiaryRecord ["Diary", ["Briefing", "Chernarus is at war since few months. You are one of the army group that fight against the russian troups. Your base is located at few miles of the Chernarus coast. You must search and destroy the Enemy. The enemy zone is blue on map. Your mission starts on the <marker name=""bonhomme"">U.S.S. Bon Homme Richard</marker>, be quiet, don't abuse of airplanes, and everything should be ok. Good luck!"]];

	// code a executer quand le joueur respawn
	// recuperation des armes identiques a avant la mort
	torespawn = {
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
	};

	player addeventhandler ['killed', {
		hidebody (_this select 0);
		nil = [] spawn torespawn;
	}];

	// Init mission for JIP players
	if (wcinitialised) then {
		nil = [] spawn WC_fnc_createmission;
	};

	// sleep for ignoring first briefing trigger by eventhandler
	sleep 120;

	wclientinitialised = true;