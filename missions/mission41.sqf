	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: DESTROY
	// -----------------------------------------------
	if (!isServer) exitWith{};

	private ["_object", "_missionend", "_counter", "_trg", "_marker", "_missionnumber", "_unit", "_group", "_list", "_position", "_unit", "_unit2", "_unit3", "_unit4"];

	wcmissionauthor = "=[A*C]= code34";
	wcmissionname = "Rescue civils";
	wcmissiondescriptionW = "There is somes civils that need to be rescued";
	wcmissiondescriptionE = "We works on an ambush. Go to this destination and kill all us with the help of civils.";
	wcmissiontarget = "Rescue civils";
	_missionnumber = 41;

	_objectid = 128875;

	_object = [_objectid] call WC_fnc_getobject;
	_position = position _object;
	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;

	_marker = ['civils', 0.5, position _object, 'ColorRed', 'ICON', 'FDIAGONAL', 'Flag', 0, 'civils'] call WC_fnc_createmarker;

	_markername = "civilszone";
	_markersize = 300;
	_marker = [_markername, _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;
	_group = [_marker] call WC_fnc_randomizegroup;	

	wcobject = false;

	_trg=createTrigger["EmptyDetector",_position]; 
	_trg setTriggerArea[20,20,0,false];
	_trg setTriggerActivation["West","PRESENT",true];
	_trg setTriggerStatements["this", "wcobject = true;", ""];

	_missionend = false;
	_counter = 0;
	_group = creategroup east;
	while { !_missionend } do {
		if(wcobject) then {
			_list = list _trg;
			wcobject = false;
			deletevehicle _trg;
			_unit = _group createUnit ["Woodlander1", [(_position select 0) - 20, _position select 1], [], 0, "NONE"];
			_unit2 = _group createUnit ["Woodlander2", [(_position select 0) - 20, _position select 1], [], 0, "NONE"];
			_unit3 = _group createUnit ["Woodlander3", [(_position select 0) - 20, _position select 1], [], 0, "NONE"];
			_unit4 = _group createUnit ["Woodlander4", [(_position select 0) - 20, _position select 1], [], 0, "NONE"];
			_unit setskill 1;
			_unit2 setskill 1;
			_unit3 setskill 1;
			_unit4 setskill 1;
			_unit addWeapon "M16A2";
			_unit2 addWeapon "M16A2";
			_unit3 addWeapon "M16A2";
			_unit4 addWeapon "M16A2";
			sleep 60;
			_group setCombatMode "RED";
			_unit addMagazine "20Rnd_556x45_Stanag";
			_unit2 addMagazine "20Rnd_556x45_Stanag";
			_unit3 addMagazine "20Rnd_556x45_Stanag";
			_unit4 addMagazine "20Rnd_556x45_Stanag";
		};
		if (!alive _unit && !alive _unit2 && !alive _unit3 && !alive _unit4) then {
			nil = [nil,nil,rHINT,'Side mission: West wins ! The civil were killed'] call RE;
			wcmissionokE = [_missionnumber, false];
			publicvariable 'wcmissionokE';
			wcmissionokW = [_missionnumber,true];
			publicvariable 'wcmissionokW';
			wcscore = 10;
			nil = [wcscore, wcside] spawn WC_fnc_score;
			wcmissionclear = true;
			_missionend = true;
		};
		if(_counter > 30) then {
			nil = [nil,nil,rHINT,'Side mission: East wins ! Too late.'] call RE;
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
	deletevehicle _trg;

	sleep 120;

	{
		_x setdammage 1;
		deletevehicle _x;
	}foreach (units _group);