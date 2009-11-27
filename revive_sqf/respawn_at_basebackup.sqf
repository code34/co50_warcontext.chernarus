	// -----------------------------------------------
	// Author: Norrin
	// Reedited by =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext RESPAWN

	private ["_spawnpoint", "_spawnpos", "_name"];

	_spawnpos = _this select 0;
	_name = _this select 1;

	_name addrating 5000;

	detach _name;
	
	if (_spawnpos == 1) then {	
		hintc format ['%1', side _name];
		if (side _name == wcside) then {
			_spawnpoint = WBASE_MOBILE;
		} else {
			_spawnpoint = EBASE_MOBILE;
		};	
		_name setpos (getpos _spawnpoint);
		titletext ["You have respawned at BASE", "BLACK FADED", 1];
		_name setVariable ["NORRN_respawn_at_base", true, true];
		NORRN_spawn_chosen = true;
	};
	
	if (_spawnpos == 2) then {
		if (side _name == wcside) then {
			_spawnpoint = wchospitalW;
		} else {
			_spawnpoint = wchospitalE;
		};
		hintc 'here';
		_name setpos (getpos _spawnpoint);
		titletext ["You have respawned at HOSPITAL", "BLACK FADED", 1];
		_name setVariable ["NORRN_respawn_at_base", true, true];
		NORRN_spawn_chosen = true;
	};
	
	_name setCaptive false;
	true;