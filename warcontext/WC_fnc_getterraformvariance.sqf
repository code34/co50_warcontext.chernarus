// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext - Description: 
// get the terraform variance on map. 
// More result is important more mountain there is
// Example:
// [[0,0,0], 500 ] execVM "WC_fnc_getterraformvariance.sqf";
// -----------------------------------------------

private [
	"_altitude",
	"_marker",
	"_slope",
	"_position1",
	"_position2",
	"_position3",
	"_position4",
	"_position5",
	"_position6",
	"_position7",
	"_position8",
	"_position9",
	"_gridofposition",
	"_size",
	"_variance"
	];

	_position	= _this select 0;
	_size		= _this select 1;

	_gridofposition = [_position, _size] call WC_fnc_creatematriceposition;
	_altitude = 0;
	_slope = 0;
	_variance = 0;

	{
		_object = "Logic" createVehicle _x;
		_altitude =  getposasl _object select 2;
		deletevehicle _object;
		_slope = _position select 2 - _altitude;
		if (_slope < 0) then { _slope * -1 };
		_variance = _slope + _variance;
	} foreach _gridofposition;

	_variance = _variance / 9;

	_variance;