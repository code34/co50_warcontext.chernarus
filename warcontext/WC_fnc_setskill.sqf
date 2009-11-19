	// -----------------------------------------------
	// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// -----------------------------------------------
	if (!isServer) exitWith{};

	private [
		"_unit",
		"_level"
		];
	
	_unit 	= _this select 0;
	_level 	= _this select 1; 
	
	_skill = [
		"aimingAccuracy",
		"aimingShake",
		"aimingSpeed",
		"endurance",
		"spotDistance",
		"spotTime",
		"courage",
		"reloadSpeed",
		"commanding",
		"general"
		];
	
	{
		_unit setskill [_x, _level];
		sleep 0.1;
	}foreach _skill;

	_unit setskill wcskill;

	_unit addEventHandler ['Hit', '
		(_this select 0) doTarget (_this select 1);
	'];

	_unit addEventHandler ['FiredNear', '
		if (side (_this select 1) == wcside) then {
			(_this select 0) doTarget (_this select 1);
		};
	'];

	true;