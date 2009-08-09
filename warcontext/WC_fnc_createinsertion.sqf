// -----------------------------------------------
// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext - Description:
// create an insertion point
// Example:
// [[0,0,0], "uh1", "anti-air_ru1"] execVM "WC_fnc_createinsertion.sqf";
// -----------------------------------------------
if (!isServer) exitWith{};

private [
	"_indexparameters",
	"_nbparameters",
	"_parameters",
	"_position",
	"_vehicle",
	"_composition",
	"_return"
	];

	//_position 	= _this select 0;
	//_vehicle 	= _this select 1;
	//_composition 	= _this select 2;

	_parameters = [
		"_position",
		"_vehicle",
		"_composition"
	];

	_indexparameters = 0;
	_nbparameters = count _this;
	{
		if (_indexparameters <= _nbparameters) then {
		call compile format["%1 = _this select %2;", _x, _indexparameters];
		};
		_indexparameters = _indexparameters + 1;
	}foreach _parameters;

	if (!isnil '_position') then {
		_position = [wcmaptopright, wcmapbottomleft, "notinforest"] call WC_fnc_createposition;
	};

	if (!isnil '_vehicle') then {
		_vehicle = createVehicle [_vehicle , _position, [], 20, 'NONE'];
		_vehicle addeventhandler ['killed', {_this spawn WC_fnc_garbagecollector}];
	};

	if (!isnil '_composition') then {
		nil = [_composition, 0, _position] call EXT_fnc_createcomposition;
	};

	_return = [_position, _vehicle, _composition];
	_return;