	// -----------------------------------------------
	// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// create an US ammobox on local client side
	// -----------------------------------------------
	 private [
		"_position",
		"_list",
		"_object"
	];

	_position = _this select 0;

	_list = nearestObjects [_position, ["Misc_cargo_cont_net1"], 10];
	if(count _list > 0) then {
		_object = _list select 0;
		wcconstructionkitindex = wcconstructionkitindex  + 1;
		[_object, format['wcconstructionkit%1', wcconstructionkitindex], 0.5, 'ColorYellow', 'ICON', 'FDIAGONAL', 2, 'Flag', 0 , 'Construction Kit'] spawn WC_fnc_attachmarkerlocal;
	};

	true;