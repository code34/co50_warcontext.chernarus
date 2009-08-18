// -----------------------------------------------
// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// -----------------------------------------------
if (!isServer) exitWith {};

private [
	"_destinationposition",
	"_sourceposition",
	"_index",
	"_height",
	"_group",
	"_pos",
	"_dropPos",
	"_cargoRelPos",
	"_paraSize",
	"_paraName",
	"_paraPos",
	"_vehicle"
	];

	_vehicle		= _this select 0;
	_group			= _this select 1;

	_paraSize = 1;
	_paraName = "ParachuteWest";

	_dropPos = position _vehicle;

	_listofgroup = units _group;

	_index = 0;
	{
		_dropPos = position _vehicle;
		_pos = [(_dropPos select 0), (_dropPos select 1), (_dropPos select 2) - 30];
		_cargoRelPos = [0,0,0];
		_paraPos = [(_pos select 0) + (_cargoRelPos select 0), (_pos select 1) + (_cargoRelPos select 1), (_pos select 2) + (_cargoRelPos select 2)];

		_x setVelocity [(((velocity _vehicle) select 0) / 2),(((velocity _vehicle) select 1) / 2),((velocity _vehicle) select 2) - 25];
		_x setDir (direction _vehicle);

		_para = createvehicle [_paraName, _paraPos ,[],0,'NONE'];
		_para setDir (direction _vehicle);
		_para setVelocity [((velocity _x) select 0),((velocity _x) select 1) ,((velocity _x) select 2) ];
		_x attachTo [_para, [0,0,0], 'paraEnd'];
		sleep random 1;
	} foreach _listofgroup;

	player setpos [_pos select 0, _pos select 1, 0];
	true;