	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: DESTROY
	// -----------------------------------------------
	if (!isServer) exitWith{};

	private ["_missionend", "_sourceposition", "_destinationposition", "_arrayreturn", "_chopper", "_particule"];

	wcmissionauthor ="=[A*C]=Lueti";
	wcmissionname = "Format C:";
	wcmissiondescriptionW = "One of our choppers had his engine out of order and had to land of urgency. Regrettably, its embedded computer contains data relative to the positions of our strengths. It is thus necessary to go to blow up this device.";
	wcmissiondescriptionW = "A enemy chopper has been destroy, find it and take the informations that it contains";
	wcmissiontarget = "Mh down";

	_destinationposition = [wcmaptopright, wcmapbottomleft, "onflat"] call WC_fnc_createposition;
	wcmissionposition = _destinationposition;
	nil = [] spawn WC_fnc_publishmission;

	_array =[_destinationposition, 0, "MH60S", west] call BIS_fnc_spawnVehicle;
	_chopper = _array select 0;
	_chopper setpos [(position _chopper) select 0, (position _chopper) select 1, 0];
	_pilot1 = (_array select 1) select 0;
	_pilot2 = (_array select 1) select 1;
	_pilot3 = (_array select 1) select 2;
	_chopper setFuel 0;
	_chopper setdamage 0.60;
	_pilot1 setdamage 1;
	_pilot2 setdamage 1;
	_pilot3 setdamage 1;

	sleep 5;

	_particule = "#particlesource" createVehicle position _chopper;
	_particule setParticleCircle [3, [0, 0, 0]];
	_particule setParticleRandom [0, [0.25, 0.25, 0], [0.2, 0.2, 0], 10, 0.1, [0, 0, 0, 0.1], 0, 0];
	_particule setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal.p3d", 16, 7, 48], "", "Billboard", 1, 10, [0, 0, 0], [0, 0, 1], 0, 10, 10, 0.1, [2, 6, 12], [[1, 1, 1, 0.7], [1, 1, 1, 0.15], [1, 1, 1, 0]], [0.125], 1, 0, "", "", _particule];
	_particule setDropInterval 0.20;

	nil = ['chopper', 0.5, _destinationposition, 'ColorRed', 'ICON', 'FDIAGONAL', 'Flag', 0, 'chopper'] call WC_fnc_createmarker;
	
	_sourceposition = [wcmaptopright, wcmapbottomleft, "onroad"] call WC_fnc_createposition;
	_arrayofvehicle = ["Kamaz", "BTR90", "UAZ_AGS30_RU"];
	_arrayreturn = [_sourceposition, _destinationposition, _arrayofvehicle, east, true, "EnemySearch_"] call WC_fnc_createconvoy;

	_missionend = false;
	while { !_missionend } do {
		{		
			if ([(position _x) select 0, (position _x) select 1]  distance _destinationposition < 50) then {
				wcmissionokW = [25,false];
				wcmissionokE = [25,true];
				publicvariable 'wcmissionokW';
				publicvariable 'wcmissionokE';
				nil = [nil,nil,rHINT,'Mission Failed, enemy find the chopper.'] call RE;
				deletevehicle _particule;
				wcmissionclear = true;
				_missionend = true;
				wcscore = -10;
			};
			if (!alive _x) then {
				_arrayreturn = _arrayreturn - [_x];
			};
			sleep 0.1;
		}foreach _arrayreturn;
		if (!alive _chopper or (getdammage _chopper) > 0.99) then {
			wcmissionokW = [25,true];
			wcmissionokE = [25,false];
			publicvariable 'wcmissionokW';
			publicvariable 'wcmissionokE';
			nil = [nil,nil,rHINT,'Chopper has been destroyed.'] call RE;
			deletevehicle _particule;
			wcmissionclear = true;
			_missionend = true;
			wcscore = 10;
		};
		if (count _arrayreturn == 0) then {
			wcmissionokW = [25,true];
			wcmissionokW = [25, false];
			publicvariable 'wcmissionokW';
			publicvariable 'wcmissionokE';
			nil = [nil,nil,rHINT,'Enemy Reseach has been destroyed.'] call RE;
			deletevehicle _particule;
			wcmissionclear = true;
			_missionend = true;
			wcscore = 5;
		};
		sleep 4;
	};