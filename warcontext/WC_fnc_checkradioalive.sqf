	// -----------------------------------------------
	// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext - check radio
	// -----------------------------------------------
	if (!isServer) exitWith{};
	private ["_radio", "_side"];

	_radio = _this select 0;
	_side  = _this select 1;

	waituntil {!alive _radio;};

	if(_side == wcside) then {
		wcradioW = objnull;
		publicvariable "wcradioW";
		nil = [nil,nil,rHINT,'West radio has been destroyed'] call RE;
	} else {
		wcradioE = objnull;
		publicvariable "wcradioE";
		nil = [nil,nil,rHINT,'East radio has been destroyed'] call RE;
	};
	true;