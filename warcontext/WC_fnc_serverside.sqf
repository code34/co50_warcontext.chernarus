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
		wcconstructionkitindex = wcconstructionkitindex  + 1;
		nil = [format['wcconstructionkit%1', wcconstructionkitindex], 0.5, wcconstructionkitposition, 'ColorGreen', 'ICON', 'FDIAGONAL', 'Select', 0, 'Construction Kit', true] call WC_fnc_createmarker;
	};


	onPlayerConnected call WC_fnc_publishmission;

	true;