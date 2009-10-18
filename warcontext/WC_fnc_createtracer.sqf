// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext - Description:
// Attach a marker to an object
// -----------------------------------------------

private [
	"_arguments",
	"_caller",
	"_id",
	"_indexparameters",
	"_nbparameters",
	"_parameters",
	"_objecttotrace",
	"_objectname",
	"_target"
	];

	_parameters = [
		"_target",
		"_caller",
		"_id",
		"_objecttotrace",
		"_objectname"
		];

	_target = _this select 0;
	_caller = _this select 1;
	_id	= _this select 2;
	_arguments = _this select 3;
	_objecttotrace = _arguments select 0;
	_objectname = _arguments select 1;

	[_objecttotrace, _objectname, 1, 'ColorGreen', 'ICON', 'FDIAGONAL', 2, 'WARNING', 0 , _objectname] spawn WC_fnc_attachmarker; 