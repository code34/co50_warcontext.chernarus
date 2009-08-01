// -----------------------------------------------
// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// -----------------------------------------------
if (!isServer) exitWith{};

private [
	"_wcbeginingposition",
	"_objindex"
	];

	_objindex = _this select 0;

	//wcmaptopright 	= [14000, 2000];
	//wcmapbottomleft = [2000, 0];

	_wcbeginingposition = [wcmaptopright, wcmapbottomleft] call func_createposition;

	call compile format["wcbeginingposition%1 = _wcbeginingposition; publicvariable ""wcbeginingposition%1"";", _objindex];

	call compile format["_vehicle = createVehicle ['UH1Y', _wcbeginingposition, [], 20, 'NONE'];", _typeofvehicle];
	_vehicle addeventhandler ['killed', {_this spawn func_remove}];