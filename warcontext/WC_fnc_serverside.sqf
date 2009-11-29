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

	"wcradioW" addPublicVariableEventHandler {
		nil = [wcradioW, wcside] spawn WC_fnc_checkradioalive;
	};

	"wcradioE" addPublicVariableEventHandler {
		nil = [wcradioE, wcenemyside] spawn WC_fnc_checkradioalive;
	};

	"wcradarW" addPublicVariableEventHandler {
		nil = [wcradarW, wcside] spawn WC_fnc_checkradaralive;
	};

	"wcradarE" addPublicVariableEventHandler {
		nil = [wcradarE, wcenemyside] spawn WC_fnc_checkradaralive;
	};

	"wchospitalW" addPublicVariableEventHandler {
		nil = [wchospitalW, wcside] spawn WC_fnc_checkhospitalalive;
	};

	"wchospitalE" addPublicVariableEventHandler {
		nil = [wchospitalE, wcenemyside] spawn WC_fnc_checkhospitalalive;
	};

	"wclock" addPublicVariableEventHandler {
		wclock lock true;
	};

	"wcunlock" addPublicVariableEventHandler {
		wcunlock lock false;
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
	j1 assignAsCommander US13;
	j1 assignAsCommander US14;
	j1 assignAsCommander US15;
	
	j21 assignAsCommander RU1;
	j21 assignAsCommander RU2;
	j21 assignAsCommander RU3;
	j21 assignAsCommander RU4;
	j21 assignAsCommander RU5;
	j21 assignAsCommander RU6;
	j21 assignAsCommander RU7;
	j21 assignAsCommander RU8;
	j21 assignAsCommander RU9;
	j21 assignAsCommander RU10;
	j21 assignAsCommander RU11;
	j21 assignAsCommander RU12;
	
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
	[US13, 120] execVM "warcontext\WC_fnc_respawnvehicle.sqf";
	[US14, 120] execVM "warcontext\WC_fnc_respawnvehicle.sqf";
	[US15, 120] execVM "warcontext\WC_fnc_respawnvehicle.sqf";

	US1 addeventhandler ['killed', { nil = [_this select 0, _this select 1] spawn WC_fnc_checkspotterW; }];
	US2 addeventhandler ['killed', { nil = [_this select 0, _this select 1] spawn WC_fnc_checkspotterW; }];
	US3 addeventhandler ['killed', { nil = [_this select 0, _this select 1] spawn WC_fnc_checkspotterW; }];
	US4 addeventhandler ['killed', { nil = [_this select 0, _this select 1] spawn WC_fnc_checkspotterW; }];
	US5 addeventhandler ['killed', { nil = [_this select 0, _this select 1] spawn WC_fnc_checkspotterW; }];
	US6 addeventhandler ['killed', { nil = [_this select 0, _this select 1] spawn WC_fnc_checkspotterW; }];
	US7 addeventhandler ['killed', { nil = [_this select 0, _this select 1] spawn WC_fnc_checkspotterW; }];
	US8 addeventhandler ['killed', { nil = [_this select 0, _this select 1] spawn WC_fnc_checkspotterW; }];
	US9 addeventhandler ['killed', { nil = [_this select 0, _this select 1] spawn WC_fnc_checkspotterW; }];
	US10 addeventhandler ['killed', { nil = [_this select 0, _this select 1] spawn WC_fnc_checkspotterW; }];
	US11 addeventhandler ['killed', { nil = [_this select 0, _this select 1] spawn WC_fnc_checkspotterW; }];
	US12 addeventhandler ['killed', { nil = [_this select 0, _this select 1] spawn WC_fnc_checkspotterW; }];
	US13 addeventhandler ['killed', { nil = [_this select 0, _this select 1] spawn WC_fnc_checkspotterW; }];
	US14 addeventhandler ['killed', { nil = [_this select 0, _this select 1] spawn WC_fnc_checkspotterW; }];
	US15 addeventhandler ['killed', { nil = [_this select 0, _this select 1] spawn WC_fnc_checkspotterW; }];
	
	[RU1, 120] execVM "warcontext\WC_fnc_respawnvehicle.sqf";
	[RU2, 120] execVM "warcontext\WC_fnc_respawnvehicle.sqf";
	[RU3, 120] execVM "warcontext\WC_fnc_respawnvehicle.sqf";
	[RU4, 120] execVM "warcontext\WC_fnc_respawnvehicle.sqf";
	[RU5, 120] execVM "warcontext\WC_fnc_respawnvehicle.sqf";
	[RU6, 120] execVM "warcontext\WC_fnc_respawnvehicle.sqf";
	[RU7, 120] execVM "warcontext\WC_fnc_respawnvehicle.sqf";
	[RU8, 120] execVM "warcontext\WC_fnc_respawnvehicle.sqf";
	[RU9, 120] execVM "warcontext\WC_fnc_respawnvehicle.sqf";
	[RU10, 120] execVM "warcontext\WC_fnc_respawnvehicle.sqf";
	[RU11, 120] execVM "warcontext\WC_fnc_respawnvehicle.sqf";
	[RU12, 120] execVM "warcontext\WC_fnc_respawnvehicle.sqf";

	RU1 addeventhandler ['killed', { nil = [_this select 0, _this select 1] spawn WC_fnc_checkspotterE; }];
	RU2 addeventhandler ['killed', { nil = [_this select 0, _this select 1] spawn WC_fnc_checkspotterE; }];
	RU3 addeventhandler ['killed', { nil = [_this select 0, _this select 1] spawn WC_fnc_checkspotterE; }];
	RU4 addeventhandler ['killed', { nil = [_this select 0, _this select 1] spawn WC_fnc_checkspotterE; }];
	RU5 addeventhandler ['killed', { nil = [_this select 0, _this select 1] spawn WC_fnc_checkspotterE; }];
	RU6 addeventhandler ['killed', { nil = [_this select 0, _this select 1] spawn WC_fnc_checkspotterE; }];
	RU7 addeventhandler ['killed', { nil = [_this select 0, _this select 1] spawn WC_fnc_checkspotterE; }];
	RU8 addeventhandler ['killed', { nil = [_this select 0, _this select 1] spawn WC_fnc_checkspotterE; }];
	RU9 addeventhandler ['killed', { nil = [_this select 0, _this select 1] spawn WC_fnc_checkspotterE; }];
	RU10 addeventhandler ['killed', { nil = [_this select 0, _this select 1] spawn WC_fnc_checkspotterE; }];
	RU11 addeventhandler ['killed', { nil = [_this select 0, _this select 1] spawn WC_fnc_checkspotterE; }];
	RU12 addeventhandler ['killed', { nil = [_this select 0, _this select 1] spawn WC_fnc_checkspotterE; }];

	onPlayerConnected call WC_fnc_publishmission;

	true;