	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: DESTROY
	// -----------------------------------------------
	if (!isServer) exitWith{};

	private ["_isflat", "_position", "_veh1", "_veh2", "_veh3", "_veh4", "_veh5", "_veh6", "_veh7", "_veh8", "_veh9", "_missionend", "_counter", "_missionnumber"];

	wcmissionauthor ="=[A*C]=Lueti";
	wcmissionname = "The beast of war";
	wcmissiondescriptionW = "A detachment of armored enemies is at rest in a camp. Tanks are empty and therefore inactive. This is an opportunity to reduce their impact force!";
	wcmissiondescriptionE = "You have to go to a rest camp, and guard it";
	wcmissiontarget = "Armors base";
	_missionnumber = 16;

	_position = [wcmaptopright, wcmapbottomleft, "onflat"] call WC_fnc_createposition;
	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;

	wcvehko1 = false;
	wcvehko2 = false;
	wcvehko3 = false;
	wcvehko4 = false;
	wcvehko5 = false;

	_pos1 = [_position select 0 , (_position select 1) - 20];
	_pos2 = [( _position select 0) + 50 , (_position select 1) - 50];
	_pos3 = [( _position select 0) , (_position select 1) - 100];

	nil = ["Weapon_Store_RU1", 50, _pos1] call EXT_fnc_createcomposition;
	nil = ["MediumTentCamp_RU", 50, _pos2] call EXT_fnc_createcomposition;
	nil = ["Fuel_Dump_RU1", 50, _pos3] call EXT_fnc_createcomposition;

	_flag = ['armorbase', 0.5, _position, 'ColorRed', 'ICON', 'FDIAGONAL', 'Flag', 0, 'Armored Base'] call WC_fnc_createmarker;

	_group = createGroup east;
	// create Empty T90
	for "_i" from 1 to 2 do {
		_position = [(_position select 0) + 10, _position select 1];
		call compile format["_veh%1 = 'T90' createVehicle _position; _veh%1 lock true;", _i];
		call compile format["_veh%1 addeventhandler ['killed', { wcvehko%1 = true; }];", _i];
	};

	// create Empty BTR90
	for "_i" from 3 to 5 do {
		_position = [(_position select 0) + 10, _position select 1];
		call compile format["_veh%1 = 'BTR90' createVehicle _position; _veh%1 lock true;", _i];
		call compile format["_veh%1 addeventhandler ['killed', { wcvehko%1 = true; }];", _i];
	};

	_missionend = false;
	_counter = 0;
	while { !_missionend } do {
		if (wcvehko1 && wcvehko2 && wcvehko3 && wcvehko4 && wcvehko5) then {
			wcmissionokW = [_missionnumber,true];
			publicvariable 'wcmissionokW';
			wcmissionokE = [_missionnumber,false];
			publicvariable 'wcmissionokE';
			nil = [nil,nil,rHINT,'Side mission: West wins ! Armors are destroyed!'] call RE;
			wcscore = 10;
			nil = [wcscore, wcside] spawn WC_fnc_score;
			wcmissionclear = true;
			_missionend = true;
		};
		if (_counter > 30) then {
			wcmissionokW = [_missionnumber,false];
			publicvariable 'wcmissionokW';
			wcmissionokE = [_missionnumber,true];
			publicvariable 'wcmissionokE';
			nil = [nil,nil,rHINT,'Side mission: East wins ! Too late.'] call RE;
			wcmissionclear = true;
			wcscore = 10;
			nil = [wcscore, wcenemyside] spawn WC_fnc_score;
			_missionend = true;
		};
		_counter = _counter + 1;
		sleep 60;
	};