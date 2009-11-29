	// -----------------------------------------------
	// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// Enhancement with Xeno script x_playerweapons.sqf
	// -----------------------------------------------
	
	private ["_bonusevent", "_name", "_object", "_marker", "_position", "_markersize"];

	if (side player == wcside) then {
		_bonusevent = wcbonuseventW;
	} else {
		_bonusevent = wcbonuseventE;
	};

	_name = _bonusevent select 0;
	_object = _bonusevent select 1;

	if(alive _object) then {
		_marker = [_name, 1, position _object, 'ColorRed', 'ICON', 'FDIAGONAL', 'Select', 0, _name, true] call WC_fnc_createmarkerlocal;

		_markersize = ((getposasl _object) select 2) * 5;
		_position = getpos _object;
		_marker = ["ENEMYOBJECT", _markersize, _position, 'ColorRed', 'ELLIPSE', 'FDIAGONAL', '', 0, '', true] call WC_fnc_createmarkerlocal;
		_marker setmarkerposlocal (getpos _object);
		_marker setmarkersizelocal [_markersize, _markersize];
	
		_message = "ENEMY BUILDING HAS BEEN SPOTTED. Look at your map to localize it";	
	
		if (side player == wcside) then {
			PAPABEAR=[West,"HQ"]; PAPABEAR SideChat _message;
		} else {
			PATRIA=[East,"HQ"]; PATRIA SideChat _message;
		};
		waituntil {!alive _object};
		deletemarkerlocal _name;
		deletemarkerlocal "ENEMYOBJECT";
	};
	true;