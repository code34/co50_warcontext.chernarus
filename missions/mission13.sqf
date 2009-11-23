	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: SEARCH
	// -----------------------------------------------
	if (!isServer) exitWith{};

	private["_missionend", "_counter", "_missionnumber"];

	wcmissionauthor ="=[A*C]=Lueti";
	wcmissionname = "Return home";
	wcmissiondescriptionW = "The refugees of the village of Pulkovo have to return at home, we can take charge of them no longer. We are nevertheless going to go to check the village to be certain that they do not run a risk."; 
	wcmissiondescriptionE = "US try to invide our village of Pulkovo, you must destroy them"; 
	wcmissiontarget = "Pulkovo";
	_missionnumber = 13;

	_position = [4909,5616,0];
	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;

	_markername ="Pulkovo";
	_markersize = 250;
	nil = [_markername, _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;

	if(random 1 > 0.5) then {
		nil = [_markername] call WC_fnc_randomizegroup;
	};
	
	_trgmission13_a = createTrigger["EmptyDetector", _position]; 
	_trgmission13_a setTriggerArea[wctriggersize, wctriggersize, 0, false];
	_trgmission13_a setTriggerActivation["EAST","NOT PRESENT", false];
	_trgmission13_a setTriggerStatements["this or count thislist < 2", "
		wctrgmission13flag_a = true;
	", ""];

	_pos1 = [4989,5568,0];
	_trgmission13_b =createTrigger["EmptyDetector",_pos1]; 
	_trgmission13_b setTriggerArea[30,30,0,false];
	_trgmission13_b setTriggerActivation["WEST","PRESENT", false];
	_trgmission13_b setTriggerStatements["this", "
		wctrgmission13flag_b = true;
	", ""];

	_pos2 = [4953,5623,0];
	_trgmission13_c =createTrigger["EmptyDetector",_pos2]; 
	_trgmission13_c setTriggerArea[30,30,0,false];
	_trgmission13_c setTriggerActivation["WEST","PRESENT", false];
	_trgmission13_c setTriggerStatements["this", "
		wctrgmission13flag_c = true;
	", ""];

	_pos3 = [4907,5658,0];
	_trgmission13_d =createTrigger["EmptyDetector",_pos3]; 
	_trgmission13_d setTriggerArea[30,30,0,false];
	_trgmission13_d setTriggerActivation["WEST","PRESENT", false];
	_trgmission13_d setTriggerStatements["this", "
		wctrgmission13flag_d = true;
	", ""];

	_pos4 = [4866,5661,0];
	_trgmission13_e =createTrigger["EmptyDetector",_pos4]; 
	_trgmission13_e setTriggerArea[30,30,0,false];
	_trgmission13_e setTriggerActivation["WEST","PRESENT", false];
	_trgmission13_e setTriggerStatements["this", "
		wctrgmission13flag_e = true;
	", ""];

	_pos5 = [4917,5583,0];
	_trgmission13_f =createTrigger["EmptyDetector",_pos5]; 
	_trgmission13_f setTriggerArea[30,30,0,false];
	_trgmission13_f setTriggerActivation["WEST","PRESENT", false];
	_trgmission13_f setTriggerStatements["this", "
		wctrgmission13flag_f = true;
	", ""];

	_missionend = false;
	_counter = 0;
	while { !_missionend } do {
		if(wctrgmission13flag_a && wctrgmission13flag_b && wctrgmission13flag_c && wctrgmission13flag_d && wctrgmission13flag_e && wctrgmission13flag_f) then {
			nil = [nil,nil,rHINT,'Mission success'] call RE;
			wcmissionokW = [_missionnumber,true];
			publicvariable 'wcmissionokW';
			wcmissionokE = [_missionnumber,false];
			publicvariable 'wcmissionokE';
			wcscore = 10;
			nil = [wcscore, wcside] spawn WC_fnc_score;
			wcmissionclear = true;
			_missionend = true;
		};
		if(_counter > 30) then {
			nil = [nil,nil,rHINT,'East wins ! Too late!'] call RE;
			wcmissionokE = [_missionnumber,true];
			publicvariable 'wcmissionokE';
			wcmissionokW = [_missionnumber,false];
			publicvariable 'wcmissionokW';
			wcscore = 10;
			nil = [wcscore, wcenemyside] spawn WC_fnc_score;
			wcmissionclear = true;
			_missionend = true;
		};
		_counter = _counter + 1;
		sleep 60;
	};