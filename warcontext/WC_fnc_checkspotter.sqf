	// -----------------------------------------------
	// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext - protect base from spotter
	// -----------------------------------------------

	WC_fnc_checkspotterW = {
		private ["_unit", "_killer"];
	
		_unit = _this select 0;
		_killer = _this select 1;
	
		if( _unit distance (getmarkerpos "BLUEFOR") < 200) then {
			_killer setdammage 1;
		};
		true;
	};

	WC_fnc_checkspotterE = {
		private ["_unit", "_killer"];
	
		_unit = _this select 0;
		_killer = _this select 1;
	
		if( _unit distance (getmarkerpos "OPFOR") < 200) then {
			_killer setdammage 1;
		};
		true;
	};
