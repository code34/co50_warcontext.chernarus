	// -----------------------------------------------
	// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// Enhancement with Xeno script x_playerweapons.sqf
	// Client Side logic
	// -----------------------------------------------
	if (!isServer) exitWith{};

	"wcresetscore" addPublicVariableEventHandler {
			_player = wcresetscore;
			_score = score _player;
			_delta = 0 - _score;
			_player addscore _delta;
	};

	"wcparadropcargo" addPublicVariableEventHandler {
		nil = [] spawn WC_fnc_paradropcargoserverside;
	};

	"wcammoboxpositionW" addPublicVariableEventHandler {
		wcarrayammoboxpositionW = wcarrayammoboxpositionW + [wcammoboxpositionW];
	};

	"wcammoboxpositionE" addPublicVariableEventHandler {
		wcarrayammoboxpositionE = wcarrayammoboxpositionW + [wcammoboxpositionE];
	};

	"wcconstructionkitposition" addPublicVariableEventHandler {
		//wcconstructionkitindex = wcconstructionkitindex  + 1;
		//nil = [format['wcconstructionkit%1', wcconstructionkitindex], 0.5, wcconstructionkitposition, 'ColorGreen', 'ICON', 'FDIAGONAL', 'Select', 0, 'Construction Kit', true] call WC_fnc_createmarker;
	};

	"wckilledby" addPublicVariableEventHandler {
		nil = [] spawn WC_fnc_killedby;
	};

	j1 assignAsCommander US1;
	j1 assignAsCommander US2;
	j1 assignAsCommander US3;
	j1 assignAsCommander US4;
	j1 assignAsCommander US5;
	j1 assignAsCommander US6;
	j1 assignAsCommander US7;
	j1 assignAsCommander US8;
	j1 assignAsCommander US9;
	j1 assignAsCommander US10;
	j1 assignAsCommander US11;
	j1 assignAsCommander US12;
	
	j21 assignAsCommander RU1;
	j21 assignAsCommander RU2;
	j21 assignAsCommander RU3;
	j21 assignAsCommander RU4;
	j21 assignAsCommander RU5;
	j21 assignAsCommander RU6;
	j21 assignAsCommander RU7;
	j21 assignAsCommander RU8;
	j21 assignAsCommander RU9;
	
	[US1, 120] execVM "warcontext\WC_fnc_respawnvehicle.sqf";
	[US2, 120] execVM "warcontext\WC_fnc_respawnvehicle.sqf";
	[US3, 120] execVM "warcontext\WC_fnc_respawnvehicle.sqf";
	[US4, 120] execVM "warcontext\WC_fnc_respawnvehicle.sqf";
	[US5, 120] execVM "warcontext\WC_fnc_respawnvehicle.sqf";
	[US6, 120] execVM "warcontext\WC_fnc_respawnvehicle.sqf";
	[US7, 120] execVM "warcontext\WC_fnc_respawnvehicle.sqf";
	[US8, 120] execVM "warcontext\WC_fnc_respawnvehicle.sqf";
	[US9, 120] execVM "warcontext\WC_fnc_respawnvehicle.sqf";
	[US10, 120] execVM "warcontext\WC_fnc_respawnvehicle.sqf";
	[US11, 120] execVM "warcontext\WC_fnc_respawnvehicle.sqf";
	[US12, 120] execVM "warcontext\WC_fnc_respawnvehicle.sqf";
	
	[RU1, 120] execVM "warcontext\WC_fnc_respawnvehicle.sqf";
	[RU2, 120] execVM "warcontext\WC_fnc_respawnvehicle.sqf";
	[RU3, 120] execVM "warcontext\WC_fnc_respawnvehicle.sqf";
	[RU4, 120] execVM "warcontext\WC_fnc_respawnvehicle.sqf";
	[RU5, 120] execVM "warcontext\WC_fnc_respawnvehicle.sqf";
	[RU6, 120] execVM "warcontext\WC_fnc_respawnvehicle.sqf";
	[RU7, 120] execVM "warcontext\WC_fnc_respawnvehicle.sqf";
	[RU8, 120] execVM "warcontext\WC_fnc_respawnvehicle.sqf";
	[RU9, 120] execVM "warcontext\WC_fnc_respawnvehicle.sqf";

	onPlayerConnected call WC_fnc_publishmission;

	true;