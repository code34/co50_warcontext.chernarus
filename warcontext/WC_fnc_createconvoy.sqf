// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// Create a convoy - maximun of vehicles = 10
// -----------------------------------------------
if (!isServer) exitWith{};

	private [
		"_array1",
		"_array2",
		"_array3",
		"_array4",
		"_array5",
		"_array6",
		"_array7",
		"_array8",
		"_array9",
		"_array10",
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
		"_prefixvarname",
		"_prefixmarkername"
		];


	_parameters = [
		"_sourceposition",
		"_destinationposition",
		"_arrayofvehicle",
		"_side",
		"_drawmarker",
		"_prefixvarname",
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

	if (isnil "_prefixvarname") then {_prefixvarname = "wcvehko";};
	if (isnil "_prefixmarkername") then {_prefixmarkername = "veh";};

	_arrayreturn = [];
	{
		_index = _index + 1;
		_sourceposition = [_sourceposition select 0, (_sourceposition select 1) + 20];
		call compile format["_array%1 = [_sourceposition, 0, '%2', %3] call BIS_fnc_spawnVehicle;", _index, _x, _side];
		call compile format["
			_veh%1 = _array%1 select 0;
			_crew%1 = _array%1 select 1;
			if (_drawmarker) then { [_veh%1, '%2%1', 0.5, 'ColorRed', 'ICON', 'FDIAGONAL', 2, 'Flag', 0 , '%2%1'] spawn WC_fnc_attachmarker; };
			_arrayofunits = _arrayofunits + _crew%1;
		", _index, _prefixmarkername];
		call compile format["_arrayreturn = _arrayreturn + [ _veh%1, _crew%1];", _index];
	} foreach _arrayofvehicle;

	_group = createGroup _side;
	{
		[_x] join _group;
	}foreach _arrayofunits;

	_wp = _group addWaypoint[_destinationposition, 0];

	_index = 0;
	{
		_index = _index + 1;
		call compile format["_veh%1 addeventhandler ['killed', { %2%1 = true; }];", _index, _prefixvarname];
	}foreach _arrayofvehicle;

	_arrayreturn;