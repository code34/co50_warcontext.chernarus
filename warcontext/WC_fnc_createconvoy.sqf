// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// Create a convoy - maximun of vehicles = 10
// -----------------------------------------------
if (!isServer) exitWith{};

	private [
		"_array",
		"_arrayofvehicle",
		"_arrayofunits",
		"_arrayreturn",
		"_destinationposition",
		"_drawmarker",
		"_index",
		"_indexparameters",
		"_nbparameters",
		"_parameters",
		"_group",
		"_sourceposition",
		"_destinationposition",
		"_side",
		"_prefixmarkername"
		];


	_parameters = [
		"_sourceposition",
		"_destinationposition",
		"_arrayofvehicle",
		"_side",
		"_drawmarker",
		"_prefixmarkername"
		];

	_indexparameters = 0;
	_nbparameters = count _this;
	{
		if (_indexparameters <= _nbparameters) then {
		call compile format["%1 = _this select %2;", _x, _indexparameters];
		};
		_indexparameters = _indexparameters + 1;
	}foreach _parameters;

	_index = 0;
	_arrayofunits = [];
	_arrayreturn = [];

	if (isnil "_prefixmarkername") then {_prefixmarkername = "convoy_";};

	{
		_index = _index + 1;
		_sourceposition = [_sourceposition select 0, (_sourceposition select 1) + 20];
		_array = [_sourceposition, 0, _x, _side] call BIS_fnc_spawnVehicle;
		call compile format["
			_veh%1 = _array select 0;
			_crew%1 = _array select 1;
			if (_drawmarker) then { [_veh%1, '%2%1', 0.5, 'ColorRed', 'ICON', 'FDIAGONAL', 2, 'Flag', 0 , '%2%1'] spawn WC_fnc_attachmarker; };
			_veh%1 setVehicleInit '[this] spawn EXT_fnc_atot';
			_veh%1 addeventhandler ['killed', {_this spawn WC_fnc_garbagecollector}];
			_arrayofunits = _arrayofunits + _crew%1;
			_arrayreturn = _arrayreturn + [_veh%1];
		", _index, _prefixmarkername];
	} foreach _arrayofvehicle;

	_group = createGroup _side;
	{
		[_x] join _group;
	}foreach _arrayofunits;

	_wp = _group addWaypoint[_destinationposition, 0];

	_arrayreturn;